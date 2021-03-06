﻿using FileHandlingApplication.BusinessLayer;
using FileHandlingApplication.Modal;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace FileHandlingApplication
{
    /// <summary>
    /// This class handles the file informtion
    /// </summary>
    class FileProcess
    {
        static void Main(string[] args)
        {
            try
            {
                FileProcess process = new FileProcess();
                FileProcessBL processBL = new FileProcessBL();
                PathModal getFilePath = new PathModal();
                bool hasPathEntered = false;               
                while (!hasPathEntered)
                {                    
                    Console.WriteLine("Input File Path :");
                    string path = Console.ReadLine();
                    hasPathEntered = true;
                    getFilePath = processBL.GetFilePath(path);
                    if (getFilePath == null)
                    {
                        processBL.ReadFileInformation(path);
                        getFilePath = processBL.GetFilePath(path);
                        
                    }
                    else
                    {
                        Console.WriteLine("Given path is already exist. Do you want to \n1.Added \n2.Re-Created \n3.Re-Enter path \n4.Exit");
                        Console.WriteLine("Please type number :");
                        bool isValidInput = true;
                        while (isValidInput)
                        {
                            isValidInput = false;
                            string responseNo = Console.ReadLine();
                            switch (responseNo)
                            {
                                case "1":
                                    processBL.ReadFileInformation(getFilePath.PathName, getFilePath.PathID, true);
                                    break;
                                case "2":
                                    processBL.DeleteFileInformationByPath(getFilePath.PathID);
                                    processBL.ReadFileInformation(getFilePath.PathName, getFilePath.PathID, true);
                                    break;
                                case "3":
                                    hasPathEntered = false;
                                    break;
                                case "4":
                                    return;
                                default:
                                    Console.WriteLine("Please choose valid number.");
                                    isValidInput = true;
                                    break;
                            }                            
                        }

                    }
                }
                
                List<FileInformationModal> fileInfo = processBL.GetFileInformationbyPath(getFilePath.PathID);
                process.DisplayFileInformation(fileInfo);
                Console.WriteLine("Generating report ...");
                process.GenerateReport(fileInfo);
                Console.WriteLine("Process Completed.");
                Console.ReadLine();
            }
            catch(Exception exception)
            {
                Console.WriteLine("The Error Message : " + exception.Message);
            }
        }

        /// <method>
        /// Display file information
        /// </method>
        public void DisplayFileInformation(List<FileInformationModal> fileInfo)
        {
            Console.WriteLine(" File Information Details ");
            Console.WriteLine(" NO   |  DPSI    | XMLFileCount | ImageCount | CreatedDate  | UpdatedDate ");
            foreach (FileInformationModal info in fileInfo)
            {
                Console.WriteLine(info.No + " | " + info.DPSI + " | " + info.XMLFileCount + " | " + info.ImageCount + " | " + info.CreatedDate + " | " + info.UpdatedDate);
            }
        }

        /// <method>
        /// Generate report
        /// </method>
        public void GenerateReport(List<FileInformationModal> fileInfo)
        {
            StringBuilder sb = new StringBuilder();
            int seqNo = 1;
            //Heading
            sb.AppendLine(string.Format("NO, DPSI, XMLFileCount, ImageCount, CreatedDate, UpdatedDate "));
            //Content
            foreach (var info in fileInfo)
            {
                sb.AppendLine(string.Format("{0},{1},{2},{3},{4},{5}", seqNo++, info.DPSI, info.XMLFileCount, info.ImageCount, info.CreatedDate, info.UpdatedDate));
            }
            string path = Environment.CurrentDirectory + "\\" + "Reports_" + DateTime.Now.ToString().Replace(":", "-") + ".csv";
            File.WriteAllText(path, sb.ToString());
            Console.WriteLine(" Find Report : " + path);
        }
    }
}
