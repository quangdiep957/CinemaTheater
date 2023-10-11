using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Models;
using AdminCinemaCommon.Models.History;
using AdminCinemaCommon.Models.Ticket;
using AdminCinemaDAL.Interface;
using Microsoft.Extensions.Configuration;

namespace AdminCinemaDAL.Repository;

public class HistoryDAL : BaseRepository<Account>, IHistory
{
    public HistoryDAL(IConfiguration configuration) : base(configuration)
    {

    }

    public bool InsertIntoHistory(HistoryParam param)
    {
        var check = ExcuteInsert("Proc_InsertToHistory",param);
        return check;
    }
    public IEnumerable<ShowPriceParam> GetPrice(GetPrice param)
    {
        var res = QueryListObject(typeof(ShowPriceParam), "Proc_Get_Price", param).Cast<ShowPriceParam>();
        return res;
    }

    public IEnumerable<History> GetHistory()
    {
        IEnumerable<History> lstHistory = QueryListObject(typeof(History),"Proc_GetHistory",null).Cast<History>();
        return lstHistory;
    }

    public bool UpdateStatusExportInHistory(History param)
    {
        var check = ExcuteInsert("Proc_UpdateStatusExportedInHistory", param);
        return check;
    }

    public bool UpdateStatusExportInCinema(HistoryParam param)
    {
        var check = ExcuteInsert("Proc_UpdateStatusExportedInCinema", param);
        return check;
    }

    public HistoryPaging GetHistoryPaging(HistoryPagingParam param)
    {
        HistoryPaging historys = new HistoryPaging();
        var res = QueryPagingBasic(typeof(History),"Proc_GetHistoryPaging",param);
        historys.History = res.Item1.Cast<History>();
        historys.TotalRecord = res.Item2;
        return historys;
    }
}
