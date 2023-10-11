using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaCommon.Models
{
    public class CinemaStatusSeat
    {
        public int ColSeat { get; set; }

        public int RowSeat { get; set; }

        public int Status { get; set; }

        public Guid RoomCinemaID { get; set; }

        public int? Type {get; set;}
    }
}
