using Microsoft.EntityFrameworkCore;
using Persistence.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddDbContext<gardeningContext>(options =>
{
    string connectionString = builder.Configuration.GetConnectionString("ConexMySql");
    options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();

// dotnet ef dbcontext scaffold "server=localhost;user=root;password=123456;database=gardeningFiltro" Pomelo.EntityFrameworkCore.MySql -s .\API\ -p .\Domain\ --context gardeningContext --context-dir Data --output-dir Entities   
// dotnet ef migrations add UpdateDatabase -p Persistence -s API -o Data\Migrations
// dotnet ef database update -s .\API\ -p .\Persistence\
