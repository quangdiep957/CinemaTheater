using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Models;
using AdminCinemaCommon.Models.Dictionary;
using AdminCinemaDAL.Interface;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaDAL.Repository
{
    public class DictionaryDAL : BaseRepository<Movie>, IDictionaryMovie
    {
        public DictionaryDAL(IConfiguration configuration) : base(configuration)
        {
        }

        public bool InsertCategoryMovie(CategoryMovie param)
        {
            var check = ExcuteInsert("Proc_InsertCategoryMovie", param);
            return check;
        }

        public bool InsertTypeMovie(TypeMovie param)
        {
            var check = ExcuteInsert("Proc_InsertTypeMovie", param);
            return check;
        }

        public IEnumerable<TemplateTimeMoiveOn> GetTemplateTimeCode()
        {
            IEnumerable<TemplateTimeMoiveOn> templateTimeCodes = QueryListObject(typeof(TemplateTimeMoiveOn), "Proc_GetTemplateTimeCode", null).Cast<TemplateTimeMoiveOn>();
            return templateTimeCodes;
        }

        public bool InsertTemplateTimeCode(TemplateTimeMoiveOn param)
        {
            var check = ExcuteInsert("Proc_InsertTemplateTimeCode", param);
            return check;
        }

        public IEnumerable<Language> GetListLanguage()
        {
            var listLanguage = QueryListObject(typeof(Language), "Proc_GetListLanguage", null).Cast<Language>();
            return listLanguage;
        }


        public bool InsertLanguage(Language param)
        {
            var check = ExcuteInsert("Proc_InsertNewLanguage", param);
            return check;
        }

        public CinemaInfo GetCinemaInfo()
        {
            CinemaInfo data = (CinemaInfo)QueryObject(typeof(CinemaInfo), "Proc_GetCinemaInfo", null) ?? new CinemaInfo();
            return data;
        }
        
        public bool UpdateCinemaInfo(CinemaInfo param)
        {
            var check = ExcuteInsert("Proc_UpdateCinemaInfo",param);
            return check;
        }
    }
}
