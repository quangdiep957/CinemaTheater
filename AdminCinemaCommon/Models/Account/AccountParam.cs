using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaCommon.Models.Account
{
    public class AccountParam
    {
        public Guid? AccountID { get; set; }

        public string? AccountName { get; set; }

        public string? Password { get; set; }

        public int? Role { get; set; }

        public int? Status { get; set; }

        public string? Name { get; set; }

        public string? CinemaID { get; set; }
    }
}
