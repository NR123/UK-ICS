using System.Configuration;

namespace FileHandlingApplication
{
    /// <summary>
    /// This class reads the configuration value and use it across application
    /// </summary>
    public class ConfigManager
    {
        private const string CONNECTION_STRING = "DBConnection";

        /// <constructor>
        /// Constructor
        /// </constructor>
        public ConfigManager()
        {
            ConnectionString = GetConnectionString(CONNECTION_STRING);            
        }

        public string ConnectionString { get; }

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
