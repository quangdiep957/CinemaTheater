using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaCommon.Constants
{
    public static class ConnectionString
    {
        // config: serve
        // public static string Default_dev = "Host = mysql-db-1; Port = 3306; Database = db_cinema_dev_01; User Id=root; Password= Quangdiep@2001;Allow User Variables=True";
        // public static string Default_ubu = "Host = mysql-db-1; Port = 3306; Database = db_cinema_dev_01; User Id=root; Password= Quangdiep@2001;Allow User Variables=True";

        // config site
        public static string Default_dev = "Host = localhost; Port = 3306; Database = db_cinema_dev_01; User Id=root; Password= Quangdiep@2001;Allow User Variables=True";
        public static string Default_ubu = "Host = localhost; Port = 3306; Database = db_cinema_dev_01; User Id=root; Password= Quangdiep@2001;Allow User Variables=True";

        public static void BuildConnectionString(string TypeDB,string Connection)
        {
            switch (TypeDB)
            {
                case "Default_dev":
                    ConnectionString.Default_dev = Connection; break;
                case "Default_ubu":
                    ConnectionString.Default_ubu = Connection; break;
                default:
                    ConnectionString.Default_dev = Connection; break;
            }
        }
    
    }
}