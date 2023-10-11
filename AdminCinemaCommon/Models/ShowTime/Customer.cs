namespace AdminCinemaCommon.Models.ShowTime;

public class Customer
{
    public Guid? AccountID {get; set;}
    public string AccountName {get; set;}
    public int? Role {get; set;}
    public string Name {get; set;}
    public int Gender {get; set;}
    public DateTime? DateOfBirth {get; set;}
    public string PhoneNumber {get; set;}
    public int? Point {get; set;}
    public string MemberCode {get; set;}
    public int? TypeMember {get; set;}
    public DateTime? CreatedDate {get; set;}
    public string Email {get; set;}
}
