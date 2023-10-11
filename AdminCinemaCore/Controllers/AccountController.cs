using AdminCinemaBLL.Interface;
using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Models.Account;
using AdminCinemaCommon.Models.History;
using Microsoft.AspNetCore.Mvc;

namespace AdminCinemaCore.Controllers;

[ApiController]
[Route("api/[controller]")]
public class AccountController : ControllerBase
{
    private IAccountService _service;

    public AccountController(IAccountService service)
    {
        _service = service;
    }


    [HttpGet]
    [Route("GetAllAccount")]
    public IActionResult GetAllAccount()
    {
        try
        {
            var data = _service.GetAllAccount();
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpGet]
    [Route("GetAllAccountTemp")]
    public IActionResult GetAllAccountTemp()
    {
        try
        {
            var data = _service.GetAllAccountTemp();
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }


    [HttpPost]
    [Route("ComfirmAccount")]
    public IActionResult ComfirmAccount(AccountParam param)
    {
        try
        {
            var data = _service.ComfirmAccount(param);
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }


    [HttpPost]
    [Route("AddWaitListAccount")]
    public IActionResult AddWaitListAccount(AccountParam param)
    {
        try
        {
            var data = _service.AddWaitListAccount(param);
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }


    [HttpPost]
    [Route("UpdateAccount")]
    public IActionResult UpdateAccount(Account param)
    {
        try
        {
            var data = _service.UpdateAccount(param);
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }


    [HttpPost]
    [Route("CheckExistAccount")]
    public IActionResult CheckExistAccount(AccountParam param)
    {
        try
        {
            var data = _service.CheckExistAccount(param);
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpGet]
    [Route("GetListCustomer")]
    public IActionResult GetListCustomer()
    {
        try
        {
            var data = _service.GetListCustomer();
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpPost]
    [Route("DeleteAccount")]
    public IActionResult DeleteAccount(AccountParam param)
    {
        try
        {
            var data = _service.DeleteAccount(param);
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpPost]
    [Route("InsertNewAccount")]
    public IActionResult InsertNewAccount(Account param)
    {
        try
        {
            var data = _service.InsertNewAccount(param);
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpPost]
    [Route("InsertNewAccountUser")]
    public IActionResult InsertNewAccountUser(Account param)
    {
        try
        {
            var data = _service.InsertNewAccountUser(param);
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }


    [HttpGet]
    [Route("GetListCinema")]
    public IActionResult GetListCinema()
    {
        try
        {
            var data = _service.GetListCinema();
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpPost]
    [Route("GetAccountByID")]
    public IActionResult GetAccountByID(AccountParam param)
    {
        try
        {
            var data = _service.GetAccountByID(param);
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpPost]
    [Route("GetAccountByAccountName")]
    public IActionResult GetAccountByAccountName(AccountParam param)
    {
        try
        {
            var data = _service.GetAccountByAccountName(param);
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpPost]
    [Route("UpdatePassword")]
    public IActionResult UpdatePassword(Account param)
    {
        try
        {
            var data = _service.UpdatePassword(param);
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpPost]
    [Route("CreateNewCinema")]
    public IActionResult CreateNewCinema(CinemaTenant param)
    {
        try
        {
            var data = _service.CreateNewCinema(param);
            return StatusCode(200,data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }


}
