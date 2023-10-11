using AdminCinemaCommon.BaseQuery;
using AdminCinemaCommon.InterfaceBaseQuery;
using AdminCinemaDAL.Interface;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaDAL.Repository
{
    public class BaseRepository<T> : QueryProdeduce<T>, IBaseRepository
    {
        public BaseRepository(IConfiguration configuration) : base(configuration)
        {
        }
    }
}
