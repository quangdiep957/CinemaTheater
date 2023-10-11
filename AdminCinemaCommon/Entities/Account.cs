using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaCommon.Entities
{
    public class Account
    {
        public Guid? AccountID { get; set; }
        public string AccountName { get; set; }

        public string Password { get; set; }   
        public int Role { get; set; }
        public string? Name { get; set; }

        public string? Email { get; set; }

        public int? Gender { get; set; } 
        public DateTime? DateOfBirth { get; set; }
        public string? PhoneNumber { get; set; }
        public string? MemberCode { get; set; }

        public int TypeMember { get; set; }

        public DateTime? CreatedDate { get; set; }

        public int? Point { get; set; }

        public int? Status { get; set; }

        public Guid? CinemaID { get; set; }

        public string? CinemaName { get; set; }

        public string? NameDB { get; set; }
        
        public string? Avatar { get; set; }
    }
}
