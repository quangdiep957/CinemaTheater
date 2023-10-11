using AdminCinemaBLL.Interface;
using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Models.DBOption;
using AdminCinemaDAL.Interface;

namespace AdminCinemaBLL.Service;

public class DBOptionService: BaseService<Movie>, IDBOptionService
{
        IDBOption _repo;
    public DBOptionService(IDBOption repository) : base(repository)
    {
        _repo = repository;
    }

    public IEnumerable<DBOption> GetAllDBOption()
    {
        return _repo.GetAllDBOption();
    }

    public bool UpdateDBOption(DBOption param)
    {
        return _repo.UpdateDBOption(param);
    }
}
