using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Models;
using AdminCinemaCommon.Models.HomePage;
using AdminCinemaDAL.Interface;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaDAL.Repository
{
    public class MovieDAL : BaseRepository<Movie>, IMovie
    {

        public MovieDAL(IConfiguration config) : base(config) { }

        public IEnumerable<Movie> GetListMovie(MovieParam param)
        {
            IEnumerable<Movie> movies = QueryListObject("Proc_GetListMovie", param);
            return movies;
        }

        public bool InsertMovie(MovieInsertParam param)
        {
            return ExcuteInsert("Proc_InsertNewMovie",param);
        }

        public IEnumerable<TypeMovie> GetListTypeMovie()
        {
            IEnumerable<TypeMovie> typeMovies = QueryListObject(typeof(TypeMovie),"Proc_GetTypeMovie",null).Cast<TypeMovie>();
            return typeMovies;
        }

        public IEnumerable<CategoryMovie> GetListCategoryMovie()
        {
            IEnumerable<CategoryMovie> categoryMovies = QueryListObject(typeof(CategoryMovie), "Proc_GetCategoryMovie", null).Cast<CategoryMovie>();
            return categoryMovies;
        }

        public bool DeleteMovie(string param)
        {
            return ExcuteInsert("Proc_DeleteMovieByID", param,"MovieID");
        }

        public IEnumerable<CinemaStatusSeat> GetListSeatCinemaRoom(ShowTimeParam param)
        {
            IEnumerable<CinemaStatusSeat> listCinemaSeat = QueryListObject(typeof(CinemaStatusSeat), "Proc_GetSeatRoomCinema", param).Cast<CinemaStatusSeat>();
            return listCinemaSeat;
        }

        public bool UpdateSeatRoomCinema(List<ShowTimeParam> param)
        {
            string inputParam = JsonConvert.SerializeObject(param);
            return ExcuteInsert("Proc_UpdateSeatRoomCinema", inputParam, "ListSeatSelected");
        }

        public IEnumerable<TableTemplateTimeCode> GetTemplateTimeCode(ShowTimeParam param){
            IEnumerable<TableTemplateTimeCode> listTemplateTimeCode = QueryListObject(typeof(TableTemplateTimeCode), "Proc_GetTemplateTimeCodeByMovieID",param).Cast<TableTemplateTimeCode>();
            return listTemplateTimeCode;
        }

        public IEnumerable<Room> GetListRoom()
        {
            IEnumerable<Room> listRoom = QueryListObject(typeof(Room), "Proc_GetListRoom",null).Cast<Room>();
            return listRoom;
        }

        public bool CreateNewRoomCinema(ShowTimeParam param)
        {
            bool check = ExcuteInsert("Proc_CreateNewCinemaRoom", param);
            return check;
        }

        public IEnumerable<RoomCinemaMovie> GetListRoomCinemaByMovieID(ShowTimeParam param)
        {
            IEnumerable<RoomCinemaMovie> listRoomCinema = QueryListObject(typeof(RoomCinemaMovie),"Proc_GetListRoomCinemaByMovieID",param).Cast<RoomCinemaMovie>();
            return listRoomCinema;
        }

        public MovieAlter GetMovieAlterByID(ShowTimeParam param)
        {
            MovieAlter movieAlter = (MovieAlter)QueryObject(typeof(MovieAlter), "Proc_GetMovieByID", param);
            return movieAlter;
        }

        public bool AlterMovieByID(MovieAlter param)
        {
            bool check = ExcuteInsert("Proc_UpdateMovie", param);
            return check;
        }

        public Movie GetBiggestMovieCode()
        {
            Movie movie = (Movie)QueryObject(typeof(Movie), "Proc_GetBiggestMovieCode", null);
            return movie;
        }
    }
}
