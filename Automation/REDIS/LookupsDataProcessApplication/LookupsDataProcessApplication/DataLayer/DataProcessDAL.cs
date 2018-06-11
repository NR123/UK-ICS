using StackExchange.Redis;
using System.Collections.Generic;
using System.Linq;

namespace LookupsDataProcessApplication.DataLayer
{
    /// <summary>
    /// This class handles CURD operations on XML datas
    /// </summary>
    public class DataProcessDAL
    {
        private DBConnection con;

        /// <constructor>
        /// Constructor
        /// </constructor>
        public DataProcessDAL()
        {
            con = new DBConnection();
        }

        /// <method>
        /// Add data into hash set
        /// </method>
        public void AddDataInHashSet(HashSetAttributeModal row)
        {            
            con.database.HashSet(row.Key, row.HashEntries);    // Insert into redis database as hash type  
        }

        /// <method>
        /// Get all keys from redis database
        /// </method>
        public List<RedisKey> GetAllKeysFromRedis()
        {
            /* Get all keys from redis database */
            var keys = con.server.Keys();
            return keys.OrderBy(x => x.ToString()).ToList();
        }

        /// <method>
        /// Get keys by pattern from redis database
        /// </method>
        public List<RedisKey> GetKeysByPattern(string patternString)
        {
            var keys = con.server.Keys(pattern: patternString.ToLower() + "*").ToArray();
            return keys.OrderBy(x => x.ToString()).ToList();
        }

        /// <method>
        /// Get key type by key
        /// </method>
        public string GetKeyType(string key)
        {
            return con.database.KeyType(key).ToString();            
        }

        /// <method>
        /// Get string data by key from redis database
        /// </method>
        public string GetStringValue(string key)
        {
            return con.database.StringGet(key).ToString();
        }

        /// <method>
        /// Get list data by key from redis database
        /// </method>
        public RedisValue[] GetListValues(string key)
        {
            return con.database.ListRange(key);
        }

        /// <method>
        /// Get set data by key from redis database
        /// </method>
        public RedisValue[] GetSetValues(string key)
        {
            return con.database.SetMembers(key);
        }

        /// <method>
        /// Get sorted set data by key from redis database
        /// </method>
        public RedisValue[] GetSortedSetValues(string key)
        {
            return con.database.SortedSetRangeByValue(key);
        }

        /// <method>
        /// Get hash set data by key from redis database
        /// </method>
        public HashEntry[] GetAllHashValues(string key)
        {
            return con.database.HashGetAll(key);
        }

        /// <method>
        /// Delete all datas from redis database
        /// </method>
        public void DeleteAllKeys()
        {
            var keys = con.server.Keys().ToArray();
            con.database.KeyDeleteAsync(keys);
        }

        /// <method>
        /// Delete specific data from redis database
        /// </method>
        public bool DeleteKey(string key)
        {
            return con.database.KeyDelete(key);
        }

        /// <method>
        /// Delete data by pattern from redis database
        /// </method>
        public void DeleteKeyByPattern(string patternString)
        {
            var keys = con.server.Keys(pattern: patternString.ToLower() + "*").ToArray();
            con.database.KeyDeleteAsync(keys);
        }

        /// <method>
        /// Get count of keys by pattern from redis database
        /// </method>
        public int KeysCountByPattern(string patternString)
        {
            var keys = con.server.Keys(pattern: patternString.ToLower() + "*").ToArray();
            return keys.Count();
        }
    }
}
