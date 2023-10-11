using AdminCinemaBLL.Interface;
using AdminCinemaDAL.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaBLL.Service
{
    public class BaseAccountAdminService : IBaseAdminService
    {
        protected IBaseAccountAdmin _repository;
        public BaseAccountAdminService(IBaseAccountAdmin repository)
        {
            this._repository = repository;
        }
    }
}
