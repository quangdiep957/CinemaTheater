namespace AdminCinemaCommon.Report;

public class ChartMonth
{
    public decimal Amount {get; set;}

    public string? PostDay {get; set;}

    public DateTime? ShowDate {get; set;}

    public string? MovieName { get; set;}
}


public class ChartMonthData {
    public List<decimal> Amount { get; set; } = new List<decimal>();

    public List<string?> Day { get; set; } = new List<string?>();

    public List<string?> Name { get; set; } = new List<string?>();

    public List<int> Month { get; set; } = new List<int>();
}


public class ChartParam{
    public Guid? MovieID {get; set;}
}

public class ChartYearByMonth
{
    public decimal Amount { get; set; }

    public int Month { get; set;}
}


public class ChartDayByMovie
{
    public string MovieName { get; set; }

    public Guid? MovieID { get; set; }

    public decimal Amount { get; set; }
}
