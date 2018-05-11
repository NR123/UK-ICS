using System;

namespace FileHandlingApplication.Modal
{
    /// <summary>
    /// This modal is for file informtion table
    /// </summary>
    public class FileInformationModal
    {
        public int No { get; set; }

        public string DPSI { get; set; }

        public int XMLFileCount { get; set; }

        public int ImageCount { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime UpdatedDate { get; set; }

        public int PathID { get; set; }
    }
}
