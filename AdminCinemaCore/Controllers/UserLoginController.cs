using AdminCinemaBLL.Interface;
using AdminCinemaCommon.Entities;
using Microsoft.AspNetCore.Mvc;
using System.Security.Principal;

namespace AdminCinemaCore.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UserLoginController : Controller
    {
        private IUserLoginService _service;
        public UserLoginController(IUserLoginService service) { 
            this._service= service;
        }


        [HttpPost("login")]
        public IActionResult Login([FromBody] Account user)
        {
            var token = _service.GetToken(user.AccountName, user.Password);
            return StatusCode(200, new { token });
        }

        [HttpPost("cinemadb")]
        public IActionResult CinemaDB([FromBody]string? DBName)
        {
            _service.ChangeConnectionDB(DBName);
            return StatusCode(200);
        }

        [HttpPost("loginuser")]
        public IActionResult loginuser([FromBody] Account user)
        {
            var token = _service.GetTokenUser(user.AccountName, user.Password);
            return StatusCode(200, new { token });
        }

        [HttpPost("loginuseruser")]
        public IActionResult loginuseruser([FromBody] Account user)
        {
            var token = _service.GetAccountUser(user.AccountName, user.Password);
            return StatusCode(200, new { token });
        }
    }
}
