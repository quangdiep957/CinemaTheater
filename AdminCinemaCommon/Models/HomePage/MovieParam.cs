using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaCommon.Models.HomePage
{
    public class MovieParam
    {
        /// <summary>
        /// Filter theo mã phim
        /// </summary>
        public string? MovieCode { get; set; } = null;

        /// <summary>
        /// Lọc theo tên phim
        /// </summary>
        public string? MovieName { get; set; } = null;

        /// <summary>
        /// Lọc theo đạo diễn
        /// </summary>
        public string? Actor { get; set; } = null;

        /// <summary>
        /// Lọc theo đạo diễn
        /// </summary>
        public string? Direction { get; set; } = null;

        /// <summary>
        /// Lọc theo ngày
        /// </summary>
        public int? TypeFilter { get; set; }
    }
}
