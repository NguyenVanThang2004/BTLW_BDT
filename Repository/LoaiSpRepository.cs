using BTLW_BDT.Models;
namespace BTLW_BDT.Repository
{
    public class LoaiSpRepository : ILoaiSpRepository
    {
        private readonly BtlLtwQlbdt3Context _context;
        public LoaiSpRepository(BtlLtwQlbdt3Context context)
        {
            _context = context; 
        }
        public SanPham Add(SanPham loaiSp)
        {
            _context.SanPhams.Add(loaiSp);
            _context.SaveChanges();
            return loaiSp;
        }

        public SanPham Delete(SanPham maloaiSp)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<SanPham> GetAllLoaiSp()
        {
            return _context.SanPhams;
        }

        public SanPham GeSanPham(SanPham maloaiSp)
        {
            return _context.SanPhams.Find(maloaiSp);
        }

        public SanPham Update(SanPham loaiSp)
        {
            _context.Update(loaiSp);
            _context.SaveChanges();
            return loaiSp;
        }
    }
}
