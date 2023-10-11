namespace AdminCinemaCommon.Models.Dictionary;

public class CinemaInfo
{
    public Guid CinemaID {get; set;}

    public string CinemaCode {get; set;}

    public string CinemaName {get; set;}

    public string CinemaAddress {get; set;}

    public string? SortOrder {get ;set;}

    public string? About {get ;set;}

    public string? Hotline {get; set;}

    public string? Fax {get; set;}

    public string? MST {get; set;}
}
