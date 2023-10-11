using AdminCinemaBLL.Interface;
using AdminCinemaCommon.Report;
using Microsoft.AspNetCore.Mvc;

namespace AdminCinemaCore.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ReportController : ControllerBase
{
    public IReportService _service;
    public ReportController(IReportService service)
    {
        _service = service;
    }

    [HttpPost]
    [Route("GetDataForChartByMovie")]
    public IActionResult GetDataForChartByMovie(ChartParam param)
    {
        try
        {
            var data = _service.GetDataForChartByMovie(param);
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpGet]
    [Route("GetDataChartThisMonth")]
    public IActionResult GetDataChartThisMonth()
    {
        try
        {
            var data = _service.GetDataChartThisMonth();
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpGet]
    [Route("GetDateChartThisYearByMonth")]
    public IActionResult GetDateChartThisYearByMonth()
    {
        try
        {
            var data = _service.GetDateChartThisYearByMonth();
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpGet]
    [Route("GetDataChartDayByMovie")]
    public IActionResult GetDataChartDayByMovie()
    {
        try
        {
            var data = _service.GetDataChartDayByMovie();
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

}
