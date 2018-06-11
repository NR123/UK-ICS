using System.Collections.Generic;

namespace LAAutomationTool.Modal
{
    /// <summary>
    /// This modal class is for the XML file information 
    /// </summary>
    public class XMLFileInfo
    {
        public string XMLFileName { get; set; }

        public string XMLDocID { get; set; }

        public List<ReadXMLContentInfo> ReadXMLDocInfos { get; set; }
    }
}
