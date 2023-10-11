using AdminCinemaBLL.Interface;
using AdminCinemaCommon.Models.Ticket;
using Microsoft.AspNetCore.Mvc;

namespace AdminCinemaCore.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class TicketController : ControllerBase
    {
        public ITicketService _service;

        public TicketController(ITicketService service)
        {
            _service = service;
        }

        [HttpPost]
        [Route("GetListTemplateTicket")]
        public IActionResult GetListTemplateTicket(FilterParam param)
        {
            try
            {
                var data = _service.GetListTemplateTicket(param);
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("UpdateCostOfTicket")]
        public IActionResult UpdateCostOfTicket(TicketParam param)
        {
            try
            {
                var data = _service.UpdateCostOfTicket(param);
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

    }

}

