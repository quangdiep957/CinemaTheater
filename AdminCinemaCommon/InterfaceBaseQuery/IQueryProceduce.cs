using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaCommon.InterfaceBaseQuery
{
    public interface IQueryProceduce<T>
    {
        /// <summary>
        /// Hàm thực hiện lấy ra một bảng
        /// </summary>
        /// <returns></returns>
        public IEnumerable<T> QueryListObject(string storedProcedureName, dynamic parameters);

        /// <summary>
        /// Hàm thực hiện lấy ra một bảng
        /// </summary>
        /// <param name="procedureName"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public DataTable QueryListObject(string procedureName, SqlParameter[] parameters);

        public T? QueryObject(string storedProcedureName, object parameters);

        /// <summary>
        /// Hàm thực hiện câu lệnh insert hoặc update
        /// </summary>
        /// <param name="storedProcedureName"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public bool ExcuteInsert(string storedProcedureName, dynamic parameters);
    }
}
