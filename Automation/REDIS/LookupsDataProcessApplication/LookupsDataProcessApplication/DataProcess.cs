using LookupsDataProcessApplication.BusinessLayer;
using System;

namespace LookupsDataProcessApplication
{
    /// <summary>
    /// This class handles the XML data processing
    /// </summary>
    class DataProcess
    {
        static void Main(string[] args)
        {
            try
            {               
                DataProcess process = new DataProcess();
                DataProcessBL processBL = new DataProcessBL();                
                bool isValidInput = true;
                while (isValidInput)
                {                    
                    Console.WriteLine("Please choose the following. \n"+
                                        "1.Get all data \n" +
                                        "2.Get data by pattern \n" +
                                        "3.Get specific data \n" +
                                        "4.Add data \n" +
                                        "5.Delete specific key \n" +
                                        "6.Delete keys by pattern \n" +
                                        "7.Delete all keys \n" +
                                        "8.Keys count \n" +
                                        "9.Exit");
                    Console.WriteLine("Please type number :");
                    string responseNo = Console.ReadLine();
                    //isValidInput = false;
                    switch (responseNo)
                    {
                        case "1":
                            Console.WriteLine("Read All Data from Database");
                            processBL.GetAllDataFromRedis();
                            Console.WriteLine("Read is completed.");
                            break;
                        case "2":
                            Console.WriteLine("Enter pattern string(Consider all if empty) :");
                            string getPatternString = Console.ReadLine();
                            processBL.GetDatasByPattern(getPatternString);
                            Console.WriteLine("Read is completed.");
                            break;
                        case "3":
                            Console.WriteLine("Enter key :");
                            string getKey = Console.ReadLine();
                            processBL.GetDataByKeyFromRedis(getKey);
                            Console.WriteLine("Read is completed.");
                            break;
                        case "4":
                            string path = process.GetLookupFilePath();
                            processBL.AddLookupFileDatas(path);
                            Console.WriteLine("Add data is completed");
                            break; 
                        case "5":
                            Console.WriteLine("Enter key :");
                            string keyToDelete = Console.ReadLine();
                            bool isDeleted = processBL.DeleteKey(keyToDelete);
                            string resMessage = isDeleted ? "Key is deleted" : "Key does not exist";
                            Console.WriteLine(resMessage);
                            break;
                        case "6":
                            Console.WriteLine("Enter pattern string(Consider all if empty) :");
                            string deletePatternString = Console.ReadLine();
                            processBL.DeleteKeysByPattern(deletePatternString);
                            Console.WriteLine("Keys are deleted.");
                            break;
                        case "7":
                            processBL.DeleteAllKeys();
                            Console.WriteLine("All keys are deleted.");
                            break;
                        case "8":
                            Console.WriteLine("Enter pattern string(Consider all if empty) :");
                            string countPatternString = Console.ReadLine();
                            int searchKeyCount = processBL.KeysCountByPattern(countPatternString);
                            Console.WriteLine("Keys count : " + searchKeyCount);
                            break;
                        case "9":
                            return;
                        default:
                            Console.WriteLine("Invalid input.");
                            break;
                    }
                    //Console.WriteLine();
                    //Console.WriteLine("Do you want to continue :(Yes/No)");
                    //string status = Console.ReadLine().ToLower();
                    //if(status == "yes")
                    //{
                    //    isValidInput = true;
                    //}
                    Console.WriteLine();
                }
                Console.ReadLine();
            }
            catch (Exception exception)
            {
                Console.WriteLine("The Error Message : " + exception.Message);
            }
            //Console.ReadLine();
        }

        /// <method>
        /// Get file path as input
        /// </method>
        public string GetLookupFilePath()
        {
            Console.WriteLine("LookupFiles Path :");
            string XmlLookupFilesPath = Console.ReadLine();
            return XmlLookupFilesPath;
        }
    }
}
