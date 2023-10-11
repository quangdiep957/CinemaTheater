using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaCommon.Models.HomePage
{
    public class MovieAlter
    {
        public Guid? MovieID { get; set; }

        public string MovieCode { get; set; }

        public string MovieName { get; set; }  
        
        public DateTime? ReleaseDate { get; set; }

        public string? Actor { get; set; }

        public string? Directions { get; set; }

        public Guid? TypeID { get; set; }

        public string? Language { get; set; }

        public string? TrailerLink { get; set; }

        public string? PosterLink { get; set; }

        public string? Content { get; set; }

        public DateTime? FromDate { get; set; }

        public DateTime? ToDate { get; set;}

        public bool? IsOpen { get; set; }

        public string? Tag { get; set; }

        public int? TimeLine { get; set; }  

        public string? CategoryIDs { get; set; }


    }
}
