using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Models;
using AdminCinemaCommon.Models.Dictionary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaBLL.Interface
{
    public interface IDictionaryService: IBaseService
    {
        public bool InsertCategoryMovie(CategoryMovie param);

        public bool InsertTypeMovie(TypeMovie param);

        public IEnumerable<TemplateTimeMoiveOn> GetTemplateTimeCode();

        public bool InsertTemplateTimeCode(TemplateTimeMoiveOn param);

        public IEnumerable<Language> GetListLanguage();

        public bool InsertLanguage(Language param);

        public CinemaInfo GetCinemaInfo();

        public bool UpdateCinemaInfo(CinemaInfo param);


    }
}
