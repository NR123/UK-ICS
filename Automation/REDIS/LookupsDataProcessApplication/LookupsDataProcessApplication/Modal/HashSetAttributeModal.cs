using StackExchange.Redis;

namespace LookupsDataProcessApplication
{
    /// <summary>
    /// This modal class is for HashsetAttribute
    /// </summary>
    public class HashSetAttributeModal
    {
        public string Key { get; set; }

        public HashEntry[] HashEntries { get; set; }

        public string Status { get; set; }

    }
}
