using AdminCinemaCommon.Models.DBOption;

namespace AdminCinemaBLL.Interface;

public interface IDBOptionService: IBaseService
{
    public IEnumerable<DBOption> GetAllDBOption();

    public bool UpdateDBOption(DBOption param);

    
}
