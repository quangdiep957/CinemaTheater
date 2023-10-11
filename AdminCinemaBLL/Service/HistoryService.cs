using AdminCinemaBLL.Interface;
using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Models.History;
using AdminCinemaDAL.Interface;

namespace AdminCinemaBLL.Service;

public class HistoryService : BaseService<Movie>, IHistoryService
{
    IHistory _repo;
    public HistoryService(IHistory repository) : base(repository)
    {
        _repo = repository;
    }

    public IEnumerable<History> GetHistory()
    {
        return _repo.GetHistory();
    }

    public HistoryPaging GetHistoryPaging(HistoryPagingParam param)
    {
        return _repo.GetHistoryPaging(param);
    }

    public bool InsertIntoHistory(HistoryParam param)
    {
        return _repo.InsertIntoHistory(param);
    }

    public bool UpdateStatusExportInCinema(HistoryParam param)
    {
        return _repo.UpdateStatusExportInCinema(param);

    }

    public bool UpdateStatusExportInHistory(History param)
    {
        return _repo.UpdateStatusExportInHistory(param);
    }
}
