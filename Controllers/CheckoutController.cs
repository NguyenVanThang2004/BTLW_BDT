using Microsoft.AspNetCore.Mvc;
using BTLW_BDT.Models.Cart;
using BTLW_BDT.Models;
using Microsoft.AspNetCore.Authorization;
using BTLW_BDT.Services;
using BTLW_BDT.Models.VnPay;
using BTLW_BDT.Models.Order;
using Microsoft.EntityFrameworkCore;
using System.Text.Json;

namespace BTLW_BDT.Controllers
{
    public class CheckoutController : Controller
    {
        private readonly BtlLtwQlbdtContext _context;
        private readonly IVnPayService _vnPayService;

        public CheckoutController(BtlLtwQlbdtContext context, IVnPayService vnPayService)
        {
            _context = context;
            _vnPayService = vnPayService;
        }

        public IActionResult DetailCheckout()
        {
            string userId = HttpContext.Session.GetString("Username");
            if (string.IsNullOrEmpty(userId))
            {
                return RedirectToAction("Login", "Access");
            }

            var gioHang = _context.GioHangs.FirstOrDefault(g => g.TenDangNhap == userId);
            if (gioHang == null)
            {
                return RedirectToAction("DetailCart", "Cart");
            }

            var chiTietGioHang = _context.ChiTietGioHangs
                .Include(c => c.MaGioHangNavigation)
                .Include(c => c.MaSanPhamNavigation)
                .Where(c => c.MaGioHang == gioHang.MaGioHang)
                .ToList();

            ViewData["Page"] = "Checkout";
            return View(chiTietGioHang);
        }

        [HttpPost]
        public IActionResult PlaceOrder(string paymentMethod)
        {
            string userId = HttpContext.Session.GetString("Username");
            if (string.IsNullOrEmpty(userId))
            {
                return RedirectToAction("Login", "Access");
            }

            var gioHang = _context.GioHangs.FirstOrDefault(g => g.TenDangNhap == userId);
            if (gioHang == null || !_context.ChiTietGioHangs.Any(c => c.MaGioHang == gioHang.MaGioHang))
            {
                return RedirectToAction("DetailCart", "Cart");
            }

            var chiTietGioHang = _context.ChiTietGioHangs
                .Include(c => c.MaSanPhamNavigation)
                .Where(c => c.MaGioHang == gioHang.MaGioHang)
                .ToList();

            if (paymentMethod == "Pay at store")
            {
                return ProcessStorePayment(chiTietGioHang, userId);
            }
            else
            {
                return ProcessVnPayPayment(chiTietGioHang);
            }
        }

        private IActionResult ProcessStorePayment(List<ChiTietGioHang> chiTietGioHang, string userId)
        {
            try
            {
                var khachHang = _context.KhachHangs.FirstOrDefault(k => k.TenDangNhap == userId);
                if (khachHang == null)
                {
                    TempData["Error"] = "Không tìm thấy thông tin khách hàng";
                    return RedirectToAction("DetailCart", "Cart");
                }

                var newMaHoaDon = GenerateNewOrderId();
                var totalAmount = CalculateTotal(chiTietGioHang);

                var order = new HoaDonBan
                {
                    MaHoaDon = newMaHoaDon,
                    PhuongThucThanhToan = "Pay at store",
                    TongTien = totalAmount,
                    ThoiGianLap = DateTime.Now,
                    MaKhachHang = khachHang.MaKhachHang
                };

                _context.HoaDonBans.Add(order);
                _context.SaveChanges();

                foreach (var item in chiTietGioHang)
                {
                    var sanPham = item.MaSanPhamNavigation;
                    var danhSachRom = _context.Roms.Where(r => r.MaSanPham == item.MaSanPham).ToList();
                    var baseRom = danhSachRom.OrderBy(r => r.Gia).FirstOrDefault();
                    var selectedRom = _context.Roms.FirstOrDefault(r => r.MaRom == item.ThongSoRom);

                    decimal baseRomGia = baseRom?.Gia.GetValueOrDefault() ?? 0;
                    decimal selectedRomGia = selectedRom?.Gia.GetValueOrDefault() ?? 0;
                    decimal donGia = (selectedRomGia - baseRomGia) + sanPham.DonGiaBanRa.GetValueOrDefault();

                    var orderDetail = new ChiTietHoaDonBan
                    {
                        MaHoaDon = order.MaHoaDon,
                        MaSanPham = item.MaSanPham,
                        SoLuongBan = item.SoLuong ?? 0,
                        DonGiaCuoi = donGia
                    };
                    _context.ChiTietHoaDonBans.Add(orderDetail);
                }

                UpdateInventory(chiTietGioHang);
                ClearCart(userId);

                _context.SaveChanges();

                HttpContext.Session.SetString("MaKhachHang", khachHang.MaKhachHang);

                TempData["Message"] = "Đặt hàng thành công - Thanh toán tại cửa hàng";
                return RedirectToAction("OrderSuccess");
            }
            catch (Exception ex)
            {
                TempData["Error"] = "Có lỗi xảy ra khi xử lý đơn hàng: " + ex.Message;
                return RedirectToAction("DetailCart", "Cart");
            }
        }

        private IActionResult ProcessVnPayPayment(List<ChiTietGioHang> chiTietGioHang)
        {
            try
            {
                var totalAmount = CalculateTotal(chiTietGioHang);

                TempData["PaymentAmount"] = totalAmount.ToString();

                var vnPayModel = new VnPaymentRequestModel
                {
                    Amount = (double)totalAmount,
                    CreatedDate = DateTime.Now,
                    Description = "Thanh toán đơn hàng",
                    FullName = HttpContext.Session.GetString("HoTen") ?? "Khách hàng",
                    OrderId = new Random().Next(1000, 100000)
                };

                var paymentUrl = _vnPayService.CreatePaymentUrl(HttpContext, vnPayModel);
                return Redirect(paymentUrl);
            }
            catch (Exception ex)
            {
                TempData["Error"] = "Có lỗi xảy ra khi xử lý thanh toán: " + ex.Message;
                return RedirectToAction("DetailCart", "Cart");
            }
        }

        private string GenerateNewOrderId()
        {
            return "HD" + DateTime.Now.ToString("yyyyMMddHHmmss");
        }

        private decimal CalculateTotal(List<ChiTietGioHang> items)
        {
            decimal total = 0;
            foreach (var item in items)
            {
                var sanPham = item.MaSanPhamNavigation;
                var danhSachRom = _context.Roms.Where(r => r.MaSanPham == item.MaSanPham).ToList();
                var baseRom = danhSachRom.OrderBy(r => r.Gia).FirstOrDefault();
                var selectedRom = _context.Roms.FirstOrDefault(r => r.MaRom == item.ThongSoRom);

                decimal baseRomGia = baseRom?.Gia.GetValueOrDefault() ?? 0;
                decimal selectedRomGia = selectedRom?.Gia.GetValueOrDefault() ?? 0;
                decimal donGia = (selectedRomGia - baseRomGia) + sanPham.DonGiaBanRa.GetValueOrDefault();

                total += donGia * (item.SoLuong ?? 0);
            }
            return total;
        }

        private void UpdateInventory(List<ChiTietGioHang> items)
        {
            foreach (var item in items)
            {
                var product = _context.SanPhams.Find(item.MaSanPham);
                if (product != null)
                {
                    product.SoLuongTonKho = product.SoLuongTonKho - (item.SoLuong ?? 0);
                }
            }
            _context.SaveChanges();
        }

        private void ClearCart(string userId)
        {
            var gioHang = _context.GioHangs.FirstOrDefault(g => g.TenDangNhap == userId);
            if (gioHang != null)
            {
                var chiTietGioHang = _context.ChiTietGioHangs.Where(c => c.MaGioHang == gioHang.MaGioHang);
                _context.ChiTietGioHangs.RemoveRange(chiTietGioHang);
                gioHang.TongTien = 0;
                _context.SaveChanges();
            }
        }

        public IActionResult PaymentCallback()
        {
            try
            {
                var response = _vnPayService.PaymentExecute(Request.Query);
                if (response == null || response.VnPayResponseCode != "00")
                {
                    TempData["Message"] = $"Lỗi thanh toán VN Pay: {response?.VnPayResponseCode}";
                    return RedirectToAction("PaymentFail");
                }

                string userId = HttpContext.Session.GetString("Username");
                var khachHang = _context.KhachHangs.FirstOrDefault(k => k.TenDangNhap == userId);
                if (khachHang == null)
                {
                    TempData["Error"] = "Không tìm thấy thông tin khách hàng";
                    return RedirectToAction("DetailCart", "Cart");
                }

                var newMaHoaDon = GenerateNewOrderId();

                var totalAmountStr = TempData["PaymentAmount"]?.ToString();
                if (!decimal.TryParse(totalAmountStr, out decimal totalAmount))
                {
                    TempData["Error"] = "Lỗi xử lý số tiền thanh toán";
                    return RedirectToAction("DetailCart", "Cart");
                }

                var order = new HoaDonBan
                {
                    MaHoaDon = newMaHoaDon,
                    PhuongThucThanhToan = "Bank transfer via QR code",
                    TongTien = totalAmount,
                    ThoiGianLap = DateTime.Now,
                    MaKhachHang = khachHang.MaKhachHang
                };

                _context.HoaDonBans.Add(order);
                _context.SaveChanges();

                var gioHang = _context.GioHangs.FirstOrDefault(g => g.TenDangNhap == userId);
                if (gioHang != null)
                {
                    var chiTietGioHang = _context.ChiTietGioHangs
                        .Include(c => c.MaSanPhamNavigation)
                        .Where(c => c.MaGioHang == gioHang.MaGioHang)
                        .ToList();

                    foreach (var item in chiTietGioHang)
                    {
                        var sanPham = item.MaSanPhamNavigation;
                        var danhSachRom = _context.Roms.Where(r => r.MaSanPham == item.MaSanPham).ToList();
                        var baseRom = danhSachRom.OrderBy(r => r.Gia).FirstOrDefault();
                        var selectedRom = _context.Roms.FirstOrDefault(r => r.MaRom == item.ThongSoRom);

                        decimal baseRomGia = baseRom?.Gia.GetValueOrDefault() ?? 0;
                        decimal selectedRomGia = selectedRom?.Gia.GetValueOrDefault() ?? 0;
                        decimal donGia = (selectedRomGia - baseRomGia) + sanPham.DonGiaBanRa.GetValueOrDefault();

                        var orderDetail = new ChiTietHoaDonBan
                        {
                            MaHoaDon = order.MaHoaDon,
                            MaSanPham = item.MaSanPham,
                            SoLuongBan = item.SoLuong ?? 0,
                            DonGiaCuoi = donGia
                        };
                        _context.ChiTietHoaDonBans.Add(orderDetail);
                    }

                    UpdateInventory(chiTietGioHang);
                    ClearCart(userId);
                }

                _context.SaveChanges();

                HttpContext.Session.SetString("MaKhachHang", khachHang.MaKhachHang);

                TempData["Message"] = "Thanh toán QR thành công";
                return RedirectToAction("OrderSuccess");
            }
            catch (Exception ex)
            {
                TempData["Error"] = "Có lỗi xảy ra khi xử lý thanh toán: " + ex.Message;
                return RedirectToAction("PaymentFail");
            }
        }

        public IActionResult OrderSuccess()
        {
            string userId = HttpContext.Session.GetString("MaKhachHang");
            if (string.IsNullOrEmpty(userId))
            {
                return RedirectToAction("Login", "Access");
            }

            var lastOrder = _context.HoaDonBans
                .Include(h => h.ChiTietHoaDonBans)
                .ThenInclude(c => c.MaSanPhamNavigation)
                .Where(h => h.MaKhachHang == userId)
                .OrderByDescending(h => h.ThoiGianLap)
                .FirstOrDefault();

            if (lastOrder == null)
            {
                TempData["Error"] = "Không tìm thấy đơn hàng";
                return RedirectToAction("Index", "Home");
            }

            return View(lastOrder);
        }

        public IActionResult PaymentFail()
        {
            return View();
        }
    }
}