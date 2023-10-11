using AdminCinemaCommon.Report;

namespace AdminCinemaBLL.Interface;

public interface IReportService : IBaseService
{
    public ChartMonthData GetDataForChartByMovie(ChartParam param);

    public ChartMonthData GetDataChartThisMonth();

    public ChartMonthData GetDateChartThisYearByMonth();

    public ChartMonthData GetDataChartDayByMovie();



}
