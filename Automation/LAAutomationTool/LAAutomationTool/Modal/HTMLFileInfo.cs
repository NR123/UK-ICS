using System.Collections.Generic;

namespace LAAutomationTool.Modal
{
    /// <summary>
    /// This modal class is for the HTML file information 
    /// </summary>
    public class HTMLFileInfo
    {
        public string HTMLDocID { get; set; }

        public List<ReadHTMLContentInfo> ReadHTMLDocInfos { get; set; }
    }
}
