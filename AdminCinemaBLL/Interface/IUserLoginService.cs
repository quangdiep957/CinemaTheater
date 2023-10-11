using AdminCinemaCommon.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaBLL.Interface
{
    public interface IUserLoginService : IBaseAdminService
    {
        public string GetToken(string username, string password);

        public void ChangeConnectionDB(string? DBName);

        public string GetTokenUser(string username, string password);

        public string GetAccountUser(string username, string password);

    }
}
