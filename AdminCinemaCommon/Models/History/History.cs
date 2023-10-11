namespace AdminCinemaCommon.Models.History;

public class History
{
    public Guid? CheckoutID { get; set; }
    public Guid? TicketID { get; set; }
    public Guid? MovieID { get; set; }
    public Guid? RoomCinemaID { get; set; }
    public Guid? ParentID { get; set; }
    public string MovieName { get; set; }
    public string CustomerName { get; set; }
    public string PhoneNumber { get; set; }
    public decimal TotalAmount { get; set; }
    public string SeatName { get; set; }
    public string TemplateTimeCode { get; set; }
    public string CreatedBy { get; set; }
    public DateTime? CreatedDate { get; set; }
    public DateTime? ShowDate { get; set; }
    public string Time { get; set; }
    public int? Type {get; set;}

    public string? RoomCode { get; set; }

    public bool? IsExported { get; set; }
}
