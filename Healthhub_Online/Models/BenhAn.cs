namespace Healthhub_Online.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BenhAn")]
    public partial class BenhAn
    {
        [Key]
        public int IDBenhAn { get; set; }

        public string KetQua { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? ThoiGian { get; set; }

        [StringLength(50)]
        public string BacSyKham { get; set; }

        [StringLength(200)]
        public string DonThuoc { get; set; }

        public string GhiChu { get; set; }

        public int? IDNguoiDung { get; set; }

        public int? IDLichKham { get; set; }

        public virtual LichKham LichKham { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }
    }
}
