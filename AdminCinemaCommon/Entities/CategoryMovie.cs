using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaCommon.Entities
{
    public class CategoryMovie
    {
        public Guid? CategoryID { get; set; }

        public string? CategoryName { get; set; }

        public string? CategoryCode { get; set; }
    }
}
