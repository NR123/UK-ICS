using HtmlAgilityPack;
using LAAutomationTool.Helpers;
using LAAutomationTool.Modal;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using excel = Microsoft.Office.Interop.Excel;

namespace LAAutomationTool.Pages
{
    /// <summary>
    /// This class describes the framework page for LA
    /// </summary>
    public class TestLAPage
    {
        TestUtility util = new TestUtility();
        ConfigManager config = new ConfigManager();
        private string LAHtmlFilesPath = Environment.CurrentDirectory + "\\" + "LAHTMLFiles";
        private string excelFilePath = Environment.CurrentDirectory + "\\TestDataSheet.xlsx";       
        private string LAXMLFilesPath = Environment.CurrentDirectory + "\\" + "LAXMLFiles";
        private string inputXMLFilesPath = null;
        Dictionary<string, string> dictXmlFiles = new Dictionary<string, string>();
        Dictionary<string, string> dictHtmlFiles = new Dictionary<string, string>();
        List<string> duplicateXmlFilesName = new List<string>();
        List<string> duplicateHtmlFilesName = new List<string>();
        List<XMLFileInfo> xmlFileInfos = new List<XMLFileInfo>();

        /// <constructor>
        /// Constructor
        /// </constructor>
        public TestLAPage()
        {
            inputXMLFilesPath = config.InputXMLFilesPath;
        }

        /// <method>
        /// Navigate to the url
        /// </method>
        public void GoToURL()
        {
            util.GetDriver(config.BrowserType);
            //util.GoToURL(config.BaseURL);
            util.BrowserMaximize();
        }

        /// <method>
        /// Set the environment type
        /// </method>
        public void SetEnvironmentType()
        {
            string dropdownId = "environmentSelect";
            string value = config.Environment;
            switch(value)
            {
                case "dev4":
                    //util.SetDropdownText(dropdownId, value);
                    util.GoToURL(config.Dev4URL);
                    break;
                case "dev8":
                    util.GoToURL(config.Dev8URL);
                    SearchBundleLinkClick();
                    break;
            }            
        }

        /// <method>
        /// Click the search bundle link
        /// </method>
        public void SearchBundleLinkClick()
        {
            string linkText = "Search Bundle/PCSI/LNI/DocID/CiteDef";
            util.AnchorTagClick(linkText);
        }

        /// <method>
        /// Set bundle id value to textbox
        /// </method>
        public void SetBundleIdValue()
        {
            string textboxId = "bundleid";
            util.SetTextboxValue(textboxId, "1");
        }

        /// <method>
        /// Submit button click
        /// </method>
        public void SubmitButtonClick()
        {
            string pathId = "//input[type='submit']";
            util.ButtonClickByPath(pathId);
        }

        /// <method>
        /// Read bundle ids from excel file and process it
        /// </method>
        public void ProcessBundleIds()
        {
            var bundleIds = ReadExcelData();
            string bundleTextboxId = "bundleid";
            string searchButtonPath = "//input[@type='submit']";
            string docCountPath = "//center/table[@class='tealtable']/tbody/tr[2]/td[8]/a";

            // If files exist then delete All files from the directory else create directory 
            if (Directory.Exists(LAHtmlFilesPath))
            {
                foreach (string file in Directory.GetFiles(LAHtmlFilesPath))
                {
                    File.Delete(file);
                }
            }
            else
            {
                Directory.CreateDirectory(LAHtmlFilesPath);
            }

            //Console.WriteLine(" HTML files downloading ...");
            foreach (string bundleId in bundleIds.Skip(1).ToList())
            {
                util.SetTextboxValue(bundleTextboxId, bundleId);
                util.ButtonClickByPath(searchButtonPath);
                util.AnchorTagClickByPath(docCountPath);
                util.AnchorTagClick("Show All");
                //util.WaitUntilPageLoaded();
                ProcessTableData();
                util.NavigateBack();                // This back is to display first 500 records
                util.NavigateBack();                // This back is to go to bundle Id search page
            }
            //Console.WriteLine(" XML files processing ...");
            ProcessXMLFile();
            //Console.WriteLine(" HTML files processing ...");
            ProcessHTMLFile();           
            DisplayDuplicateXmlFilesName(duplicateXmlFilesName);
            DisplayDuplicateHtmlFilesName(duplicateHtmlFilesName);
            CompareXMLandHTMLFilesContent();
        }

        /// <method>
        /// Read all the table data and process it
        /// </method>
        public void ProcessTableData()
        {
            string tablePath = "//table[@id='tbl']";
            int rowCount = util.GetTableRowCount(tablePath);
            for (int i = 2; i <= rowCount; i++)
            {
                //string URIPath = tablePath + "/tbody/tr[" + i + "]/td[2]/a";                  // Get URIs column text
                //string URLText = util.GetTextByPath(URIPath);
                //string fileName = Path.GetFileNameWithoutExtension(URLText);
                string docId = tablePath + "/tbody/tr[" + i + "]/td[4]";                        // Get Doc-Ids column text
                string docIdText = util.GetTextByPath(docId);
                string delimiter = "_";
                string fileName = docIdText.Replace("-", "_").Split('_').Skip(1).Aggregate((x, y) => x + delimiter + y);
                string stylesSheetPath = tablePath + "/tbody/tr[" + i + "]/td[6]/a";            // Get anchor tag of style sheet column. 
                string attributeText = util.GetAttributeValueByPath(stylesSheetPath, "href");   // Get  attribute name                
                var res = DownloadHTMLFile(attributeText, fileName);
                //ProcessHTMLFile(attributeText, fileName, i-1);                
            }
        }

        /// <method>
        /// Download HTML page as HTML file into local folder
        /// </method>
        public async Task DownloadHTMLFile(string url, string fileName)
        {
            try
            {
                using (WebClient webClient = new WebClient())
                {
                    webClient.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";
                    CredentialCache cc = new CredentialCache();
                    cc.Add(new Uri(url), "Basic", new NetworkCredential(config.UserName, config.Password));
                    webClient.Credentials = cc;
                    string location = LAHtmlFilesPath + "\\" + fileName + ".html";
                    await webClient.DownloadFileTaskAsync(new Uri(url), location);
                    Console.WriteLine("HTML file download complete : " + fileName);
                }
            }
            catch (Exception exception)
            {
                Console.WriteLine("Failed to download File : " + fileName +" , Error : "+exception.Message.ToString());
            }
        }

        /// <method>
        /// Read the HTML content directly from the url into dictionary
        /// </method>
        public void ProcessHTMLFile(string url, string fileName, int seqNo)
        {
            try
            {               
                using (WebClient webClient = new WebClient())
                {
                    webClient.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";
                    CredentialCache cc = new CredentialCache();
                    cc.Add(new Uri(config.BaseURL), "Basic", new NetworkCredential(config.UserName, config.Password));
                    webClient.Credentials = cc;
                    string htmlContent = webClient.DownloadString(new Uri(url));
                    string removeXmlElement = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
                    htmlContent = htmlContent.Replace(removeXmlElement, "");

                    HtmlDocument document = new HtmlDocument();
                    document.LoadHtml(htmlContent);
                    var root = document.DocumentNode;
                    var sb = new StringBuilder();
                    //Get the content of the Html file and store it in StringBuilder
                    foreach (var node in root.DescendantNodesAndSelf())
                    {
                        if (!node.HasChildNodes)
                        {
                            string text = node.InnerText;
                            if (!string.IsNullOrEmpty(text))
                                sb.AppendLine(text.Trim());
                        }
                    }

                    //Check fileName is already exist or not
                    if (dictHtmlFiles.ContainsKey(fileName) == true)
                    {
                        duplicateHtmlFilesName.Add(fileName);                   /* Add if duplicate file available */
                    }
                    else
                    {
                        dictHtmlFiles.Add(fileName, sb.ToString());             /* Add Html string into dictionary */
                    }
                    Console.WriteLine(seqNo + " HTML file Processed : " + fileName);
                }
            }
            catch (Exception exception)
            {
                Console.WriteLine("Failed : " + exception.Message.ToString());
            }
        }

        /// <method>
        /// Read the HTML content from the file into dictionary
        /// </method>
        public void ProcessHTMLFile()
        {
            try
            {                
                int i=0;
                foreach (string path in Directory.GetFiles(LAHtmlFilesPath))
                {
                    string fileName = Path.GetFileNameWithoutExtension(path);
                    HtmlDocument document = new HtmlDocument();
                    document.Load(path,Encoding.UTF8);
                    var root = document.DocumentNode;
                    var sb = new StringBuilder();
                    //Get the content of the Html file and store it in StringBuilder
                    foreach (var node in root.DescendantNodesAndSelf())
                    {
                        if (!node.HasChildNodes)
                        {
                            string text = node.InnerText;
                            if (!string.IsNullOrEmpty(text))
                                sb.AppendLine(text.Trim());
                        }
                    }
                    string removeXmlElement = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
                    sb = sb.Replace(removeXmlElement, "");
                    //Check fileName is already exist or not
                    if (dictHtmlFiles.ContainsKey(fileName) == true)
                    {
                        duplicateHtmlFilesName.Add(fileName);                           /* Add if duplicate file available */
                    }
                    else
                    {
                        dictHtmlFiles.Add(fileName, sb.ToString());                     /* Add Html string into dictionary */
                    }
                    Console.WriteLine(++i + " HTML file Processed : " + fileName);
                }
            }
            catch (Exception exception)
            {
                Console.WriteLine("Failed : " + exception.Message.ToString());
            }
        }

        /// <method>
        /// Read the XML content from file into dictionary
        /// </method>
        public void ProcessXMLFile()
        {
            int seqNo = 0;
            
            // If files exist then delete All files from the directory else create directory 
            if (Directory.Exists(LAXMLFilesPath))
            {
                foreach (string file in Directory.GetFiles(LAXMLFilesPath))
                {
                    File.Delete(file);
                }
            }
            else
            {
                Directory.CreateDirectory(LAXMLFilesPath);
            }
                        
            //Get the XML files from input path and read the content and store it in XML dictionary
            foreach (string path in Directory.GetFiles(inputXMLFilesPath))
            {               
                StringBuilder sb = new StringBuilder();
                bool isDocIdElement = false;
                string docId = string.Empty;
                string docIdElementName = "docinfo:doc-id";
                XmlTextReader xmlReader = new XmlTextReader(path);
                while (xmlReader.Read())
                {
                    switch (xmlReader.NodeType)
                    {
                        case XmlNodeType.Element:
                            if (xmlReader.Name.ToLower() == docIdElementName)
                                isDocIdElement = true;
                            break;
                        case XmlNodeType.Text:
                            if (isDocIdElement)
                            {
                                docId = xmlReader.Value;
                                isDocIdElement = false;
                            }

                            sb.AppendLine(xmlReader.Value.Trim());
                            break;
                        case XmlNodeType.EndElement:
                            break;
                    }
                }

                docId = docId.Replace("-", "_");
                string xmlFileName = LAXMLFilesPath + "\\" + docId + ".txt";
                File.WriteAllText(xmlFileName, sb.ToString());
                Console.WriteLine(++seqNo + " XML file Processed : " + docId);

                
                //Check docId is already exist or not
                if (dictXmlFiles.ContainsKey(docId) == true)
                {
                    duplicateXmlFilesName.Add(docId);
                }
                else
                {
                    dictXmlFiles.Add(docId, sb.ToString());
                    var xmlInfo = new XMLFileInfo()
                    {
                        XMLFileName = Path.GetFileName(path),
                        XMLDocID = docId
                    };
                    xmlFileInfos.Add(xmlInfo);
                }                            
            }            
        }

        /// <method>
        /// To display available dictionary keys
        /// </method>
        public void DisplayDictionaryKeys(Dictionary<string, string> dict)
        {
            int i = 0;
            foreach (KeyValuePair<string, string> pair in dict)
            {
                Console.WriteLine(++i + " : " + pair.Key.ToString());
            }
        }

        /// <method>
        /// To display duplicate XML file name
        /// </method>
        public void DisplayDuplicateXmlFilesName(List<string> duplicate)
        {
            int i = 0;
            Console.WriteLine("Duplicate XML files are : ");
            foreach (string name in duplicate)
            {
                Console.WriteLine(++i + " : " + name);
            }
        }

        /// <method>
        /// To display duplicate HTML file name
        /// </method>
        public void DisplayDuplicateHtmlFilesName(List<string> duplicate)
        {
            int i = 0;
            Console.WriteLine("Duplicate HTML files are : ");
            foreach (string name in duplicate)
            {
                Console.WriteLine(++i + " : " + name);
            }
        }

        /// <method>
        /// Read data from excel
        /// </method>
        public List<string> ReadExcelData()
        {

            List<string> bundleList = new List<string>();
            //Creates excel application
            excel.Application x1Appl = new excel.Application();
            //Creates excel workbook object for specified file
            excel.Workbook x1WorkBook = x1Appl.Workbooks.Open(excelFilePath);
            //Creates excel work sheet object for sheet 1
            excel._Worksheet x1WorkSheet = x1WorkBook.Sheets[1];
            //Gets used range of excel file(here range is 3)
            excel.Range x1Range = x1WorkSheet.UsedRange;
            for (int i = 1; i <= x1Range.Count; i++)
            {
                //Gets cell value of 'i'th row and 1st column value
                string bundleId = x1Range.Cells[i][1].value2.ToString();
                bundleList.Add(bundleId);
            }
            x1WorkBook.Close(true);
            x1Appl.Quit();

            return bundleList;
        }

        /// <method>
        /// Compare the XML and HTML file contents
        /// </method>
        public void CompareXMLandHTMLFilesContent()
        {
            List<ComparisonReportDetails> result = new List<ComparisonReportDetails>();
            Console.WriteLine("Compare and generating Report ... ");
            foreach (KeyValuePair<string, string> xmlPair in dictXmlFiles)
            {
                var record = new ComparisonReportDetails();
                string xmlKey = xmlPair.Key.ToString();
                record.XMLDocID = xmlKey;
                record.HasXMLFile = true;

                //Check whether the html file is exist or not with corresponding xml file
                if (dictHtmlFiles.ContainsKey(xmlPair.Key.ToString()) == true)
                {
                    record.HasHTMLFile = true;
                    record.HTMLDocID = xmlKey;
                    string xmlValue = xmlPair.Value.ToString();
                    string htmlValue = dictHtmlFiles[xmlKey].ToString();
                    var splitXmlValue = xmlValue.Replace(","," ").Split(new string[] { "\r\n" }, StringSplitOptions.None);
                    var splitHtmlValue = htmlValue.Replace(",", " ").Split(new string[] { "\r\n" }, StringSplitOptions.None);

                    var compareXmlToHtml = splitXmlValue.Except(splitHtmlValue).ToArray();
                    var compareHtmlToXml = splitHtmlValue.Except(splitXmlValue).ToArray();

                    record.CompareXMLToHTML = string.Join("\n", compareXmlToHtml);
                    record.CompareHTMLToXML = string.Join("\n", compareHtmlToXml);
                    if (xmlPair.Value.ToString() == dictHtmlFiles[xmlKey].ToString())
                    {
                        record.CompareStatus = "Matched";
                    }
                    else
                    {
                        record.CompareStatus = "Not Matched";
                    }
                }
                else
                {
                    record.HasHTMLFile = false;
                    record.CompareStatus = "Dropped";
                }

                record.XMLFileName = xmlFileInfos.First(x => x.XMLDocID == xmlKey).XMLFileName;
                result.Add(record);
            }
                        
            GenerateReport(result);
        }

        /// <method>
        /// Generate the excel report
        /// </method>
        public void GenerateReport(List<ComparisonReportDetails> result)
        {
            //StringBuilder sb = new StringBuilder();
            ////Heading
            //sb.AppendLine(string.Format("XML DocID, HTML DOCID, HasXMLFile, HasHTMLFile, CompareXMLToHTML, CompareHTMLToXML, ComparisonResult"));
            ////Content
            //foreach (ComparisonReportDetails res in result)
            //{
            //    sb.AppendLine(string.Format("{0},{1},{2},{3},{4},{5},{6}", res.XMLDocID , res.HTMLDocID , res.HasXMLFile , res.HasHTMLFile,res.CompareXMLToHTML,res.CompareHTMLToXML, res.CompareStatus));                
            //}
            //string path = Environment.CurrentDirectory + "\\" + "Reports_" + DateTime.Now.ToString().Replace(":","-")+".csv";
            //File.WriteAllText(path, sb.ToString());


            //Excel Report
            excel.Application xlAppl = new excel.Application();

            if(xlAppl == null)
            {
                Console.WriteLine("Excel is not properly installed!!");
                return;
            }
            //Creates excel workbook object for specified file
            excel.Workbook xlWorkBook = xlAppl.Workbooks.Add(Type.Missing);
            // Creates excel work sheet object for sheet 1 
            excel._Worksheet xlWorkSheet = xlWorkBook.Sheets[1];
            int i = 2;
            xlWorkSheet.Cells[1, 1] = "XML DocID";
            xlWorkSheet.Cells[1, 1].EntireRow.Font.Bold = true;            
            xlWorkSheet.Cells[1, 2] = "HTML DOCID";
            xlWorkSheet.Cells[1, 3] = "HasXMLFile";
            xlWorkSheet.Cells[1, 4] = "HasHTMLFile";
            xlWorkSheet.Cells[1, 5] = "CompareXMLToHTML";
            xlWorkSheet.Cells[1, 6] = "CompareHTMLToXML"; 
            xlWorkSheet.Cells[1, 7] = "ComparisonResult";
            xlWorkSheet.Cells[1, 8] = "XML FileName";

            foreach (var res in result)
            {
                xlWorkSheet.Cells[i, 1] = res.XMLDocID;
                xlWorkSheet.Cells[i, 2] = res.HTMLDocID;
                xlWorkSheet.Cells[i, 3] = res.HasXMLFile;
                xlWorkSheet.Cells[i, 4] = res.HasHTMLFile;
                xlWorkSheet.Cells[i, 5] = res.CompareXMLToHTML;
                xlWorkSheet.Cells[i, 6] = res.CompareHTMLToXML;
                xlWorkSheet.Cells[i, 7] = res.CompareStatus;
                xlWorkSheet.Cells[i, 8] = res.XMLFileName;
                i++;
            }
            string path = Environment.CurrentDirectory + "\\" + "Reports_" + DateTime.Now.ToString().Replace(":", "-") + ".xlsx";
            xlWorkBook.SaveAs(path);

            xlWorkBook.Close(true);
            xlAppl.Quit();

            Console.WriteLine("Find report : " + path);
        }
    }

}
