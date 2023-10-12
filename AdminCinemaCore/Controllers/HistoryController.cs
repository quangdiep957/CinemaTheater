using AdminCinemaCommon.Models;
using AdminCinemaCommon.Models.History;
using AdminCinemaCommon.Models.Ticket;
using AdminCinemaDAL.Interface;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Text.Json;

namespace AdminCinemaCore.Controllers;

[ApiController]
[Route("api/[controller]")]
public class HistoryController : ControllerBase
{

    private IHistory _service;

    public HistoryController(IHistory service)
    {
        _service = service;
    }

    [HttpPost]
    [Route("InsertIntoHistory")]
    public IActionResult InsertIntoHistory(HistoryParam param)
    {
        try
        {
            var data = _service.InsertIntoHistory(param);
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }
    [HttpPost]
    [Route("GetPrice")]
    public IActionResult GetPrice(HistoryParam param)
    {
        try
        {
            var par = new GetPrice();
                par.MovieID = param.MovieID ?? Guid.Empty;
            List<ShowPriceParam> ticketDetails = _service.GetPrice(par).ToList();
            List<ShowPriceParam> seatDetails = JsonConvert.DeserializeObject<List<ShowPriceParam>>(param.DataTicket);
            decimal price = 0;
            foreach (var item in seatDetails)
            {
               var s = ticketDetails.FirstOrDefault(x => x.Type == item.Type && x.MovieID == param.MovieID);
                if(s != null)
                {
                    price = (decimal)(price + s.Cost);
                }    
            }
            // update thông tin vào b?ng
            var data = _service.InsertIntoHistory(param);
            return StatusCode(200, price);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpGet]
    [Route("GetHistory")]
    public IActionResult GetHistory()
    {
        try
        {
            var data = _service.GetHistory();
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpPost]
    [Route("UpdateStatusExportInHistory")]
    public IActionResult UpdateStatusExportInHistory(History param)
    {
        try
        {
            var data = _service.UpdateStatusExportInHistory(param);
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }
    [HttpPost]
    [Route("UpdateStatusInHistorySuscess")]
    public IActionResult UpdateStatusInHistorySuscess(OrderGr orderId)
    {
        try
        {
            var data = _service.UpdateStatusInHistorySuscess(orderId);
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }


    [HttpPost]
    [Route("UpdateStatusExportInCinema")]
    public IActionResult UpdateStatusExportInCinema(HistoryParam param)
    {
        try
        {
            var data = _service.UpdateStatusExportInCinema(param);
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpPost]
    [Route("GetHistoryPaging")]
    public IActionResult GetHistoryPaging(HistoryPagingParam param)
    {
        try
        {
            var data = _service.GetHistoryPaging(param);
            return StatusCode(200, data);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }
}
