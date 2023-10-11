using AdminCinemaCommon.Models.Paging;

namespace AdminCinemaCommon.Models.History;

public class HistoryParam
{
    public Guid? MovieID { get; set; }

    public Guid? RoomCinemaID { get; set; }

    public string? CustomerName { get; set; }

    public string? PhoneNumber { get; set; }

    public string? TemplateTimeCode { get; set; }

    public string? CreatedBy { get; set; }

    public string? DataTicket { get; set; }

    public string? MovieName { get; set; }

    public DateTime? ShowDate { get; set; }

    public string? Time { get; set; }

    public string? RoomCode { get; set; }

    public bool? IsExported { get; set; }
    public int? Status { get; set; }
}

public class GetPrice
{
    public Guid MovieID { get; set; }
}


public class DataTicket
{
    public decimal? Amount { get; set; }

    public Guid? SeatID { get; set; }
}


public class HistoryPagingParam : BasicPagingParam
{
    public string? RoomCode{get; set;}
}

public class HistoryPaging
{
    public IEnumerable<History>? History { get; set; }

    public int TotalRecord
    {
        get; set;
    }

}