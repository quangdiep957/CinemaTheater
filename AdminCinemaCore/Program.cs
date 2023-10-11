using AdminCinemaBLL.Interface;
using AdminCinemaBLL.Service;
using AdminCinemaDAL.Interface;
using AdminCinemaDAL.Repository;
using Microsoft.Extensions.DependencyInjection;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddScoped<IUserLoginService, UserLoginService>();
builder.Services.AddScoped<IUserLogin, UserLoginDAL>();


builder.Services.AddScoped<IMovieService, MovieService>();
builder.Services.AddScoped<IMovie, MovieDAL>();

builder.Services.AddScoped<ICinemeRoomService, CinemaRoomService>();
builder.Services.AddScoped<ICinemaRoom, CinemaRoomDAL>();

builder.Services.AddScoped<ITicketService, TicketService>();
builder.Services.AddScoped<ITicket, TicketDAL>();

builder.Services.AddScoped<IHistoryService, HistoryService>();
builder.Services.AddScoped<IHistory, HistoryDAL>();

builder.Services.AddScoped<IReportService, ReportService>();
builder.Services.AddScoped<IReport, ReportDAL>();

builder.Services.AddScoped<IAccountService, AccountService>();
builder.Services.AddScoped<IAccount, AccountDAL>();

builder.Services.AddScoped<IDBOptionService, DBOptionService>();
builder.Services.AddScoped<IDBOption, DBOptionDAL>();


builder.Services.AddScoped<IDictionaryService, DictionaryService>();
builder.Services.AddScoped<IDictionaryMovie, DictionaryDAL>();

builder.Services.AddScoped<IVnPayService, VnPayService>();


builder.Services.AddCors(o =>
{
    o.AddPolicy("CorsPolicy", b =>
    {
        b.AllowAnyMethod().AllowAnyOrigin().AllowAnyHeader().Build();
    }
    );
}
);


builder.Services.AddControllers().AddNewtonsoftJson(

);



var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseCors("CorsPolicy");
app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
