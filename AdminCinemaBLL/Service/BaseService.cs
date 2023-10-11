using AdminCinemaBLL.Interface;
using AdminCinemaDAL.Interface;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;

namespace AdminCinemaBLL.Service
{
    public class BaseService<T> : IBaseService
    {
        protected IBaseRepository _repository;
        public BaseService(IBaseRepository repository) {
            this._repository = repository;
        }
    }
}
