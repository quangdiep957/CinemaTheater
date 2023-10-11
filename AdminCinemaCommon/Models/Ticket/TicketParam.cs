namespace AdminCinemaCommon.Models.Ticket;

public class TicketParam
{
    public Guid? TemplateTicketID { get; set; }

    public decimal? Cost { get; set; }
}

public class FilterParam
{
    public string? Keyword { get; set; }
}