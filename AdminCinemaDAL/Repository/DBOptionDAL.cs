using AdminCinemaCommon.Entities;
using AdminCinemaDAL.Interface;
using Microsoft.Extensions.Configuration;
using AdminCinemaCommon.Models.DBOption;

namespace AdminCinemaDAL.Repository;

public class DBOptionDAL : BaseRepository<Movie>, IDBOption
{
    public DBOptionDAL(IConfiguration configuration) : base(configuration)
    {

    }

    public IEnumerable<DBOption> GetAllDBOption()
    {
        IEnumerable<DBOption> dbOptions = QueryListObject(typeof(DBOption), "Proc_GetDBOption", null).Cast<DBOption>();
        return dbOptions;
    }

    public bool UpdateDBOption(DBOption param)
    {
        var check = ExcuteInsert("Proc_UpdateDBOption", param);
        return check;
    }
}
