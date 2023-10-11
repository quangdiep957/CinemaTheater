using AdminCinemaBLL.Interface;
using AdminCinemaCommon.Entities;
using AdminCinemaDAL.Interface;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using AdminCinemaCommon.Constants;
using Microsoft.IdentityModel.Tokens;
using AdminCinemaCommon.Enum;
using System.Configuration;
using Microsoft.Extensions.Configuration;

namespace AdminCinemaBLL.Service
{
    public class UserLoginService : BaseAccountAdminService, IUserLoginService
    {
        IUserLogin _repo;
        public string dbUser { get; set; }

        public UserLoginService(IUserLogin repo, IConfiguration configuration) : base(repo)
        {
            _repo = repo;
            dbUser = configuration.GetSection("DBUser")["Config_Db"]?? "Default_dev";
        }


        public string BuildConnectionString(string nameDB)
        {
            if(dbUser== "Default_ubu")
            {
                // return "Host = mysql-db-1; Port = 3306; Database = " + nameDB + "; User Id=root; Password= Quangdiep@2001;Allow User Variables=True";
                return "Host = localhost; Port = 3306; Database = " + nameDB + "; User Id=root; Password= Quangdiep@2001;Allow User Variables=True";
            }
            else
            {
                // return "Host = mysql-db-1; Port = 3306; Database = " + nameDB + "; User Id=root; Password= Quangdiep@2001;Allow User Variables=True";
                return "Host = localhost; Port = 3306; Database = " + nameDB + "; User Id=root; Password= Quangdiep@2001;Allow User Variables=True";
            }
        }

        /// <summary>
        /// Hàm thực hiện lấy ra token và xử lý đăng nhập
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public string GetToken(string username, string password)
        {
            var user = _repo.GetAccount(username, password);
            var tokenString = "";
            if(!String.IsNullOrEmpty(user.NameDB) && user.CinemaID != null)
            {
                ConnectionString.BuildConnectionString(dbUser, this.BuildConnectionString(user.NameDB));
            }
            if (!String.IsNullOrEmpty(user.AccountID.ToString()) && user.Role < 5)
            {
                string roleUser = "";
                switch (user.Role)
                {
                    case 1:
                        roleUser = "admin";
                        break;
                    case 2: 
                        roleUser = "employee";
                        break;
                    case 3:
                        roleUser = "manager";
                        break;
                    default:
                        roleUser = "none";
                        break;
                }
                var claims = new[]
                {
                    new Claim(JwtRegisteredClaimNames.Sub, user.AccountID.ToString()),
                    new Claim("name", username),
                    new Claim("role", roleUser),
                    new Claim("cinemaName",user.CinemaName??"")
                };

                var secret = Constants.secretKey;
                var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secret));
                var token = new JwtSecurityToken(
                    issuer: "myapp",
                    audience: "myclient",
                    claims: claims,
                    expires: DateTime.UtcNow.AddHours(12),
                    signingCredentials: new SigningCredentials(key, SecurityAlgorithms.HmacSha256)
                );

                // tạo string từ token
                tokenString = new JwtSecurityTokenHandler().WriteToken(token);
                return tokenString;
            }
            else
            {
                return tokenString;
            }
        }

        public void ChangeConnectionDB(string? DBName)
        {
            if (!String.IsNullOrEmpty(DBName) && DBName != null)
            {
                ConnectionString.BuildConnectionString(dbUser, this.BuildConnectionString(DBName));
            }
        }

        /// <summary>
        /// Hàm thực hiện lấy ra token và xử lý đăng nhập
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public string GetTokenUser(string username, string password)
        {
            var user = _repo.GetAccount(username, password);
            var tokenString = "";
            if (!String.IsNullOrEmpty(user.AccountID.ToString()) && user.Role == 5)
            {
                string roleUser = "user";
                var claims = new[]
                {
                    new Claim(JwtRegisteredClaimNames.Sub, user.AccountID.ToString()),
                    new Claim("name", username),
                    new Claim("role", roleUser),
                    new Claim("cinemaName",user.CinemaName??"")
                };

                var secret = Constants.secretKey;
                var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secret));
                var token = new JwtSecurityToken(
                    issuer: "myapp",
                    audience: "myclient",
                    claims: claims,
                    expires: DateTime.UtcNow.AddHours(12),
                    signingCredentials: new SigningCredentials(key, SecurityAlgorithms.HmacSha256)
                );

                // tạo string từ token
                tokenString = new JwtSecurityTokenHandler().WriteToken(token);
                return tokenString;
            }
            else
            {
                return tokenString;
            }
        }


        /// <summary>
        /// Hàm thực hiện lấy ra token và xử lý đăng nhập
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public string GetAccountUser(string username, string password)
        {
            var user = _repo.GetAccountUser(username, password);
            var tokenString = "";
            if (!String.IsNullOrEmpty(user.AccountID.ToString()) && user.Role == 5)
            {
                string roleUser = "user";
                var claims = new[]
                {
                    new Claim(JwtRegisteredClaimNames.Sub, user.AccountID.ToString()),
                    new Claim("name", username),
                    new Claim("fullname", user.Name??""),
                    new Claim("role", roleUser),
                    new Claim("cinemaName",user.CinemaName??"")
                };

                var secret = Constants.secretKey;
                var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secret));
                var token = new JwtSecurityToken(
                    issuer: "myapp",
                    audience: "myclient",
                    claims: claims,
                    expires: DateTime.UtcNow.AddHours(12),
                    signingCredentials: new SigningCredentials(key, SecurityAlgorithms.HmacSha256)
                );

                // tạo string từ token
                tokenString = new JwtSecurityTokenHandler().WriteToken(token);
                return tokenString;
            }
            else
            {
                return tokenString;
            }
        }
    }
}
