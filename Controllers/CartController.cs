using BTLW_BDT.Models.Cart;
using BTLW_BDT.Models;
using BTLW_BDT.ViewModels;
using BTLW_BDT;
using Microsoft.AspNetCore.Mvc;

public class CartController : Controller
{
    private readonly BtlLtwQlbdtContext _context;

    public CartController(BtlLtwQlbdtContext context)
    {
        _context = context;
    }

    public int CartCount
    {
        get { return Carts.Count(); }
    }

    public List<CartItem> Carts
    {
        get
        {
            var data = HttpContext.Session.Get<List<CartItem>>("GioHang");
            if (data == null)
            {
                data = new List<CartItem>();
            }
            return data;
        }
    }

    public IActionResult Index()
    {
        ViewBag.CartCount = CartCount;
        ViewData["Page"] = "Shopping Cart";
        return View(Carts);
    }

    public IActionResult DetailCart()
    {
        ViewBag.CartCount = CartCount;
        ViewData["Page"] = "Shopping Cart";
        return View(Carts);
    }

    public IActionResult AddToCart(string id, string? maMau = null, string? maRom = null)
    {
        var cart = HttpContext.Session.Get<List<CartItem>>("GioHang") ?? new List<CartItem>();

        // Lấy thông tin sản phẩm
        var sanPham = _context.SanPhams.SingleOrDefault(x => x.MaSanPham == id);
        if (sanPham == null) return RedirectToAction("Index", "Home");

        // Lấy danh sách màu và rom của sản phẩm cụ thể
        var danhSachMau = _context.MauSacs.Where(m => m.MaSanPham == id).ToList();
        var danhSachRom = _context.Roms.Where(r => r.MaSanPham == id).ToList();

        // Debug: Kiểm tra xem có lấy được danh sách màu không
        if (!danhSachMau.Any())
        {
            // Log hoặc thông báo nếu không có màu nào
            return RedirectToAction("Index", "Home");
        }

        // Nếu không chọn màu, lấy màu đầu tiên của sản phẩm này
        if (string.IsNullOrEmpty(maMau))
        {
            var firstColor = danhSachMau.FirstOrDefault();
            maMau = firstColor?.MaMau;
            System.Diagnostics.Debug.WriteLine($"Màu đầu tiên của SP {id}: {firstColor?.TenMau}");
        }

        // Nếu không chọn ROM, lấy ROM đầu tiên của sản phẩm này
        if (string.IsNullOrEmpty(maRom))
        {
            var firstRom = danhSachRom.FirstOrDefault();
            maRom = firstRom?.MaRom;
            System.Diagnostics.Debug.WriteLine($"ROM đầu tiên của SP {id}: {firstRom?.ThongSo}");
        }

        // Tìm item trong giỏ với cùng sản phẩm, màu và rom
        var item = cart.SingleOrDefault(x => x.MaSanPham == id
            && x.MaMau == maMau
            && x.MaRom == maRom);

        if (item == null)
        {
            var mauSac = danhSachMau.FirstOrDefault(x => x.MaMau == maMau);
            var rom = danhSachRom.FirstOrDefault(x => x.MaRom == maRom);

            // Debug: Kiểm tra thông tin màu và rom được chọn
            System.Diagnostics.Debug.WriteLine($"Màu được chọn cho SP {id}: {mauSac?.TenMau}");
            System.Diagnostics.Debug.WriteLine($"ROM được chọn cho SP {id}: {rom?.ThongSo}");

            item = new CartItem
            {
                MaSanPham = id,
                TenSanPham = sanPham.TenSanPham,
                DonGia = sanPham.DonGiaBanRa ?? 0,
                SoLuong = 1,
                Anh = sanPham.AnhDaiDien,
                MaMau = mauSac?.MaMau,
                TenMau = mauSac?.TenMau,
                MaRom = rom?.MaRom,
                DungLuongRom = rom?.ThongSo,
                CurrentPrice = sanPham.DonGiaBanRa ?? 0 
            };
            cart.Add(item);
        }
        else
        {
            item.SoLuong++;
        }

        HttpContext.Session.Set("GioHang", cart);
        return RedirectToAction("Index", "Home");
    }

    [HttpPost]
    public IActionResult RemoveFromCart(string maSanPham, string? maMau, string? maRom)
    {
        var myCart = Carts;
        var item = myCart.SingleOrDefault(x => x.MaSanPham == maSanPham
            && x.MaMau == maMau
            && x.MaRom == maRom);

        if (item != null)
        {
            myCart.Remove(item);
        }

        HttpContext.Session.Set("GioHang", myCart);
        return RedirectToAction("DetailCart");
    }

    [HttpPost]
    public IActionResult UpdateQuantity(string maSanPham, string? maMau, string? maRom, string action)
    {
        var myCart = Carts;
        var item = myCart.SingleOrDefault(x => x.MaSanPham == maSanPham
            && x.MaMau == maMau
            && x.MaRom == maRom);

        if (item != null)
        {
            if (action == "increase")
            {
                item.SoLuong++;
            }
            else if (action == "decrease" && item.SoLuong > 1)
            {
                item.SoLuong--;
            }
        }

        HttpContext.Session.Set("GioHang", myCart);
        return RedirectToAction("DetailCart");
    }

    public IActionResult ClearCart()
    {
        HttpContext.Session.Remove("GioHang");
        return RedirectToAction("Index", "Home");
    }

    public IActionResult Checkout()
    {
        if (!Carts.Any())
        {
            return RedirectToAction("Index", "Home");
        }

        ViewData["Page"] = "Checkout";
        return View();
    }
}