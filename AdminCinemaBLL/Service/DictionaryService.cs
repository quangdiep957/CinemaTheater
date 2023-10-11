using AdminCinemaBLL.Interface;
using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Models;
using AdminCinemaCommon.Models.Dictionary;
using AdminCinemaDAL.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaBLL.Service
{
    public class DictionaryService : BaseService<Movie>, IDictionaryService
    {
        IDictionaryMovie _repo;
        public DictionaryService(IDictionaryMovie repository) : base(repository)
        {
            _repo = repository;
        }

        public CinemaInfo GetCinemaInfo()
        {
            return _repo.GetCinemaInfo();
        }

        public IEnumerable<Language> GetListLanguage()
        {
            return _repo.GetListLanguage();
        }

        public IEnumerable<TemplateTimeMoiveOn> GetTemplateTimeCode()
        {
            return _repo.GetTemplateTimeCode();
        }

        public bool InsertCategoryMovie(CategoryMovie param)
        {
            return _repo.InsertCategoryMovie(param);
        }

        public bool InsertLanguage(Language param)
        {
            return _repo.InsertLanguage(param);
        }

        public bool InsertTemplateTimeCode(TemplateTimeMoiveOn param)
        {
            return _repo.InsertTemplateTimeCode(param);
        }

        public bool InsertTypeMovie(TypeMovie param)
        {
            return _repo.InsertTypeMovie(param);
        }

        public bool UpdateCinemaInfo(CinemaInfo param)
        {
            return _repo.UpdateCinemaInfo(param);
        }
    }
}
