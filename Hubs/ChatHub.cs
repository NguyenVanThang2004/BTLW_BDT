using BTLW_BDT.Models;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BTLW_BDT.Hubs
{
    public class ChatHub : Hub
    {
        private readonly BtlLtwQlbdtContext _context;
        private static Dictionary<string, string> ConnectedUsers = new Dictionary<string, string>();

        public ChatHub(BtlLtwQlbdtContext context)
        {
            _context = context;
        }

        public override async Task OnConnectedAsync()
        {
            // Lưu thông tin người dùng kết nối
            var userType = Context.User.IsInRole("Admin") ? "admin" : "customer";
            var userId = Context.User.Identity.Name;
            ConnectedUsers[Context.ConnectionId] = userId;

            if (userType == "admin")
            {
                // Admin sẽ join vào tất cả các room chat
                var customers = await _context.KhachHangs.Select(k => k.MaKhachHang).ToListAsync();
                foreach (var customerId in customers)
                {
                    await Groups.AddToGroupAsync(Context.ConnectionId, $"chat_{customerId}");
                }
            }
            else
            {
                // Customer chỉ join vào room của mình
                await Groups.AddToGroupAsync(Context.ConnectionId, $"chat_{userId}");
            }

            await base.OnConnectedAsync();
        }

        public async Task SendMessage(string message, string maKhachHang)
        {
            var isAdmin = Context.User.IsInRole("Admin");
            var loaiNguoiGui = isAdmin ? "admin" : "customer";

            // Lưu tin nhắn vào database
            var tinNhan = new TinNhan
            {
                NoiDung = message,
                ThoiGian = DateTime.Now,
                TrangThai = false,
                MaKhachHang = maKhachHang,
                LoaiNguoiGui = loaiNguoiGui
            };

            _context.TinNhans.Add(tinNhan);
            await _context.SaveChangesAsync();

            // Gửi tin nhắn đến room tương ứng
            await Clients.Group($"chat_{maKhachHang}").SendAsync("ReceiveMessage", 
                loaiNguoiGui, 
                message, 
                tinNhan.ThoiGian
            );
        }

        public async Task LoadMessages(string maKhachHang)
        {
            // Lấy lịch sử tin nhắn
            var messages = await _context.TinNhans
                .Where(t => t.MaKhachHang == maKhachHang)
                .OrderBy(t => t.ThoiGian)
                .Take(100)
                .Select(t => new
                {
                    t.NoiDung,
                    t.ThoiGian,
                    t.LoaiNguoiGui,
                    t.TrangThai
                })
                .ToListAsync();

            await Clients.Caller.SendAsync("LoadMessageHistory", messages);
        }

        public async Task MarkAsRead(string maKhachHang)
        {
            // Đánh dấu đã đọc các tin nhắn
            var unreadMessages = await _context.TinNhans
                .Where(t => t.MaKhachHang == maKhachHang)
                .Where(t => t.TrangThai == false)
                .ToListAsync();

            foreach (var message in unreadMessages)
            {
                message.TrangThai = true;
            }

            await _context.SaveChangesAsync();
        }
    }
} 