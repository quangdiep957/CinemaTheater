using AdminCinemaBLL.Interface;
using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Models;
using AdminCinemaCommon.Models.HomePage;
using AdminCinemaDAL.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaBLL.Service
{
    public class MovieService : BaseService<Movie>, IMovieService
    {
        IMovie _repo;
        public MovieService(IMovie repo) : base(repo)
        {
            _repo = repo;
        }

        public bool AlterMovieByID(MovieAlter param)
        {
            return _repo.AlterMovieByID(param);
        }

        public bool CreateNewRoomCinema(ShowTimeParam param)
        {
            return _repo.CreateNewRoomCinema(param);
        }

        public bool DeleteMovie(string param)
        {
            return _repo.DeleteMovie(param);
        }

        public string GetBiggestMovieCode()
        {
            Movie movie = _repo.GetBiggestMovieCode();
            if (movie != null)
            {
                if (!String.IsNullOrEmpty(movie.MovieCode))
                {
                    return movie.MovieCode;
                }
                else
                {
                    return "A0000";
                }
            }
            else
            {
                return "A0000";
            }


        }

        public IEnumerable<CategoryMovie> GetListCategoryMovie()
        {
            return _repo.GetListCategoryMovie();
        }

        /// <summary>
        /// Hàm thực hiện lấy ra danh sách phim
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public IEnumerable<Movie> GetListMovie(MovieParam param)
        {
            var movies = _repo.GetListMovie(param);
            return movies;
        }

        public IEnumerable<Room> GetListRoom()
        {
            return _repo.GetListRoom();
        }

        public IEnumerable<RoomCinemaMovie> GetListRoomCinemaByMovieID(ShowTimeParam param)
        {
            return _repo.GetListRoomCinemaByMovieID(param);
        }

        public IEnumerable<CinemaStatusSeat> GetListSeatCinemaRoom(ShowTimeParam param)
        {
            return _repo.GetListSeatCinemaRoom(param);
        }

        public IEnumerable<TypeMovie> GetListTypeMovie()
        {
            return _repo.GetListTypeMovie();
        }

        public MovieAlter GetMovieAlterByID(ShowTimeParam param)
        {
            return _repo.GetMovieAlterByID(param);
        }

        public IEnumerable<TableTemplateTimeCode> GetTemplateTimeCode(ShowTimeParam param)
        {
            return _repo.GetTemplateTimeCode(param);
        }

        public bool InsertMovie(MovieInsertParam param)
        {
            return _repo.InsertMovie(param);
        }

        public bool UpdateSeatRoomCinema(List<ShowTimeParam> param)
        {
            return _repo.UpdateSeatRoomCinema(param);
        }
    }
}
