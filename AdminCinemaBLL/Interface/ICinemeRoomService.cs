using AdminCinemaCommon.Models;
using AdminCinemaCommon.Models.CinemaRoom;
using AdminCinemaCommon.Models.ShowTime;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaBLL.Interface
{
    public interface ICinemeRoomService : IBaseService
    {
        public IEnumerable<RoomCinema> GetListRoom();

        public bool CreateNewRealRoom(RoomCinema param);

        public IEnumerable<RoomCinema> GetRealSeatByRoom(RoomCinema param);

        public bool UpdateRealSeatRoom(List<RealSeatParam> param);

        public bool DeleteRealRoom(RoomCinema param);

        public bool DeleteCinemaRoomVirtual(ShowTimeParam param);


    }
}
