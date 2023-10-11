using AdminCinemaBLL.Interface;
using AdminCinemaCommon.Models.DBOption;
using AdminCinemaDAL.Interface;
using Microsoft.AspNetCore.Mvc;

namespace AdminCinemaCore.Controllers;

[ApiController]
[Route("api/[controller]")]
public class DBOptionController : ControllerBase
{
    private IDBOptionService _service;

    public DBOptionController(IDBOptionService service)
    {
        _service = service;
    }

    [HttpGet]
    [Route("GetAllDBOption")]
    public IActionResult GetAllDBOption()
    {
        try
        {
            var data = _service.GetAllDBOption();
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpPost]
    [Route("UpdateDBOption")]
    public IActionResult UpdateDBOption(DBOption param)
    {
        try
        {
            var data = _service.UpdateDBOption(param);
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }
}
