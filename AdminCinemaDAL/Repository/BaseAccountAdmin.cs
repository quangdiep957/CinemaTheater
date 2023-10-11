using AdminCinemaCommon.BaseQuery;
using AdminCinemaDAL.Interface;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaDAL.Repository
{
    public class BaseAccountAdmin : QueryAdmin, IBaseAccountAdmin
    {
        public BaseAccountAdmin(IConfiguration configuration) : base(configuration)
        {
        }
    }
}
