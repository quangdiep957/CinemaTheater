using AdminCinemaCommon.Models.DBOption;

namespace AdminCinemaDAL.Interface;

public interface IDBOption: IBaseRepository
{
    public IEnumerable<DBOption> GetAllDBOption();
    public bool UpdateDBOption(DBOption param);


}
