namespace AdminCinemaCommon.Models;

public class RoomCinemaMovie
{
    public Guid? RoomCinemaID {get; set;}

    public Guid? RoomID {get; set;}

    public string RoomCode {get; set;}

    public string Time {get; set;}

    public DateTime? PostDate {get; set;}

    public string TemplateTimeCode {get; set;}
}
