namespace Healthhub_Online.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NguoiDung")]
    public partial class NguoiDung
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NguoiDung()
        {
            BenhAns = new HashSet<BenhAn>();
            DanhGias = new HashSet<DanhGia>();
            HoiDaps = new HashSet<HoiDap>();
            LichKhams = new HashSet<LichKham>();
        }

        [Key]
        public int IDNguoiDung { get; set; }

        [Required(ErrorMessage = "Cần nhập họ tên")]
        public string HoTen { get; set; }


        [Required(ErrorMessage = "Cần nhập Email")]
        [EmailAddress(ErrorMessage = "Email không phù hợp")]
        public string Email { get; set; }   // validation

        [Required(ErrorMessage = "Cần nhập số điện thoại")]
        [Phone(ErrorMessage = "Số điện thoại không phù hợp")]
        [RegularExpression(@"^\d{9,10}$", ErrorMessage = "Số điện thoại không phù hợp")]
        public string DienThoai { get; set; }   //validation

        [Required(ErrorMessage = "Cần nhập tài khoản")]
        [RegularExpression(@"^[a-zA-Z0-9]+$", ErrorMessage = "Tài khoản chỉ được chứa các ký tự A-Z,a-z,0-9")]
        public string TaiKhoan { get; set; }    //validation

        [Required(ErrorMessage = "Cần nhập mật khẩu")]
        public string MatKhau { get; set; }


        [Display(Name = "Giới tính")]
        public int? IDGioiTinh { get; set; }


        [Display(Name = "Địa chỉ cụ thể")]
        public string DiaChiCuThe { get; set; }
        [Display(Name = "Số chứng minh nhân dân")]
        public int? SoCMND { get; set; }
        [Display(Name = "Tỉnh")]
        public int? IDTinh { get; set; }
        [Display(Name = "Nhóm máu")]
        [StringLength(2)]

        public string NhomMau { get; set; }     //validation
        public string ThongTinKhac { get; set; }


        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BenhAn> BenhAns { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DanhGia> DanhGias { get; set; }

        public virtual GioiTinh GioiTinh { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HoiDap> HoiDaps { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LichKham> LichKhams { get; set; }

        public virtual TinhThanh TinhThanh { get; set; }
        public string AnhDaiDien { get; set; }


        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DanhGia> DanhGias { get; set; }

    }
}
