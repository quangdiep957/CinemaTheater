using AdminCinemaCommon.Entities;
using AdminCinemaDAL.Interface;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaDAL.Repository
{
    public class UserLoginDAL : BaseAccountAdmin, IUserLogin
    {
        public UserLoginDAL(IConfiguration configuration) : base(configuration)
        {
        }


        /// <summary>
        /// Hàm lấy ra thông tin account
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public Account GetAccount(string username, string password)
        {
            Account data = (Account)QueryObject(typeof(Account),"Proc_GetAccountIDRole", new { account_name = username, account_password = password })??new Account();
            return data;
        }


        /// <summary>
        /// Hàm lấy ra thông tin account
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public Account GetAccountUser(string username, string password)
        {
            Account data = (Account)QueryObject(typeof(Account), "Proc_GetTokenUser", new { account_name = username, account_password = password }) ?? new Account();
            return data;
        }

    }
}
