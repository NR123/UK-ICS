using LookupsDataProcessApplication.DataLayer;
using StackExchange.Redis;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml;

namespace LookupsDataProcessApplication.BusinessLayer
{
    /// <summary>
    /// This class handles extract and store datas from XML files
    /// </summary>
    public class DataProcessBL
    {
        private DataProcessDAL _dataAccessDAL;

        /// <constructor>
        /// Constructor
        /// </constructor>
        public DataProcessBL()
        {
            _dataAccessDAL = new DataProcessDAL();
        }

        /// <method>
        /// Add lookup file datas into redis database
        /// </method>
        public void AddLookupFileDatas(string path)
        {                    
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Key , Status , FileName");

            /*Read all XML files from input directory */
            string[] files = Directory.GetFiles(path , "*.xml");
            foreach (string file in files)
            {
                string fileName = Path.GetFileNameWithoutExtension(file);
                /* Read data from XML file */
                XmlDocument document = new XmlDocument();
                document.Load(file);
                string docidValue = string.Empty;
                string dpsiValue = string.Empty;
                string refptValue = string.Empty;

                /*Get docid node collection */
                XmlNodeList docidnode = document.GetElementsByTagName("docinfo:doc-id");
                foreach (XmlNode node in docidnode)
                {
                   docidValue = node.InnerText;                                        
                }
                                
                /*Get dpsi node collection */
                XmlNodeList dpsinode = document.GetElementsByTagName("docinfo:dpsi");
                foreach (XmlNode node in dpsinode)
                {
                   dpsiValue = node.Attributes["id-string"].Value;
                }

                string filtereddocid = Regex.Replace(docidValue, "[^0-9A-Za-z]+", string.Empty).ToLower();
                string filtereddpsi = Regex.Replace(dpsiValue, "[^0-9A-Za-z]+", string.Empty).ToLower();
                string dpsikey = "dpsi:" + filtereddocid + ":" + filtereddpsi;
                HashSetAttributeModal addHSDpsi = new HashSetAttributeModal();

                if (!string.IsNullOrWhiteSpace(docidValue) && !string.IsNullOrWhiteSpace(dpsiValue))
                {
                    var hashEntries = new HashEntry[]{ new HashEntry("DOCID", docidValue), new HashEntry("DPSI", dpsiValue) };
                    addHSDpsi.Key = dpsikey;
                    addHSDpsi.HashEntries = hashEntries;
                    addHSDpsi.Status = "Added";
                    _dataAccessDAL.AddDataInHashSet(addHSDpsi);
                }
                else
                {
                    addHSDpsi.Status = "Either DocID or DPSI is not available.";                   
                }                          
                sb.AppendLine(dpsikey + " , "+ addHSDpsi.Status +" , "+ fileName);

                /*Get refpt node collection */
                XmlNodeList refptnode = document.GetElementsByTagName("refpt");
                foreach (XmlNode node in refptnode)
                {
                   refptValue = node.Attributes["id"] == null ? string.Empty : node.Attributes["id"].Value;
                    string filteredrefpt = Regex.Replace(refptValue, "[^0-9A-Za-z]+", string.Empty).ToLower();
                    string refptkey = "refpt:" + filtereddocid + ":" + filteredrefpt;
                    HashSetAttributeModal addHSrefpt = new HashSetAttributeModal();

                    if (!string.IsNullOrWhiteSpace(docidValue) && !string.IsNullOrWhiteSpace(refptValue))
                    {                        
                        var hashEntries = new HashEntry[] { new HashEntry("DOCID", docidValue), new HashEntry("REFPTID", refptValue) };
                        addHSrefpt.Key = refptkey;
                        addHSrefpt.HashEntries = hashEntries;
                        addHSrefpt.Status = "Added";
                        _dataAccessDAL.AddDataInHashSet(addHSrefpt);
                    }
                    else
                    {
                        addHSrefpt.Status = "Either DocID or REFPT ID is not available.";                       
                    }  
                    sb.AppendLine(refptkey + " , " + addHSrefpt.Status + " , " + fileName);
                }
            }
            string logFileName = "Log_" + DateTime.Now.ToString().Replace(":", "-") + ".csv";
            string logFilePath = Environment.CurrentDirectory + "\\" + logFileName;
            File.WriteAllText(logFilePath, sb.ToString());
            Console.WriteLine("Find the log file : " + logFilePath); 
        }

        /// <method>
        /// Add datas into redis database
        /// </method>
        public void AddDataInHashSet(List<HashSetAttributeModal> rows)
        {
            foreach (HashSetAttributeModal row in rows)
            {
                _dataAccessDAL.AddDataInHashSet(row);                  
            }            
        }

        /// <method>
        /// Get all datas from redis database
        /// </method>
        public void GetAllDataFromRedis()
        {
            var keys = _dataAccessDAL.GetAllKeysFromRedis();

            foreach (RedisKey key in keys)
            {
                GetDataByKeyFromRedis(key);
            }
            Console.WriteLine();
        }

        /// <method>
        /// Get datas by pattern from redis database
        /// </method>
        public void GetDatasByPattern(string patternString)
        {
            var keys = _dataAccessDAL.GetKeysByPattern(patternString);

            foreach (RedisKey key in keys)
            {
                GetDataByKeyFromRedis(key);
            }
            Console.WriteLine();
        }
        
        /// <method>
        /// Get specific data by key from redis database
        /// </method>
        public void GetDataByKeyFromRedis(RedisKey key)
        {
            var keyType = _dataAccessDAL.GetKeyType(key);
            Console.WriteLine("Key : " + key.ToString());
            /* Filter values based on type and keys */
            switch (keyType)
            {
                case "String":
                    string value = _dataAccessDAL.GetStringValue(key);
                    Console.Write(string.Format("{0} , ", value));
                    break;
                case "List":
                    var listValues = _dataAccessDAL.GetListValues(key);
                    foreach (var listValue in listValues)
                    {
                        Console.WriteLine(string.Format("{0} ,", listValue.ToString()));
                    }
                    break;
                case "Hash":
                    var allHash = _dataAccessDAL.GetAllHashValues(key);
                    foreach (var item in allHash)
                    {
                        Console.Write(string.Format("{0} : {1}, ", item.Name, item.Value));
                    }

                    break;
                case "Set":
                    var setValues = _dataAccessDAL.GetSetValues(key);
                    foreach (var setValue in setValues)
                    {
                        Console.WriteLine(string.Format("{0} ,", setValue.ToString()));
                    }
                    break;
                case "SortedSet":
                    var zsetValues = _dataAccessDAL.GetSortedSetValues(key);
                    foreach (var zsetValue in zsetValues)
                    {
                        Console.WriteLine(string.Format("{0} ,", zsetValue.ToString()));
                    }
                    break;
            }
            Console.WriteLine();
        }

        /// <method>
        /// Delete all datas from redis database
        /// </method>
        public void DeleteAllKeys()
        {
            _dataAccessDAL.DeleteAllKeys();
        }

        /// <method>
        /// Delete datas by pattern
        /// </method>
        public void DeleteKeysByPattern(string patternString)
        {
            _dataAccessDAL.DeleteKeyByPattern(patternString);
        }

        /// <method>
        /// Delete specific data
        /// </method>
        public bool DeleteKey(string key)
        {            
           return _dataAccessDAL.DeleteKey(key);           
        }

        /// <method>
        /// Get count of keys by pattern
        /// </method>
        public int KeysCountByPattern(string patternString)
        {
            return _dataAccessDAL.KeysCountByPattern(patternString);
        }

        //public List<HashSetAttributeModal> GetLookupFileDataList(string path)
        //{
        //    int length = 4;                         // Length of incremental value
        //    int seqNo;
        //    List<HashSetAttributeModal> HSAttrs = new List<HashSetAttributeModal>();
        //    /*Read all XML files from input directory */
        //    string[] files = Directory.GetFiles(path, "*.xml");
        //    foreach (string file in files)
        //    {
        //        string fileName = Path.GetFileNameWithoutExtension(file);
        //        /* Read data from XML file */
        //        XmlDocument document = new XmlDocument();
        //        document.Load(file);
        //        seqNo = 1;                          // Initialize key sequence             

        //        /*Get child node collection */
        //        XmlNodeList nodeColl = document.DocumentElement.ChildNodes;
        //        foreach (XmlNode node in nodeColl)
        //        {
        //            string key = fileName.Replace(" ", "") + ":" + seqNo.ToString().PadLeft(length, '0');
        //            List<XMLAttributeModal> attriList = new List<XMLAttributeModal>();
        //            /* Get XML node attributes */
        //            var attrs = node.Attributes;
        //            foreach (XmlAttribute attr in attrs)
        //            {
        //                var addXMLAttr = new XMLAttributeModal()
        //                {
        //                    Name = attr.Name,       // Get attribute Name
        //                    Value = attr.Value      // Get attribute Value
        //                };
        //                attriList.Add(addXMLAttr);
        //            }
        //            var fileds = attriList.Select(x => new HashEntry(x.Name, x.Value)).ToArray();
        //            var addHSAttr = new HashSetAttributeModal
        //            {
        //                Key = key,
        //                HashEntries = fileds
        //            };
        //            HSAttrs.Add(addHSAttr);
        //            seqNo += 1;
        //        }
        //    }
        //    return HSAttrs;
        //}
    }
}
