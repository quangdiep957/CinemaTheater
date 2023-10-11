using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaCommon.Entities
{
    public class TypeMovie
    {
        public Guid TypeID { get; set; }

        public string? TypeCode { get; set; }

        public string? TypeName { get; set; }
    }
}
