using FileHandlingApplication.DataLayer;
using FileHandlingApplication.Modal;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.IO.Compression;
using System.Linq;

namespace FileHandlingApplication.BusinessLayer
{
    /// <summary>
    /// This class handles the file informtion
    /// </summary>
    public class FileProcessBL
    {
        private FileProcessDL _fileProcessDL;

        /// <constructor>
        /// Constructor
        /// </constructor>
        public FileProcessBL()
        {
            _fileProcessDL = new FileProcessDL();
        }

        /// <method>
        /// Read file information
        /// </method>
        public void ReadFileInformation(string path, int pathId = 0, bool isPathExist = false)
        {            
            var xmlFiles = Directory.EnumerateFiles(path, "*.*", SearchOption.TopDirectoryOnly).Where(s => s.EndsWith(".xml"));
            var imageFiles = Directory.EnumerateFiles(path, "*.*",SearchOption.TopDirectoryOnly).Where(s => s.EndsWith(".jpeg") || s.EndsWith(".gif") || s.EndsWith(".pdf"));
            var zipFiles = Directory.EnumerateFiles(path, "*.*", SearchOption.TopDirectoryOnly).Where(s => s.EndsWith(".zip"));

            /* Insert input path into table */
            PathModal addPath = new PathModal()
            {
                PathName = path.Trim(),
                CreatedDate = DateTime.Now
            };
            if(!isPathExist)
            {
                bool pathResult = _fileProcessDL.AddFilePath(addPath);
                pathId = GetFilePath(path).PathID;
            }           

            List<FileInformationModal> fileInfoList = new List<FileInformationModal>();
            List<FileInformationModal> finalList = new List<FileInformationModal>();

            /* Get XMl files information */
            foreach (string xmlFile in xmlFiles)
            {
                string dpsiValue = GetDPSIValue(xmlFile);
                FileInformationModal addFileInfo = new FileInformationModal()
                {
                    DPSI = dpsiValue,
                    PathID = pathId,
                    XMLFileCount = 1         // Handling with single file
                };
                fileInfoList.Add(addFileInfo);
            }

            /*Get other files information like image, pdf and etc */
            foreach(string imgFile in imageFiles)
            {
                string dpsiValue = GetDPSIValue(imgFile);
                FileInformationModal addFileInfo = new FileInformationModal()
                {
                    DPSI = dpsiValue,
                    PathID = pathId,
                    ImageCount = 1         // Handling with single file
                };
                fileInfoList.Add(addFileInfo);
            }

            /*Get zip files information */
            foreach (string zipFile in zipFiles)
            {
                string dpsiValue = GetDPSIValue(zipFile);
                int xmlCount = 0;
                int otherCount = 0;
                using (ZipArchive archive = ZipFile.OpenRead(zipFile))
                {
                    foreach (ZipArchiveEntry entry in archive.Entries)
                    {
                        if (entry.FullName.EndsWith(".xml", StringComparison.OrdinalIgnoreCase))
                        {
                            xmlCount++;
                        }
                        else
                        {
                            otherCount++;
                        }
                    }
                    FileInformationModal addFileInfo = new FileInformationModal()
                    {
                        DPSI = dpsiValue,
                        PathID = pathId,
                        XMLFileCount = xmlCount,
                        ImageCount = otherCount
                    };
                    fileInfoList.Add(addFileInfo);
                }                
            }

            finalList = (from rec in fileInfoList
                      group rec by rec.DPSI into g
                      select new FileInformationModal
                      {
                          PathID = g.Select(x => x.PathID).First(),
                          DPSI = g.Key,
                          XMLFileCount = g.Sum(x => x.XMLFileCount),
                          ImageCount = g.Sum(x => x.ImageCount)
                      }).ToList();

            List<FileInformationModal> existFileInfoList = GetFileInformation();

            /* Insert or update fileinfo based on availability in database */
            foreach (FileInformationModal info in finalList)
            {
                var existFileInfo = existFileInfoList.Where(x => x.DPSI == info.DPSI && x.PathID == pathId).FirstOrDefault();
                if (existFileInfo == null)
                {
                    info.CreatedDate = DateTime.Now;
                    info.UpdatedDate = DateTime.Now;
                    var fileInfoResult = _fileProcessDL.AddFileInformation(info);                    
                }
                else
                {
                    info.XMLFileCount += existFileInfo.XMLFileCount;
                    info.ImageCount += existFileInfo.ImageCount;
                    info.UpdatedDate = DateTime.Now;
                    var fileInfoResult = _fileProcessDL.UpdateFileInformation(info);
                }                
            }
        }

        /// <method>
        /// Get DPSI Value
        /// </method>
        public string GetDPSIValue(string filePath)
        {
            string fileName = Path.GetFileNameWithoutExtension(filePath);
            string[] splitFileName = fileName.Replace("-", "_").Split('_');
            string dpsiValue;
            if (splitFileName[0] == "GBR")
            {
                dpsiValue = splitFileName[1];
            }
            else
            {
                dpsiValue = splitFileName[0];
            }
            return dpsiValue;
        }

        /// <method>
        /// Get file information
        /// </method>
        public List<FileInformationModal> GetFileInformation()
        {
           var dtFileList = _fileProcessDL.GetFileInformation();
           var list = (from DataRow row in dtFileList.Rows
                       select new FileInformationModal {
                           No = Convert.ToInt32(row["No"]),
                           PathID = Convert.ToInt32(row["PathID"]),
                           DPSI = row["DPSI"].ToString(),
                           XMLFileCount = Convert.ToInt32(row["XMLFileCount"]),
                           ImageCount = Convert.ToInt32(row["ImageCount"]),
                           CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                           UpdatedDate = Convert.ToDateTime(row["UpdatedDate"])
                       }).ToList();
            return list;
        }

        /// <method>
        /// Get file information by path
        /// </method>
        public List<FileInformationModal> GetFileInformationbyPath(int pathId)
        {
            var dtFileList = _fileProcessDL.GetFileInformationByPath(pathId);
            var list = (from DataRow row in dtFileList.Rows
                        select new FileInformationModal
                        {
                            No = Convert.ToInt32(row["No"]),
                            PathID = Convert.ToInt32(row["PathID"]),
                            DPSI = row["DPSI"].ToString(),
                            XMLFileCount = Convert.ToInt32(row["XMLFileCount"]),
                            ImageCount = Convert.ToInt32(row["ImageCount"]),
                            CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                            UpdatedDate = Convert.ToDateTime(row["UpdatedDate"])
                        }).ToList();
            return list;
        }

        /// <method>
        /// Get file path
        /// </method>
        public PathModal GetFilePath(string path)
        {
            DataTable pathDetail = _fileProcessDL.GetFilePath(path);
            PathModal currentPathInfo = (from DataRow row in pathDetail.Rows
                                         select new PathModal
                                         {
                                             PathID = Convert.ToInt32(row["PathID"]),
                                             PathName = row["Path"].ToString(),
                                             CreatedDate = Convert.ToDateTime(row["CreatedDate"])
                                         }).FirstOrDefault();

            return currentPathInfo;
        }

        /// <method>
        /// Delete file inofrmation by path
        /// </method>
        public bool DeleteFileInformationByPath(int pathId)
        {
           bool result = _fileProcessDL.DeleteFileInformationByPath(pathId);
            return result;
        }
    }
}
