using BTLW_BDT.Helpers;
using BTLW_BDT.Models;
using BTLW_BDT.Repository;
using BTLW_BDT.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Đăng ký các dịch vụ cần thiết
builder.Services.AddControllersWithViews();
builder.Services.AddSession();

// Đăng ký DbContext trong DI container
builder.Services.AddDbContext<BtlLtwQlbdtContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// Đăng ký Repository và Service trong DI container
builder.Services.AddScoped<ILoaiSpRepository, LoaiSpRepository>();
builder.Services.AddScoped<IVnPayService, VnPayService>();

// Đăng ký IHttpClientFactory
builder.Services.AddHttpClient();  // Thêm dòng này để đăng ký IHttpClientFactory

// Cấu hình Session
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30); // Thời gian hết hạn của session
    options.Cookie.HttpOnly = true;                 // Cookie chỉ có thể truy cập qua HTTP (bảo mật)
    options.Cookie.IsEssential = true;              // Cookie là cần thiết
});

// Đăng ký IHttpContextAccessor
builder.Services.AddHttpContextAccessor();


var app = builder.Build();


builder.Services.AddAuthorization();


if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

// Kích hoạt middleware cho session, authentication và authorization
app.UseSession();
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=access}/{action=login}/{id?}");

app.Run();
