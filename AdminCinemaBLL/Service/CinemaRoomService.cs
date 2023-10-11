using AdminCinemaBLL.Interface;
using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Models;
using AdminCinemaCommon.Models.CinemaRoom;
using AdminCinemaCommon.Models.ShowTime;
using AdminCinemaDAL.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaBLL.Service
{
    public class CinemaRoomService : BaseService<Movie>, ICinemeRoomService
    {
        ICinemaRoom _repo;
        public CinemaRoomService(ICinemaRoom repo) : base(repo)
        {
            _repo = repo;
        }

        public bool CreateNewRealRoom(RoomCinema param)
        {
            return _repo.CreateNewRealRoom(param);
        }

        public bool DeleteCinemaRoomVirtual(ShowTimeParam param)
        {
            return _repo.DeleteCinemaRoomVirtual(param);
        }

        public bool DeleteRealRoom(RoomCinema param)
        {
            return _repo.DeleteRealRoom(param);
        }

        public IEnumerable<RoomCinema> GetListRoom()
        {
            return _repo.GetListRoom();
        }

        public IEnumerable<RoomCinema> GetRealSeatByRoom(RoomCinema param)
        {
            return _repo.GetRealSeatByRoom(param);
        }

        public bool UpdateRealSeatRoom(List<RealSeatParam> param)
        {
            return _repo.UpdateRealSeatRoom(param);
        }
    }
}
