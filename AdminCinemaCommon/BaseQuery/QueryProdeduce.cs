using AdminCinemaCommon.Constants;
using AdminCinemaCommon.InterfaceBaseQuery;
using Dapper;
using Microsoft.Extensions.Configuration;
using MySqlConnector;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaCommon.BaseQuery
{
    public class QueryProdeduce<T> : IQueryProceduce<T>
    {
        protected readonly string _connectionString = "";
        protected MySqlConnection _connection;
        public QueryProdeduce(IConfiguration configuration)
        {
            string dbUser = configuration.GetSection("DBUser")["Config_Db"];
            switch (dbUser)
            {
                case "Default_dev":
                    _connectionString = ConnectionString.Default_dev; break;
                case "Default_ubu":
                    _connectionString = ConnectionString.Default_ubu; break;
                default:
                    _connectionString = ConnectionString.Default_dev; break;
            }

            _connection = new MySqlConnection(_connectionString);
        }

        /// <summary>
        /// Hàm thực hiện query một object thông qua proc
        /// </summary>
        /// <param name="storedProcedureName"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public IEnumerable<T> QueryListObject(string storedProcedureName, dynamic? parameters)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(storedProcedureName, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    DynamicParameters param = new DynamicParameters();
                    if (parameters != null)
                    {
                        foreach (PropertyInfo propertyInfo in parameters.GetType().GetProperties())
                        {
                            param.Add("$" + propertyInfo.Name, propertyInfo.GetValue(parameters));
                        }
                    }

                    connection.Open();

                    // Execute the stored procedure
                    return connection.Query<T>(
                            storedProcedureName,
                            param,
                            commandType: CommandType.StoredProcedure);
                }
            }
        }

        /// <summary>
        /// Hàm thực hiện query một object thông qua proc
        /// </summary>
        /// <param name="storedProcedureName"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public T? QueryObject(string storedProcedureName, dynamic parameters)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(storedProcedureName, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    //foreach (SqlParameter parameter in parameters)
                    //{
                    //    command.Parameters.Add(parameter);
                    //}
                    DynamicParameters param = new DynamicParameters();
                    foreach (PropertyInfo propertyInfo in parameters.GetType().GetProperties())
                    {
                        param.Add("$" + propertyInfo.Name, propertyInfo.GetValue(parameters));
                    }

                    //command.Parameters.Add(parameters);

                    connection.Open();

                    // Execute the stored procedure
                    return connection.Query<T>(
                            storedProcedureName,
                            param,
                            commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
            }
        }

        public DataTable QueryListObject(string procedureName, SqlParameter[] parameters)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                using (SqlCommand command = new SqlCommand(procedureName, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    if (parameters != null)
                    {
                        foreach (SqlParameter parameter in parameters)
                        {
                            command.Parameters.Add(parameter);
                        }
                    }

                    DataTable dataTable = new DataTable();
                    using (SqlDataAdapter dataAdapter = new SqlDataAdapter(command))
                    {
                        dataAdapter.Fill(dataTable);
                    }

                    return dataTable;
                }
            }
        }

        /// <summary>
        /// Hàm thực hiện xử lý các câu insert vào update
        /// </summary>
        /// <param name="storedProcedureName"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public bool ExcuteInsert(string storedProcedureName, dynamic parameters)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(storedProcedureName, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    DynamicParameters param = new DynamicParameters();
                    foreach (PropertyInfo propertyInfo in parameters.GetType().GetProperties())
                    {
                        var value = propertyInfo.GetValue(parameters);

                        // với dữ liệu kiểu list<string> thì ép kiểu lại về json
                        if (value != null && value.GetType() == typeof(List<string>))
                        {
                            var list = value as List<string>;
                            var json = JsonConvert.SerializeObject(list);
                            param.Add("$" + propertyInfo.Name, json);
                        }
                        else
                        {
                            param.Add("$" + propertyInfo.Name, value);
                        }
                    }

                    connection.Open();

                    // Execute the stored procedure
                    var res = connection.Execute(
                            storedProcedureName,
                            param,
                            commandType: CommandType.StoredProcedure);
                    if (res != 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }

        public bool ExcuteInsert(string storedProcedureName, string parameter, string nameParam)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(storedProcedureName, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    DynamicParameters param = new DynamicParameters();
                    param.Add("$" + nameParam, parameter);

                    connection.Open();

                    // Execute the stored procedure
                    var res = connection.Execute(
                            storedProcedureName,
                            param,
                            commandType: CommandType.StoredProcedure);
                    if (res != 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }

        public IEnumerable<object> QueryListObject(Type type, string storedProcedureName, dynamic? parameters)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(storedProcedureName, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    DynamicParameters param = new DynamicParameters();
                    if (parameters != null)
                    {
                        foreach (PropertyInfo propertyInfo in parameters.GetType().GetProperties())
                        {
                            param.Add("$" + propertyInfo.Name, propertyInfo.GetValue(parameters));
                        }
                    }

                    connection.Open();

                    // Execute the stored procedure
                    return connection.Query(type,
                            storedProcedureName,
                            param,
                            commandType: CommandType.StoredProcedure);
                }
            }
        }

        public object QueryObject(Type type, string storedProcedureName, dynamic? parameters)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(storedProcedureName, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    DynamicParameters param = new DynamicParameters();
                    if (parameters != null)
                    {
                        foreach (PropertyInfo propertyInfo in parameters.GetType().GetProperties())
                        {
                            param.Add("$" + propertyInfo.Name, propertyInfo.GetValue(parameters));
                        }
                    }

                    connection.Open();

                    // Execute the stored procedure
                    return connection.Query(type,
                            storedProcedureName,
                            param,
                            commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
            }
        }

        /// <summary>
        /// Query với phân trang
        /// </summary>
        /// <param name="type"> Kiểu model đầu ra</param>
        /// <param name="storedProcedureName">Tên thủ tục</param>
        /// <param name="parameters">Model tham số (Nên có thêm startindex, pagesize)</param>
        /// <param name="TotalRecord">Tổng số bản ghi được trả ra</param>
        /// <returns></returns>
        public IEnumerable<object> QueryListObject(Type type, string storedProcedureName, dynamic? parameters, ref int TotalRecord)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(storedProcedureName, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    DynamicParameters param = new DynamicParameters();
                    if (parameters != null)
                    {
                        foreach (PropertyInfo propertyInfo in parameters.GetType().GetProperties())
                        {
                            param.Add("$" + propertyInfo.Name, propertyInfo.GetValue(parameters));
                        }

                        param.Add("TotalRecord", TotalRecord);

                    }

                    connection.Open();

                    // Execute the stored procedure
                    var result = connection.Query(type, storedProcedureName, param, commandType: CommandType.StoredProcedure);

                    // Map the out parameter values to the model
                    TotalRecord = param.Get<int>("TotalRecord");

                    return result;
                }
            }
        }


        public (IEnumerable<object>, int) QueryPagingBasic(Type tableType, string storedProcedureName, dynamic? parameters)
        {
            using (MySqlConnection connection = new MySqlConnection(_connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(storedProcedureName, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    DynamicParameters param = new DynamicParameters();
                    if (parameters != null)
                    {
                        foreach (PropertyInfo propertyInfo in parameters.GetType().GetProperties())
                        {
                            param.Add("$" + propertyInfo.Name, propertyInfo.GetValue(parameters));
                        }
                    }

                    connection.Open();

                    // Execute the stored procedure to get multiple results
                    var reader = connection.QueryMultiple(storedProcedureName, param, commandType: CommandType.StoredProcedure);

                    // Read the first result set as the table
                    var table = reader.Read(tableType);

                    // Read the second result set as the int variable
                    var intVariable = reader.ReadSingle<int>();

                    return (table, intVariable);
                }
            }
        }






        /// chuyển đổi datatable thành ienumrable object
        private IEnumerable<object> ReadResultSet(DbDataReader reader, Type type)
        {
            var resultList = new List<object>();
            var properties = type.GetProperties();

            while (reader.Read())
            {
                var obj = Activator.CreateInstance(type);

                foreach (var property in properties)
                {
                    if (!reader.IsDBNull(reader.GetOrdinal(property.Name)))
                    {
                        var value = reader[property.Name];
                        property.SetValue(obj, value);
                    }
                }

                resultList.Add(obj);
            }

            return resultList;
        }

    }
}
