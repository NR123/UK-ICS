using StackExchange.Redis;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LookupsDataProcessApplication
{
    /// <summary>
    /// This class handles CURD operations on XML datas
    /// </summary>
    public class DBConnection
    {
        private ConnectionMultiplexer redis;
        public IDatabase database;
        public IServer server;
        private ConfigManager config = new ConfigManager();

        /// <constructor>
        /// Constructor
        /// </constructor>
        public DBConnection()
        {
            redis = ConnectionMultiplexer.Connect(config.HostName + ":" + config.PortNumber);
            database = redis.GetDatabase();
            server = redis.GetServer(config.HostName, Convert.ToInt32(config.PortNumber));
        }          
    }
}
