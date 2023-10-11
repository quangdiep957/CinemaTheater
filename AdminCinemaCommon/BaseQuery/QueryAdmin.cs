using AdminCinemaCommon.Constants;
using Dapper;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaCommon.BaseQuery
{
    public class QueryAdmin
    {
        protected string _connectionString = "";
        protected MySqlConnection _connection;
        public QueryAdmin(IConfiguration configuration)
        {
            string dbUser = configuration.GetSection("DBUser")["Config_Acc"];
            _connectionString = configuration.GetConnectionString(dbUser);
            _connection = new MySqlConnection(_connectionString);

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

    }
}
