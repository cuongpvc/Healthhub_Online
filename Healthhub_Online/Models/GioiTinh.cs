//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Healthhub_Online.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class GioiTinh
    {
        public GioiTinh()
        {
            this.NguoiDungs = new HashSet<NguoiDung>();
        }
    
        public int IDGioiTinh { get; set; }
        public string GioiTinh1 { get; set; }
    
        public virtual ICollection<NguoiDung> NguoiDungs { get; set; }
    }
}
