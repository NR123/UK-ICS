using FileHandlingApplication.Modal;
using System.Data;
using System.Data.SqlClient;

namespace FileHandlingApplication.DataLayer
{
    /// <summary>
    /// This class handles the CURD operation for file informtion
    /// </summary>
    public class FileProcessDL
    {
        private DBConnection con;

        /// <constructor>
        /// Constructor
        /// </constructor>
        public FileProcessDL()
        {
            con = new DBConnection();
        }

        /// <method>
        /// Add file path information
        /// </method>
        public bool AddFilePath(PathModal path)
        {
            string query = string.Format("INSERT INTO tblPath(Path,CreatedDate) VALUES (@Path , @CreatedDate)");
            SqlParameter[] sqlParameters = new SqlParameter[2];
            sqlParameters[0] = new SqlParameter("@Path", SqlDbType.VarChar);
            sqlParameters[0].Value = path.PathName;
            sqlParameters[1] = new SqlParameter("@CreatedDate", SqlDbType.DateTime);
            sqlParameters[1].Value = path.CreatedDate;
            return con.executeInsertQuery(query, sqlParameters);
        }

        /// <method>
        /// Get file path information
        /// </method>
        public DataTable GetFilePath(string path)
        {
            string query = string.Format("SELECT * FROM tblPath WHERE Path = @Path");
            SqlParameter[] sqlParameters = new SqlParameter[1];
            sqlParameters[0] = new SqlParameter("@Path", SqlDbType.VarChar);
            sqlParameters[0].Value = path;
            return con.executeSelectQuery(query, sqlParameters);
        }

        /// <method>
        /// Add file information
        /// </method>
        public bool AddFileInformation(FileInformationModal fileInfo)
        {
            string query = string.Format("INSERT INTO tblFileInformation(DPSI,PathID,XMLFileCount,ImageCount,CreatedDate,UpdatedDate) VALUES (@DPSI, @PathId, @XMLFileCount, @ImageCount, @CreatedDate, @UpdatedDate)");
            SqlParameter[] sqlParameters = new SqlParameter[6];
            sqlParameters[0] = new SqlParameter("@DPSI", SqlDbType.VarChar);
            sqlParameters[0].Value = fileInfo.DPSI;
            sqlParameters[1] = new SqlParameter("@PathId", SqlDbType.Int);
            sqlParameters[1].Value = fileInfo.PathID;
            sqlParameters[2] = new SqlParameter("@XMLFileCount", SqlDbType.Int);
            sqlParameters[2].Value = fileInfo.XMLFileCount;
            sqlParameters[3] = new SqlParameter("@ImageCount", SqlDbType.Int);
            sqlParameters[3].Value = fileInfo.ImageCount;
            sqlParameters[4] = new SqlParameter("@CreatedDate", SqlDbType.DateTime);
            sqlParameters[4].Value = fileInfo.CreatedDate;
            sqlParameters[5] = new SqlParameter("@UpdatedDate", SqlDbType.DateTime);
            sqlParameters[5].Value = fileInfo.UpdatedDate;            
            return con.executeInsertQuery(query, sqlParameters);
        }

        /// <method>
        /// Update file information
        /// </method>
        public bool UpdateFileInformation(FileInformationModal fileInfo)
        {
            string query = string.Format("UPDATE tblFileInformation SET PathID=@PathId, XMLFileCount=@XMLFileCount, ImageCount=@ImageCount, UpdatedDate=@UpdatedDate WHERE DPSI = @DPSI");
            SqlParameter[] sqlParameters = new SqlParameter[5];
            sqlParameters[0] = new SqlParameter("@DPSI", SqlDbType.VarChar);
            sqlParameters[0].Value = fileInfo.DPSI;
            sqlParameters[1] = new SqlParameter("@PathId", SqlDbType.VarChar);
            sqlParameters[1].Value = fileInfo.PathID;
            sqlParameters[2] = new SqlParameter("@XMLFileCount", SqlDbType.Int);
            sqlParameters[2].Value = fileInfo.XMLFileCount;
            sqlParameters[3] = new SqlParameter("@ImageCount", SqlDbType.Int);
            sqlParameters[3].Value = fileInfo.ImageCount;           
            sqlParameters[4] = new SqlParameter("@UpdatedDate", SqlDbType.DateTime);
            sqlParameters[4].Value = fileInfo.UpdatedDate;
            return con.executeUpdateQuery(query, sqlParameters);
        }

        /// <method>
        /// Delete file information by path
        /// </method>
        public bool DeleteFileInformationByPath(int pathId)
        {
            string query = string.Format("DELETE FROM tblFileInformation WHERE PathID=@PathId");
            SqlParameter[] sqlParameters = new SqlParameter[1];           
            sqlParameters[0] = new SqlParameter("@PathId", SqlDbType.VarChar);
            sqlParameters[0].Value = pathId;            
            return con.executeDeleteQuery(query, sqlParameters);
        }

        /// <method>
        /// Delete file information
        /// </method>
        public bool DeleteFileInformation()
        {
            string query = string.Format("DELETE FROM tblFileInformation");
            SqlParameter[] sqlParameters = new SqlParameter[0];            
            return con.executeDeleteQuery(query, sqlParameters);
        }

        /// <method>
        /// Get file information by path
        /// </method>
        public DataTable GetFileInformationByPath(int pathId)
        {
            string query = string.Format("SELECT * FROM tblFileInformation WHERE PathID=@PathId");
            SqlParameter[] sqlParameters = new SqlParameter[1];
            sqlParameters[0] = new SqlParameter("@PathId", SqlDbType.VarChar);
            sqlParameters[0].Value = pathId;
            return con.executeSelectQuery(query, sqlParameters);
        }

        /// <method>
        /// Get file information
        /// </method>
        public DataTable GetFileInformation()
        {
            string query = string.Format("SELECT * FROM tblFileInformation");
            SqlParameter[] sqlParameters = new SqlParameter[0];           
            return con.executeSelectQuery(query, sqlParameters);
        }
    }
}
