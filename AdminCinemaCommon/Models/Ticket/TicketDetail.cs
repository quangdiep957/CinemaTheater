namespace AdminCinemaCommon.Models.Ticket;

public class TicketDetail
{
    public Guid? TemplateTicketID {get; set;}

    public Guid? MovieID {get; set;}

    public string MovieCode {get; set;}

    public string MovieName {get; set;}

    public DateTime? ReleaseDate {get; set;}

    public string Language {get; set;}

    public int? TimeLine {get; set;}

    public int? Type{get; set;}

    public decimal? Cost{get; set;}

    public string CinemaName {get; set;}

    public string CinemaAddress {get; set;}

    public string Hotline {get; set;}

    public string About {get; set;}

    public string MST {get; set;}
}
