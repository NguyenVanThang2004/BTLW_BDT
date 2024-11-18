using BTLW_BDT.Responsitory;
using Microsoft.AspNetCore.Mvc;

namespace BTLW_BDT.ViewComponents
{
    public class HangSpMenuViewComponent : ViewComponent
    {
        private readonly IHangSpResponsitory _hangsp;
        public HangSpMenuViewComponent(IHangSpResponsitory hangSpResponsitory)
        {
            _hangsp = hangSpResponsitory;
        }   
        public IViewComponentResult Invoke()
        {
            var hangSp = _hangsp.GetAllHangSp();
            return View(hangSp);
        }
    }
}
