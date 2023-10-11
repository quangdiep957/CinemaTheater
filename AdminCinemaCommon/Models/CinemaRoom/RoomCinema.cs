using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaCommon.Models.CinemaRoom
{
    public class RoomCinema
    {
        public Guid? RoomID { get; set; }

        public string? RoomCode { get; set;  }

        public int? RowSeat { get; set; }

        public int? ColSeat { get; set; }

        public bool? Status { get; set; }

        public Guid? SeatID { get; set; }

        public int? Type { get; set; }
    }
}
