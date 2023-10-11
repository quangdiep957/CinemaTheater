using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Report;
using AdminCinemaDAL.Interface;
using Microsoft.Extensions.Configuration;

namespace AdminCinemaDAL.Repository;

public class ReportDAL : BaseRepository<Movie>, IReport
{
    public ReportDAL(IConfiguration configuration) : base(configuration)
    {

    }

    public IEnumerable<ChartMonth> GetDataForChartByMovie(ChartParam param)
    {
        IEnumerable<ChartMonth> data = QueryListObject(typeof(ChartMonth), "Proc_GetChartMonthByMovie", param).Cast<ChartMonth>();
        return data;
    }

    /// <summary>
    /// Lấy số liệu thống kê doanh số của từng phim theo tháng hiện tại
    /// </summary>
    /// <returns></returns>
    public IEnumerable<ChartMonth> GetDataChartThisMonth()
    {
        IEnumerable<ChartMonth> data = QueryListObject(typeof(ChartMonth), "Proc_GetChartThisMonth", null).Cast<ChartMonth>();
        return data;
    }

    public IEnumerable<ChartYearByMonth> GetDateChartThisYearByMonth()
    {
        IEnumerable<ChartYearByMonth> data = QueryListObject(typeof(ChartYearByMonth), "Proc_GetChartThisYearByMonth", null).Cast<ChartYearByMonth>();
        return data;
    }

    /// <summary>
    /// Lấy số liệu thống kê doanh số theo từng bộ phim của ngày
    /// </summary>
    /// <returns></returns>
    public IEnumerable<ChartDayByMovie> GetDataChartDayByMovie()
    {
        IEnumerable<ChartDayByMovie> data = QueryListObject(typeof(ChartDayByMovie), "Proc_GetChartDayByMovie", null).Cast<ChartDayByMovie>();
        return data;
    }
}
