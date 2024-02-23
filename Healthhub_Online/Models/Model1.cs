using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Healthhub_Online.Models
{
    public partial class modelWeb : DbContext
    {


        public virtual DbSet<BenhAn> BenhAns { get; set; }
        public virtual DbSet<GioiTinh> GioiTinhs { get; set; }
        public virtual DbSet<HoiDap> HoiDaps { get; set; }
        public virtual DbSet<Khoa> Khoas { get; set; }
        public virtual DbSet<LichKham> LichKhams { get; set; }
        public virtual DbSet<NguoiDung> NguoiDungs { get; set; }
        public virtual DbSet<QuanTri> QuanTris { get; set; }
        public virtual DbSet<Solieucovid> Solieucovids { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<TinhThanh> TinhThanhs { get; set; }
        public virtual DbSet<Tintuc> Tintucs { get; set; }
        public virtual DbSet<TrungTamGanNhat> TrungTamGanNhats { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.Email)
                .IsFixedLength();

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.DienThoai)
                .IsFixedLength();

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.TaiKhoan)
                .IsFixedLength();

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.MatKhau)
                .IsFixedLength();

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.NhomMau)
                .IsFixedLength();

            modelBuilder.Entity<QuanTri>()
                .Property(e => e.TaiKhoan)
                .IsFixedLength();

            modelBuilder.Entity<QuanTri>()
                .Property(e => e.MatKhau)
                .IsFixedLength();

            modelBuilder.Entity<QuanTri>()
                .Property(e => e.AnhBia)
                .IsFixedLength();

            modelBuilder.Entity<Solieucovid>()
                .Property(e => e.Ghichu)
                .IsFixedLength();

            modelBuilder.Entity<Tintuc>()
                .Property(e => e.TheLoai)
                .IsFixedLength();
        }
    }
}
