using Microsoft.AspNetCore.Mvc;

namespace BTLW_BDT.Controllers
{
    public class CheckoutController : Controller
    {
        public IActionResult DetailCheckout()
        {
            ViewData["Page"] = "Checkout";
            return View();
        }
    }
}
