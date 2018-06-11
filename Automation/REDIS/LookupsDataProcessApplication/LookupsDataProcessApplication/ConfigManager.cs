using System.Configuration;

namespace LookupsDataProcessApplication
{
    /// <summary>
    /// This class handles CURD operations on XML datas
    /// </summary>
    public class ConfigManager
    {
        private const string HOSTNAME = "HostName";
        private const string PORTNUMBER = "PortNumber";

        /// <constructor>
        /// Constructor
        /// </constructor>
        public ConfigManager()
        {
            HostName = GetConfigValue(HOSTNAME);
            PortNumber = GetConfigValue(PORTNUMBER);
        }

        public string HostName { get; }

        public string PortNumber { get; }

        public string GetConfigValue(string key)
        {
            string value = ConfigurationManager.AppSettings[key];
            return value;
        }
    }
}
