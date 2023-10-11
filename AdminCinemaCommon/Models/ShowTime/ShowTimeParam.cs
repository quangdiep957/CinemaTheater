using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaCommon.Models
{
    public class ShowTimeParam
    {
        /// <summary>
        /// Tham số cột
        /// </summary>
        public int? ColSeat { get; set; }

        /// <summary>
        /// Tham số hàng
        /// </summary>
        public int? RowSeat { get; set;}

        /// <summary>
        /// Tham số id của phòng ảo
        /// </summary>
        public Guid? RoomCinemaID { get; set; }

        public DateTime? PostDate {get; set;}

        public Guid? MovieID {get; set;}

        public Guid? RoomID { get; set;}

        public List<String>? ListTemplateTimeCode { get; set; }

        public int? TimeLine { get; set ; }
    }
    public class ShowPriceParam
    {
        public decimal Cost { get; set; }
        public int Type { get; set; }
        public decimal Price { get; set; }
        /// <summary>
        /// Tham số cột
        /// </summary>
        public int? ColSeat { get; set; }

        /// <summary>
        /// Tham số hàng
        /// </summary>
        public int? RowSeat { get; set; }

        /// <summary>
        /// Tham số id của phòng ảo
        /// </summary>
        public Guid? RoomCinemaID { get; set; }

        public DateTime? PostDate { get; set; }

        public Guid? MovieID { get; set; }

        public Guid? RoomID { get; set; }

        public List<String>? ListTemplateTimeCode { get; set; }

        public int? TimeLine { get; set; }
    }

}
