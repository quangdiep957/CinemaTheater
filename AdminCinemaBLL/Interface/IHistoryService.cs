using AdminCinemaCommon.Models.History;

namespace AdminCinemaBLL.Interface;

public interface IHistoryService : IBaseService
{
    public bool InsertIntoHistory(HistoryParam param);

    public IEnumerable<History> GetHistory();

    public bool UpdateStatusExportInHistory(History param);

    public bool UpdateStatusExportInCinema(HistoryParam param);

    public HistoryPaging GetHistoryPaging(HistoryPagingParam param);
    


}
