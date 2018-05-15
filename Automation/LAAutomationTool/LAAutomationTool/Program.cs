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
                page.GoToURL();
                page.SetEnvironmentType();
                //page.SearchBundleLinkClick();
                page.ProcessBundleIds();
                //page.ProcessHTMLFile();
                //page.ProcessXMLFile();
                //page.CompareXMLandHTMLFilesContent();
                Console.WriteLine("Completed...");
                Console.ReadLine();
            }
            catch(Exception exception)
            {
                Console.WriteLine("Error message : " + exception.Message.ToString());
            }
        }
    }
}
