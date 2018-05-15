namespace LAAutomationTool.Modal
{
    public class ComparisonReportDetails
    {
        public string HTMLDocID { get; set; }

        public string XMLDocID { get; set; }

        public bool HasXMLFile { get; set; }

        public bool HasHTMLFile { get; set; }

        public string CompareStatus { get; set; }

        public string CompareXMLToHTML { get; set; }

        public string CompareHTMLToXML { get; set; }

        public string XMLFileName { get; set; }

    }
}
