using AdminCinemaBLL.Interface;
using AdminCinemaCommon.Models;
using AdminCinemaCommon.Models.CinemaRoom;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AdminCinemaCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CinemaRoomController : ControllerBase
    {
        public ICinemeRoomService _service;

        public CinemaRoomController(ICinemeRoomService service)
        {
            _service = service;
        }

        [HttpGet]
        [Route("GetListCinemaRoom")]
        public IActionResult GetListCinemaRoom()
        {
            try
            {
                var data = _service.GetListRoom();
                return StatusCode(200, data);
            }catch (Exception ex)
            {
                return StatusCode(500, ex.Message); 
            }
        }

        [HttpPost]
        [Route("CreateNewRealRoom")]
        public IActionResult CreateNewRealRoom(RoomCinema param)
        {
            try
            {
                var data = _service.CreateNewRealRoom(param);
                return StatusCode(200, data);
            }catch(Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("GetListRealSeatByRoom")]
        public IActionResult GetListRealSeatByRoom(RoomCinema param)
        {
            try
            {
                var data = _service.GetRealSeatByRoom(param);
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("UpdateRealSeat")]
        public IActionResult UpdateRealSeat(List<RealSeatParam> param)
        {
            try
            {
                var data = _service.UpdateRealSeatRoom(param);
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("DeleteRealRoom")]
        public IActionResult DeleteRealRoom(RoomCinema param)
        {
            try
            {
                var data = _service.DeleteRealRoom(param);
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("DeleteCinemaRoomVirtual")]
        public IActionResult DeleteCinemaRoomVirtual(ShowTimeParam param)
        {
            try
            {
                var data = _service.DeleteCinemaRoomVirtual(param);
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

    }
}
