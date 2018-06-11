using LAAutomationTool.Pages;
using System;

namespace LAAutomationTool
{
    /// <summary>
    /// This class describes to run the automation tool
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                TestLAPage page = new TestLAPage();
                Console.WriteLine("Enter input XML file path :");
                string inputXmlPath = Console.ReadLine();
                Console.WriteLine("Choose Environment Type  :");
                Console.WriteLine("1.Dev4 \n2.Dev8 ");
                Console.WriteLine("Enter number :");
                string envType = Console.ReadLine();
                Console.WriteLine("Enter report file path :");
                string reportPath = Console.ReadLine();
                page.GoToURL();
                page.SetEnvironmentType(envType);
                //page.SearchBundleLinkClick();
                page.ProcessBundleIds(inputXmlPath, reportPath);

                //page.ProcessHTMLFile();
                //page.ProcessXMLFile(inputXmlPath);
                //page.CompareXMLandHTMLFilesContent(reportPath);
                Console.WriteLine("Completed...");
                Console.ReadLine();
            }
            catch(Exception exception)
            {
                Console.WriteLine("Error message : " + exception.Message.ToString());
                Console.ReadLine();
            }
        }
    }
}
