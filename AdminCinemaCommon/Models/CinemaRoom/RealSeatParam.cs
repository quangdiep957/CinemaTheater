using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaCommon.Models.CinemaRoom
{
    public class RealSeatParam
    {
        public Guid? RoomID { get; set; }

        public int? RowSeat { get; set; }

        public int? ColSeat { get; set; }

        public int? Type { get; set; }
    }
}
