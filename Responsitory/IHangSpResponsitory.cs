using BTLW_BDT.Models;

namespace BTLW_BDT.Responsitory
{
    public interface IHangSpResponsitory
    {
        Hang Add(Hang hangSp);
        Hang Update(Hang hangSp);
        Hang Delete(Hang maHangSp);
        Hang GetHangSp(Hang maHangSp);
        IEnumerable<Hang> GetAllHangSp();
    }
}
