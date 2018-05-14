using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Linq;

namespace LAAutomationTool.Helpers
{
    /// <summary>
    /// This class describes the generic test methods and which is used across the application
    /// </summary>
    public class TestUtility
    {
        private string driverDirectory = Environment.CurrentDirectory + @"\Drivers";
        private static IWebDriver driver;
        ConfigManager config = new ConfigManager();

        /// <method>
        /// Initialize the browser driver
        /// </method>
        public void GetDriver(string browser)
        {           
            switch(browser)
            {
                case "Chrome":
                    driver = new ChromeDriver(driverDirectory);
                    driver.Manage().Timeouts().PageLoad = TimeSpan.FromSeconds(300);
                    break;
                case "FireFox":
                    driver = new FirefoxDriver(driverDirectory);
                    break;                
            }            
        }

        /// <method>
        /// Navigate to the url
        /// </method>
        public void GoToURL(string url)
        {
            driver.Navigate().GoToUrl(url);            
        }

        /// <method>
        /// Maximize the browser window
        /// </method>
        public void BrowserMaximize()
        {
            driver.Manage().Window.Maximize();
        }

        /// <method>
        /// Navigate back from the current page
        /// </method>
        public void NavigateBack()
        {
            driver.Navigate().Back();
        }

        /// <method>
        /// Set dropdown text
        /// </method>
        public void SetDropdownText(string dropdownId, string text)
        {
            var element = driver.FindElement(By.Id(dropdownId));
            var selectElement = new SelectElement(element);
            selectElement.SelectByText(text);
        }

        /// <method>
        /// Anchor tag click
        /// </method>
        public void AnchorTagClick(string linkText)
        {
            List<IWebElement> links = driver.FindElements(By.LinkText(linkText)).ToList();
            links.First(element => element.Text == linkText).Click();
            WaitUntilPageLoaded();
        }

        /// <method>
        /// Anchor tag click by path
        /// </method>
        public void AnchorTagClickByPath(string path)
        {
            driver.FindElement(By.XPath(path)).Click();
        }

        /// <method>
        /// Set text box value 
        /// </method>
        public void SetTextboxValue(string textboxId, string value)
        {
            driver.FindElement(By.Id(textboxId)).Clear();
            driver.FindElement(By.Id(textboxId)).SendKeys(value);
        }

        /// <method>
        /// Button click by path
        /// </method>
        public void ButtonClickByPath(string path)
        {
            //var wait = new WebDriverWait(driver, TimeSpan.FromSeconds(300));
            driver.FindElement(By.XPath(path)).Click();
            WaitUntilPageLoaded();
          
        }

        /// <method>
        /// Get table row count by path
        /// </method>
        public int GetTableRowCount(string path)
        {
            var elemTable = driver.FindElement(By.XPath(path));
            var elemRows = elemTable.FindElements(By.TagName("tr"));
            return elemRows.Count;
        }

        //public void GetTableData(string path)
        //{

        //    var elemTable = driver.FindElement(By.XPath(path));
        //    var elemRows = elemTable.FindElements(By.TagName("tr"));           
        //    TestLAPage la = new TestLAPage();
        //    foreach (var row in elemRows.Skip(1))
        //    {
        //        var elemTds = row.FindElements(By.TagName("td"));
        //        var uriPath = elemTds.ElementAt(1).FindElement(By.TagName("a")).Text;
        //        var ssLink = elemTds.ElementAt(5).FindElement(By.TagName("a")).GetAttribute("href");

        //        string fileName = Path.GetFileNameWithoutExtension(uriPath);
        //        var a = la.DownloadHTMLFile(ssLink, fileName);
        //        Console.WriteLine("Name : " + uriPath + "  "+ DateTime.Now.ToString());
        //    }           
        //}

        /// <method>
        /// Get text by path
        /// </method>
        public string GetTextByPath(string path)
        {
            var elemText = driver.FindElement(By.XPath(path)).Text;
            return elemText;
        }

        /// <method>
        /// Get attribute value by path
        /// </method>
        public string GetAttributeValueByPath(string path,string attrName)
        {
            var elemText = driver.FindElement(By.XPath(path)).GetAttribute(attrName);
            return elemText;
        }

        /// <method>
        /// Wait until page load complete
        /// </method>
        public void WaitUntilPageLoaded()
        {
           var wait = new WebDriverWait(driver, TimeSpan.FromSeconds(300)).Until(
                             d => ((IJavaScriptExecutor)d).ExecuteScript("return document.readyState").Equals("complete"));
        }
    }
}
