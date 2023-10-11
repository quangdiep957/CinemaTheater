using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaCommon.Entities
{
    public class Movie
    {
        /// <summary>
        /// Movie ID
        /// </summary>
        public Guid MovieID { get; set; }

        /// <summary>
        /// Movie Code
        /// </summary>
        public string MovieCode { get; set; }

        /// <summary>
        /// Tên phim
        /// </summary>
        public string MovieName { get; set;}

        /// <summary>
        /// Diễn viên
        /// </summary>
        public string Actor { get; set;}

        /// <summary>
        /// Dạo diễn
        /// </summary>
        public string Directions { get; set;}

        /// <summary>
        /// Id loại phim
        /// </summary>
        public Guid TypeID { get; set; }

        /// <summary>
        /// Ngôn ngưx
        /// </summary>
        public string Language { get; set;}
        /// <summary>
        /// Đường dẫn trailer
        /// </summary>
        public string TrailerLink { get; set;}

        /// <summary>
        /// Đường dẫn poster
        /// </summary>
        public string PosterLink { get; set;}

        /// <summary>
        /// Nội dung
        /// </summary>
        public string Content { get; set;}

        /// <summary>
        /// Ngày chiếu
        /// </summary>
        public DateTime? FromDate { get; set; }

        /// <summary>
        /// Đến ngày
        /// </summary>
        public DateTime? ToDate { get; set; }

        /// <summary>
        /// Đanng mở
        /// </summary>
        public bool? IsOpen { get; set; }

        /// <summary>
        /// Ngày phát hành
        /// </summary>
        public DateTime ReleaseDate { get; set; }

        /// <summary>
        /// Tag thể loại
        /// </summary>
        public string Tag { get; set; }

        public int? TimeLine {get; set;}

        public string TypeName {get; set;}

        public string CategoryName {get; set;}
    }
}
