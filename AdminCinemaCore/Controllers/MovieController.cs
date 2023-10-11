using AdminCinemaBLL.Interface;
using AdminCinemaCommon.Models;
using AdminCinemaCommon.Models.HomePage;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Net.WebSockets;

namespace AdminCinemaCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MovieController : ControllerBase
    {
        private IMovieService _service;

        public MovieController(IMovieService service)
        {
            _service = service;
        }

        [HttpPost]
        [Route("GetListMovie")]
        public IActionResult GetListMovie(MovieParam param)
        {
            try
            {
                var data = _service.GetListMovie(param);
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet]
        [Route("GetListTypeMovie")]
        public IActionResult GetListTypeMovie()
        {
            try
            {
                var data = _service.GetListTypeMovie();
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet]
        [Route("GetListCategoryMovie")]
        public IActionResult GetListCategoryMovie()
        {
            try
            {
                var data = _service.GetListCategoryMovie();
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("InsertMovie")]
        public IActionResult InsertMovie(MovieInsertParam param)
        {
            try
            {
                var res = _service.InsertMovie(param);
                if (res)
                {
                    return StatusCode(200, res);
                }
                else
                {
                    return StatusCode(500);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("DeleteMovie")]
        public IActionResult DeleteMovie([FromBody] string param)
        {
            try
            {
                var res = _service.DeleteMovie(param);
                if (res)
                {
                    return StatusCode(200, res);
                }
                else
                {
                    return StatusCode(500);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("GetListSeatCinemaRoom")]
        public IActionResult GetListSeatCinemaRoom(ShowTimeParam param)
        {
            try
            {
                var res = _service.GetListSeatCinemaRoom(param);
                return StatusCode(200, res);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }


        [HttpPost]
        [Route("UpdateSeatRoomCinema")]
        public IActionResult UpdateSeatRoomCinema(List<ShowTimeParam> param)
        {
            try
            {
                var res = _service.UpdateSeatRoomCinema(param);
                if (res)
                {
                    return StatusCode(200, res);
                }
                else
                {
                    return StatusCode(500);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("GetTemplateTimeCodeByMovieID")]
        public IActionResult GetTemplateTimeCodeByMovieID(ShowTimeParam param)
        {
            try
            {
                var res = _service.GetTemplateTimeCode(param);

                return StatusCode(200, res);

            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet]
        [Route("GetListRoom")]
        public IActionResult GetListRoom()
        {
            try
            {
                var data = _service.GetListRoom();
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("CreateNewRoomCinema")]
        public IActionResult CreateNewRoomCinema(ShowTimeParam param)
        {
            try
            {
                var res = _service.CreateNewRoomCinema(param);
                if (res)
                {
                    return StatusCode(200, res);
                }
                else
                {
                    return StatusCode(500);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("GetListRoomCinemaByMovieID")]
        public IActionResult GetListRoomCinemaByMovieID(ShowTimeParam param)
        {
            try
            {
                var data = _service.GetListRoomCinemaByMovieID(param);
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("GetMovieAlterByMovieID")]
        public IActionResult GetMovieAlterByMovieID(ShowTimeParam param)
        {
            try
            {
                var data = _service.GetMovieAlterByID(param);
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }


        [HttpPost]
        [Route("AlterMovieByID")]
        public IActionResult AlterMovieByID(MovieAlter param)
        {
            try
            {
                var res = _service.AlterMovieByID(param);
                if (res)
                {
                    return StatusCode(200, res);
                }
                else
                {
                    return StatusCode(500);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet]
        [Route("GetBiggestMovieCode")]
        public IActionResult GetBiggestMovieCode()
        {
            try
            {
                var res = _service.GetBiggestMovieCode();

                return StatusCode(200, res);

            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
