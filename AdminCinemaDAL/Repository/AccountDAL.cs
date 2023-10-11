using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Models.Account;
using AdminCinemaCommon.Models.ShowTime;
using AdminCinemaDAL.Interface;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using System.Reflection;
using System.Security.Cryptography.X509Certificates;

namespace AdminCinemaDAL.Repository;

public class AccountDAL : BaseAccountAdmin, IAccount
{
    public AccountDAL(IConfiguration configuration) : base(configuration)
    {
    }

    /// <summary>
    /// Hàm lấy ra tất cả tài khoản
    /// </summary>
    /// <returns></returns>
    public IEnumerable<Account> GetAllAccount()
    {
        IEnumerable<Account> accounts = QueryListObject(typeof(Account), "Proc_GetAllAccount", null).Cast<Account>();
        return accounts;
    }

    /// <summary>
    /// Hàm lấy ra tất cả tài khoản chưa được phê duyệt
    /// </summary>
    /// <returns></returns>
    public IEnumerable<Account> GetAllAccountTemp()
    {
        IEnumerable<Account> accounts = QueryListObject(typeof(Account), "Proc_GetAllAccountTemp", null).Cast<Account>();
        return accounts;
    }

    public bool ComfirmAccount(AccountParam param)
    {
        bool check = ExcuteInsert("Proc_AcceptAccount", param);
        return check;
    }


    public bool AddWaitListAccount(AccountParam param)
    {
        bool check = ExcuteInsert("Proc_AddWaitListAccount", param);
        return check;
    }

    /// <summary>
    /// Hàm cập nhật tài khoản
    /// </summary>
    /// <param name="param"></param>
    /// <returns></returns>
    public bool UpdateAccount(Account param)
    {
        bool check = ExcuteInsert("Proc_UpdateAccount", param);
        return check;
    }

    public bool CheckExistAccount(AccountParam param)
    {
        IEnumerable<Account> check = QueryListObject(typeof(Account), "Proc_CheckExistAccount", param).Cast<Account>();
        if (check.Count() > 0)
            return true;
        else
            return false;
    }

    public IEnumerable<Customer> GetListCustomer()
    {
        IEnumerable<Customer> listCustomer = QueryListObject(typeof(Customer), "Proc_GetListCustomer", null).Cast<Customer>();
        return listCustomer;
    }

    public bool DeleteAccount(AccountParam param)
    {
        var check = ExcuteInsert("Proc_DeleteAccount", param);
        return check;
    }

    public bool InsertNewAccount(Account param)
    {
        var check = ExcuteInsert("Proc_InsertNewAccount", param);
        return check;
    }


    public IEnumerable<Account> GetListCinema()
    {
        IEnumerable<Account> accounts = QueryListObject(typeof(Account), "Proc_GetListCinema", null).Cast<Account>();
        return accounts;
    }

    public Account GetAccountByID(AccountParam param)
    {
        Account account = (Account)QueryObject(typeof(Account), "Proc_GetAccountByID", param);
        return account;
    }

    public Account GetAccountByAccountName(AccountParam param)
    {
        Account account = (Account)QueryObject(typeof(Account), "Proc_GetAccountByAccountName", param);
        return account;
    }

    public bool UpdatePassword(Account param)
    {
        var check = ExcuteInsert("Proc_UpdatePasswordAccount", param);
        return check;
    }
    public bool InsertNewAccountUser(Account param)
    {
        var check = ExcuteInsert("Proc_InsertNewUser", param);
        return check;
    }

    public bool InsertNewCinema(CinemaTenant param)
    {
        var check = ExcuteInsert("Proc_InsertNewCinemaTenant", param);
        return check;
    }

    private string[] GetSqlFilePath()
    {
        string currentAssemblyPath = Assembly.GetExecutingAssembly().Location;
        string adminCinemaCommonPath = Path.GetFullPath(Path.Combine(Path.GetDirectoryName(currentAssemblyPath), "..", "..", "..", "..", "AdminCinemaCommon"));
        string sqlFilePath = Path.Combine(adminCinemaCommonPath, "DBStore","Blank");
        string[] fileNames = Directory.GetFiles(sqlFilePath);
        return fileNames;
    }

    private string[] GetSqlDataFilePath()
    {
        string currentAssemblyPath = Assembly.GetExecutingAssembly().Location;
        string adminCinemaCommonPath = Path.GetFullPath(Path.Combine(Path.GetDirectoryName(currentAssemblyPath), "..", "..", "..", "..", "AdminCinemaCommon"));
        string sqlFilePath = Path.Combine(adminCinemaCommonPath, "DBStore", "DataBlank");
        string[] fileNames = Directory.GetFiles(sqlFilePath);
        return fileNames;
    }


    public void CreateDatabase(string databaseName)
    {
        string[] sqlFilePath = GetSqlFilePath();
        string[] sqlDataPath = GetSqlDataFilePath();
        using (MySqlConnection connection = new MySqlConnection(_connectionString))
        {
            try
            {
                connection.Open();

                // Create the database if it doesn't exist
                string createDatabaseQuery = $"CREATE DATABASE IF NOT EXISTS `{databaseName}`";
                using (MySqlCommand command = new MySqlCommand(createDatabaseQuery, connection))
                {
                    command.ExecuteNonQuery();
                }

                Console.WriteLine("Database created successfully.");

                // Switch to the newly created database
                connection.ChangeDatabase(databaseName);

                // Read SQL script from file
                foreach (string fileName in sqlFilePath)
                {
                    string sqlScript = File.ReadAllText(fileName);

                    // Execute the script to create tables and other statements
                    //using (MySqlCommand command = new MySqlCommand(sqlScript, connection))
                    //{
                    //    command.ExecuteNonQuery();
                    //}

                    MySqlScript script = new MySqlScript(connection, sqlScript);

                    script.Delimiter = ";;";
                    script.Execute();

                    Console.WriteLine("SQL script executed successfully and tables created.");
                }

                foreach (string fileName in sqlDataPath)
                {
                    string sqlScript = File.ReadAllText(fileName);

                    // Execute the script to create tables and other statements
                    //using (MySqlCommand command = new MySqlCommand(sqlScript, connection))
                    //{
                    //    command.ExecuteNonQuery();
                    //}

                    MySqlScript script = new MySqlScript(connection, sqlScript);

                    script.Delimiter = ";;";
                    script.Execute();

                    Console.WriteLine("SQL script data executed successfully and tables created.");
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }
    }
}
