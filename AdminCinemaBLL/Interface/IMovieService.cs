﻿using AdminCinemaBLL.Service;
using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Models;
using AdminCinemaCommon.Models.HomePage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaBLL.Interface
{
    public interface IMovieService : IBaseService
    {
        public IEnumerable<Movie> GetListMovie(MovieParam param);

        public bool InsertMovie(MovieInsertParam param);

        public IEnumerable<TypeMovie> GetListTypeMovie();

        public IEnumerable<CategoryMovie> GetListCategoryMovie();
        public bool DeleteMovie(string param);

        public IEnumerable<CinemaStatusSeat> GetListSeatCinemaRoom(ShowTimeParam param);

        public bool UpdateSeatRoomCinema(List<ShowTimeParam> param);

        public IEnumerable<TableTemplateTimeCode> GetTemplateTimeCode(ShowTimeParam param);

        public IEnumerable<Room> GetListRoom();

        public bool CreateNewRoomCinema(ShowTimeParam param);

        public IEnumerable<RoomCinemaMovie> GetListRoomCinemaByMovieID(ShowTimeParam param);

        public MovieAlter GetMovieAlterByID(ShowTimeParam param);

        public bool AlterMovieByID(MovieAlter param);
        public string GetBiggestMovieCode();


    }
}
