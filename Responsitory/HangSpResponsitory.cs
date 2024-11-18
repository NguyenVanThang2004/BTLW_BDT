using BTLW_BDT.Models;
namespace BTLW_BDT.Responsitory
{
    public class HangSpResponsitory : IHangSpResponsitory
    {
        private readonly BtlLtwQlbdtContext _context;
        public HangSpResponsitory(BtlLtwQlbdtContext context)
        {
            _context = context;
        }
        public Hang Add(Hang hangSp)
        {
            _context.Hangs.Add(hangSp);
            _context.SaveChanges();
            return hangSp;
        }

        public Hang Delete(Hang maHangSp)
        {
            throw new NotImplementedException();
        }
        public IEnumerable<Hang> GetAllHangSp() 
        {
            return _context.Hangs;
        }
        public Hang GetHangSp(Hang maHangSp)
        {
            return _context.Hangs.Find(maHangSp);
        }
        public Hang Update(Hang hangSp) 
        {
            _context.Update(hangSp);
            _context.SaveChanges();
            return hangSp;
        }
    }
}


//continue
