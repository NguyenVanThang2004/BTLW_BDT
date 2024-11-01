using BTLW_BDT.Models;
using BTLW_BDT.Repository;
using Microsoft.EntityFrameworkCore;

using BTLW_BDT.Models;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);


builder.Services.AddControllersWithViews();
builder.Services.AddSession();

// Đăng ký DbContext trong DI container
builder.Services.AddDbContext<BtlLtwQlbdtContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

var connectionString = builder.Configuration.GetConnectionString("BtlLtwQlbdtContext");
builder.Services.AddDbContext<BtlLtwQlbdtContext>(x => x.UseSqlServer(connectionString));

builder.Services.AddScoped<ILoaiSpRepository, LoaiSpRepository>();
builder.Services.AddSession();

// Cấu hình Session
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30); // Thời gian hết hạn của session
    options.Cookie.HttpOnly = true;                 // Cookie chỉ có thể truy cập qua HTTP (bảo mật)
    options.Cookie.IsEssential = true;              // Cookie là cần thiết
});

var app = builder.Build();


if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();


// Kích hoạt middleware session
app.UseSession(); // Thêm dòng này để kích hoạt session

app.UseAuthorization();
app.UseSession();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
