using System.Configuration;

namespace LAAutomationTool
{
    /// <summary>
    /// This class reads the configuration value and use it across application
    /// </summary>
    public class ConfigManager
    {
        private const string BASEURL = "http://dvml77868:25044/a/services/metrics/dataInventory.xqy?role=&indextype=&hlctype=&showbundle=&showcsi=&showls=&showsizes";
        private const string BROWSER_TYPE = "BrowserType";
        private const string USERNAME = "UserName";
        private const string PASSWORD = "Password";
        private const string INPUT_XML_FILES_PATH = "InputXMLFilesPath";
        private const string MINTIMEOUT = "MinTimeout";
        private const string MAXTIMEOUT = "MaxTimeout";
        private const string ENVIRONMENT = "Environment";
        private const string DEV4URL = "Dev4URL";
        private const string DEV8URL = "Dev8URL"; 

        /// <constructor>
        /// Constructor
        /// </constructor>
        public ConfigManager()
        {

            BrowserType = GetConfigValue(BROWSER_TYPE);
            UserName = GetConfigValue(USERNAME);
            Password = GetConfigValue(PASSWORD);
            InputXMLFilesPath = GetConfigValue(INPUT_XML_FILES_PATH);
            BaseURL = BASEURL.Replace("http://", "http://" + UserName + ":" + Password + "@");
            Mintimeout = GetConfigValue(MINTIMEOUT);
            MaxTimeout = GetConfigValue(MAXTIMEOUT);
            Environment = GetConfigValue(ENVIRONMENT);
            Dev4URL = GetConfigValue(DEV4URL).Replace("http://", "http://" + UserName + ":" + Password + "@");
            Dev8URL = GetConfigValue(DEV8URL).Replace("http://", "http://" + UserName + ":" + Password + "@");
        }

        public string BaseURL { get; }

        public string BrowserType { get; }

        public string UserName { get; }

        public string Password { get; }

        public string InputXMLFilesPath { get; }

        public string Mintimeout { get; }

        public string MaxTimeout { get; }

        public string Environment { get; }

        public string Dev4URL { get; }

        public string Dev8URL { get; }

        /// <method>
        /// Get app key value
        /// </method>
        public string GetConfigValue(string key)
        {
            string value = ConfigurationManager.AppSettings[key];
            return value;
        }

        /// <method>
        /// Get connection string value
        /// </method>
        public string GetConnectionString(string name)
        {
            string connectionValue = ConfigurationManager.ConnectionStrings[name].ConnectionString;
            return connectionValue;
        }
    }
}
