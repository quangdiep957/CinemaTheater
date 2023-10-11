using AdminCinemaBLL.Interface;
using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Models;
using AdminCinemaCommon.Models.Dictionary;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AdminCinemaCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DictionaryController : ControllerBase
    {
        public IDictionaryService _service;

        public DictionaryController(IDictionaryService service)
        {
            _service = service;
        }

        [HttpPost]
        [Route("InsertCategoryMovie")]
        public IActionResult InsertCategoryMovie(CategoryMovie param)
        {
            try
            {
                var data = _service.InsertCategoryMovie(param);
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("InsertTypeMovie")]
        public IActionResult InsertTypeMovie(TypeMovie param)
        {
            try
            {
                var data = _service.InsertTypeMovie(param);
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }


        [HttpGet]
        [Route("GetTemplateTimeCode")]
        public IActionResult GetTemplateTimeCode()
        {
            try
            {
                var data = _service.GetTemplateTimeCode();
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("InsertTemplateTimeCode")]
        public IActionResult InsertTemplateTimeCode(TemplateTimeMoiveOn param)
        {
            try
            {
                var data = _service.InsertTemplateTimeCode(param);
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("InsertLanguage")]
        public IActionResult InsertLanguage(Language param)
        {
            try
            {
                var data = _service.InsertLanguage(param);
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }


        [HttpGet]
        [Route("GetListLanguage")]
        public IActionResult GetListLanguage()
        {
            try
            {
                var data = _service.GetListLanguage();
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet]
        [Route("GetCinemaInfo")]
        public IActionResult GetCinemaInfo()
        {
            try
            {
                var data = _service.GetCinemaInfo();
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("UpdateCinemaInfo")]
        public IActionResult UpdateCinemaInfo(CinemaInfo param)
        {
            try
            {
                var data = _service.UpdateCinemaInfo(param);
                return StatusCode(200, data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }

}
