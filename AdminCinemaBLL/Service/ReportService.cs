using AdminCinemaBLL.Interface;
using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Report;
using AdminCinemaDAL.Interface;

namespace AdminCinemaBLL.Service;

public class ReportService : BaseService<Movie>, IReportService
{
    IReport _repo;
    public ReportService(IReport repository) : base(repository)
    {
        _repo = repository;
    }

    public ChartMonthData GetDataChartDayByMovie()
    {
        IEnumerable<ChartDayByMovie> data = _repo.GetDataChartDayByMovie();

        ChartMonthData dataReturn = new ChartMonthData();
        if (data != null)
        {
            foreach (var item in data)
            {
                dataReturn.Amount.Add(item.Amount);
                dataReturn.Name.Add(item.MovieName);
            }
        }
        return dataReturn;
    }

    public ChartMonthData GetDataChartThisMonth()
    {
        IEnumerable<ChartMonth> data = _repo.GetDataChartThisMonth();

        ChartMonthData dataReturn = new ChartMonthData();
        if (data != null)
        {
            foreach (var item in data)
            {
                dataReturn.Amount.Add(item.Amount);
                dataReturn.Name.Add(item.MovieName);
            }
        }
        return dataReturn;
    }

    public ChartMonthData GetDataForChartByMovie(ChartParam param)
    {
        IEnumerable<ChartMonth> data = _repo.GetDataForChartByMovie(param);
        ChartMonthData dataReturn = new ChartMonthData();
        if (data != null)
        {
            foreach (var item in data)
            {
                dataReturn.Amount.Add(item.Amount);
                dataReturn.Day.Add(item.PostDay);
            }
        }
        return dataReturn;
    }

    public ChartMonthData GetDateChartThisYearByMonth()
    {
        IEnumerable<ChartYearByMonth> data = _repo.GetDateChartThisYearByMonth();

        ChartMonthData dataReturn = new ChartMonthData();
        if (data != null)
        {
            foreach (var item in data)
            {
                dataReturn.Amount.Add(item.Amount);
                dataReturn.Month.Add(item.Month);
            }
        }
        return dataReturn;
    }
}
