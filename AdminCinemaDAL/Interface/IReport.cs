using AdminCinemaCommon.Report;

namespace AdminCinemaDAL.Interface;

public interface IReport:IBaseRepository
{
    public IEnumerable<ChartMonth> GetDataForChartByMovie(ChartParam param);

    public IEnumerable<ChartMonth> GetDataChartThisMonth();

    public IEnumerable<ChartYearByMonth> GetDateChartThisYearByMonth();

    public IEnumerable<ChartDayByMovie> GetDataChartDayByMovie();

}
