using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Models;
using AdminCinemaCommon.Models.CinemaRoom;
using AdminCinemaCommon.Models.ShowTime;
using AdminCinemaDAL.Interface;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaDAL.Repository
{
    public class CinemaRoomDAL : BaseRepository<Movie>, ICinemaRoom
    {
        public CinemaRoomDAL(IConfiguration configuration) : base(configuration)
        {
        }

        /// <summary>
        /// Hàm thực hiện lấy ra danh sách phòng thực
        /// </summary>
        /// <returns></returns>
        public IEnumerable<RoomCinema> GetListRoom()
        {
            IEnumerable<RoomCinema> listRoomCinema = QueryListObject(typeof(RoomCinema), "Proc_GetCinemaRoom", null).Cast<RoomCinema>();
            return listRoomCinema;
        }

        /// <summary>
        /// Hàm thực hiện tạo phòng mới
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public bool CreateNewRealRoom(RoomCinema param)
        {
            bool check = ExcuteInsert("Proc_CreateNewRealRoom", param);
            return check;
        }

        public IEnumerable<RoomCinema> GetRealSeatByRoom(RoomCinema param)
        {
            IEnumerable<RoomCinema> listSeat = QueryListObject(typeof(RoomCinema), "Proc_GetRealSeatByRoom", param).Cast<RoomCinema>();
            return listSeat;
        }

        public bool UpdateRealSeatRoom(List<RealSeatParam> param)
        {
            string inputParam = JsonConvert.SerializeObject(param);
            bool check = ExcuteInsert("Proc_UpdateRealSeatRoom", inputParam, "ListSeatSelected");
            return check;
        }

        public bool DeleteRealRoom(RoomCinema param)
        {
            bool check = ExcuteInsert("Proc_DeleteRealRoom", param);
            return check;
        }


        public bool DeleteCinemaRoomVirtual(ShowTimeParam param)
        {
            bool check = ExcuteInsert("Proc_DeleteRoomCinemaVirtual", param);
            return check;
        }
    }
}
