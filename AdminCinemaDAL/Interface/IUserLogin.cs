using AdminCinemaCommon.Entities;
using AdminCinemaDAL.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaDAL.Interface
{
    public interface IUserLogin : IBaseAccountAdmin
    {
        public Account GetAccount(string username, string password);
        public Account GetAccountUser(string username, string password);


    }
}
