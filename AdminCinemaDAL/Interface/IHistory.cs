using AdminCinemaCommon.Models;
using AdminCinemaCommon.Models.History;
using AdminCinemaCommon.Models.Ticket;

namespace AdminCinemaDAL.Interface;

public interface IHistory:IBaseRepository
{
    public bool InsertIntoHistory(HistoryParam param);

    public IEnumerable<ShowPriceParam> GetPrice(GetPrice param);
    public IEnumerable<History> GetHistory();

    public bool UpdateStatusExportInHistory(History param);

    public bool UpdateStatusExportInCinema(HistoryParam param);

    public HistoryPaging GetHistoryPaging(HistoryPagingParam param);


}
