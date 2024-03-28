using System;
using System.Collections.Generic;

using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Healthhub_Online.Models;
using PagedList;

namespace Healthhub_Online.Controllers
{
    public class LichkhamController : Controller
    {
        public ModelWeb db = new ModelWeb();
        // GET: Lichkham
        public ActionResult Index(int? id, int? page)
        {
            var lichKhams = db.LichKhams.Include(l => l.NguoiDung).Include(l => l.QuanTri).
                Where(h => h.IDNguoiDung == id).OrderByDescending(x => x.BatDau).ThenBy(x => x.IDLichKham);
            int pageSize = 3;
            int pageNumber = (page ?? 1);
            ViewBag.id = id;
            return View(lichKhams.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Dangxuly(int? id, int? page)
        {
            var lichKhams = db.LichKhams.Include(l => l.NguoiDung).Include(l => l.QuanTri).
                Where(h => h.IDNguoiDung == id && h.TrangThai == 0).OrderByDescending(x => x.BatDau).ThenBy(x => x.IDLichKham);
            int pageSize = 3;
            int pageNumber = (page ?? 1);
            ViewBag.id = id;
            return View(lichKhams.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Daxacnhan(int? id, int? page)
        {
            var lichKhams = db.LichKhams.Include(l => l.NguoiDung).Include(l => l.QuanTri).
                Where(h => h.IDNguoiDung == id && h.TrangThai == 1).OrderByDescending(x => x.BatDau).ThenBy(x => x.IDLichKham);
            int pageSize = 3;
            int pageNumber = (page ?? 1);
            ViewBag.id = id;
            return View(lichKhams.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Datuvanxong(int? id, int? page)
        {
            var lichKhams = db.LichKhams.Include(l => l.NguoiDung).Include(l => l.QuanTri).
                Where(h => h.IDNguoiDung == id && h.TrangThai == 2).OrderByDescending(x => x.BatDau).ThenBy(x => x.IDLichKham);
            int pageSize = 3;
            int pageNumber = (page ?? 1);
            ViewBag.id = id;
            return View(lichKhams.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult DanhGia(int id)
        {
            // Check for success message
            if (TempData["SuccessMessage"] != null)
            {
                ViewBag.SuccessMessage = TempData["SuccessMessage"].ToString();
            }

            var lichKham = db.LichKhams.Find(id);
            if (lichKham == null)
            {
                return HttpNotFound();
            }

            // Create a new DanhGia object for the view
            var danhGia = new DanhGia
            {
                IDNguoiDung = lichKham.IDNguoiDung,
                IDQuanTri = lichKham.IDQuanTri,
                LichKham = lichKham
            };

            ViewBag.IDNguoiDung = new SelectList(db.NguoiDungs, "IDNguoiDung", "HoTen", danhGia.IDNguoiDung);
            ViewBag.IDQuanTri = new SelectList(db.QuanTris, "IDQuanTri", "HoTen", danhGia.IDQuanTri);
            ViewBag.IDDanhGiaChatLuong = new SelectList(db.DanhGiaChatLuongs, "IDDanhGiaChatLuong", "DanhGiaChatLuong1", danhGia.IDDanhGiaChatLuong);

            return View(danhGia);
        }


        // POST: Lichkham/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DanhGia(DanhGia danhGia)
        {
           
           
                if (ModelState.IsValid)
                {
                    // Save danhGia to the database
                    db.DanhGias.Add(danhGia);
                    db.SaveChanges();

                    // Redirect to Datuvanxong action with the user's ID
                    return RedirectToAction("Datuvanxong", new { id = danhGia.IDNguoiDung });
                }
            

            ViewBag.IDNguoiDung = new SelectList(db.NguoiDungs, "IDNguoiDung", "HoTen", danhGia.IDNguoiDung);
            ViewBag.IDQuanTri = new SelectList(db.QuanTris, "IDQuanTri", "HoTen", danhGia.IDQuanTri);
            ViewBag.IDDanhGiaChatLuong = new SelectList(db.DanhGiaChatLuongs, "IDDanhGiaChatLuong", "DanhGiaChatLuong1", danhGia.IDDanhGiaChatLuong);

            // Return back to the form with validation errors or "Lịch khám đã được đánh giá" message
            return View(danhGia);
        }



        // GET: LichKham/Benhan
        public ActionResult Benhan(int id)
        {
            LichKham lichKham = db.LichKhams.Find(id);
            if (lichKham == null || string.IsNullOrEmpty(lichKham.KetQuaKham))
            {
                ViewBag.Message = "File bệnh án chưa được gửi.";
                return View();
            }

            // Truyền tên file bệnh án vào view
            string path = Path.Combine(Server.MapPath("~/UploadedFiles"), lichKham.KetQuaKham);
            ViewBag.FilePath = path;
            ViewBag.IDLichKham = id; // Truyền ID của lịch khám

            return View();
        }

        // GET: LichKham/DownloadFile
        public ActionResult DownloadFile(int id)
        {
            LichKham lichKham = db.LichKhams.Find(id);
           

            // Tạo đường dẫn đến file
            string path = Path.Combine(Server.MapPath("~/UploadedFiles"), lichKham.KetQuaKham);

            // Kiểm tra file tồn tại trên server
            if (!System.IO.File.Exists(path))
            {
                ViewBag.Message = "File không tồn tại trên server.";
                return View("Benhan");
            }

            // Tải file về
            return File(path, "application/force-download", Path.GetFileName(path));
        }






        // GET: Lichkham/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LichKham lichKham = db.LichKhams.Find(id);
            if (lichKham == null)
            {
                return HttpNotFound();
            }
            return View(lichKham);
        }
        // GET: Lichkham/Create
        public ActionResult Create()
        {
            ViewBag.IDNguoiDung = new SelectList(db.NguoiDungs, "IDNguoiDung", "HoTen");
            ViewBag.IDQuanTri = new SelectList(db.QuanTris.Where(n => n.VaiTro == 2), "IDQuanTri", "HoTen");
            return View();
        }
        // POST: Lichkham/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDLichKham,ChuDe,MoTa,BatDau,KetThuc,TrangThai,ZoomInfo,KetQuaKham,IDNguoiDung,IDQuanTri")] LichKham lichKham)
        {
            // Kiểm tra nếu chủ đề trống
            if (string.IsNullOrWhiteSpace(lichKham.ChuDe))
            {
                ModelState.AddModelError("ChuDe", "Chủ đề không được để trống.");
            }

            // Kiểm tra nếu chủ đề chứa ký tự đặc biệt hoặc số
            if (!string.IsNullOrEmpty(lichKham.ChuDe) && (lichKham.ChuDe.Any(char.IsSymbol) || lichKham.ChuDe.Any(char.IsDigit)))
            {
                ModelState.AddModelError("ChuDe", "Chủ đề không được chứa ký tự đặc biệt hoặc số.");
            }

            // Kiểm tra nếu ngày bắt đầu nhỏ hơn ngày hiện tại
            if (lichKham.BatDau < DateTime.Now)
            {
                ModelState.AddModelError("BatDau", "Ngày bắt đầu phải lớn hơn ngày hiện tại.");
            }

            // Kiểm tra nếu ngày kết thúc nhỏ hơn ngày bắt đầu
            if (lichKham.KetThuc <= lichKham.BatDau)
            {
                ModelState.AddModelError("KetThuc", "Ngày kết thúc phải lớn hơn ngày bắt đầu.");
            }

            // Kiểm tra nếu ngày bắt đầu trùng với ngày bắt đầu của lịch đã tạo
            var existingLichKham = db.LichKhams.FirstOrDefault(l => l.BatDau == lichKham.BatDau);
            if (existingLichKham != null)
            {
                ModelState.AddModelError("BatDau", "Ngày này đã được tạo rồi.");
            }

            // Kiểm tra khoảng cách giữa hai lịch hẹn
            var lastLichKham = db.LichKhams
             .Where(l => l.IDNguoiDung == lichKham.IDNguoiDung)
             .OrderByDescending(l => l.BatDau)
             .FirstOrDefault();

            if (lastLichKham != null)
            {
                TimeSpan timeGap = lichKham.BatDau - lastLichKham.BatDau ?? TimeSpan.Zero;
                if (timeGap.TotalHours < 2)
                {
                    ModelState.AddModelError("BatDau", "Khoảng cách giữa hai lịch hẹn phải lớn hơn 2 tiếng.");
                }
            }



            if (ModelState.IsValid)
            {
                lichKham.TrangThai = 0;
                db.LichKhams.Add(lichKham);
                db.SaveChanges();
                return RedirectToAction("Index", "LichKham", new { id = lichKham.IDNguoiDung });
            }

            ViewBag.IDNguoiDung = new SelectList(db.NguoiDungs, "IDNguoiDung", "HoTen", lichKham.IDNguoiDung);
            ViewBag.IDQuanTri = new SelectList(db.QuanTris.Where(n => n.VaiTro == 2), "IDQuanTri", "HoTen");
            return View(lichKham);
        }


        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            LichKham lichKham = db.LichKhams.Find(id);
            if (lichKham == null)
            {
                return HttpNotFound();
            }

            // Load danh sách người dùng và bác sĩ để hiển thị trong dropdownlist
            ViewBag.IDNguoiDung = new SelectList(db.NguoiDungs, "IDNguoiDung", "HoTen", lichKham.IDNguoiDung);
            ViewBag.IDQuanTri = new SelectList(db.QuanTris, "IDQuanTri", "HoTen", lichKham.IDQuanTri);

            return View(lichKham);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(LichKham lichKham)
        {
            if (ModelState.IsValid)
            {
                // Lấy thông tin người đặt lịch và bác sĩ từ CSDL dựa trên ID được chọn từ form
                NguoiDung nguoiDung = db.NguoiDungs.Find(lichKham.IDNguoiDung);
                QuanTri quanTri = db.QuanTris.Find(lichKham.IDQuanTri);

                // Cập nhật thông tin lịch khám với người đặt lịch và bác sĩ mới
                lichKham.NguoiDung = nguoiDung;
                lichKham.QuanTri = quanTri;
                 lichKham.TrangThai = 0;
                db.Entry(lichKham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Dangxuly");
            }

            return View(lichKham);
        }




        // GET: Lichkham/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LichKham lichKham = db.LichKhams.Find(id);
            if (lichKham == null)
            {
                return HttpNotFound();
            }
            return View(lichKham);
        }

        // POST: Lichkham/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LichKham lichKham = db.LichKhams.Find(id);
            db.LichKhams.Remove(lichKham);
            db.SaveChanges();
            return RedirectToAction("Dangxuly");
        }


        public JsonResult Lichdangluoi()
        {
            db.Configuration.ProxyCreationEnabled = false;
            List<LichKham> l = db.LichKhams.Where(ll => ll.TrangThai == 1).ToList();

            var events = l.Select(ll => new
            {
                id = ll.IDLichKham,
                title = ll.ChuDe,
                start = ll.BatDau.HasValue ? ll.BatDau.Value.ToLocalTime() : (DateTime?)null, // Kiểm tra giá trị trước khi chuyển đổi
                end = ll.KetThuc.HasValue ? ll.KetThuc.Value.ToLocalTime() : (DateTime?)null, // Kiểm tra giá trị trước khi chuyển đổi
            });

            return new JsonResult { Data = events, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }


        public ActionResult lichhen()
        {
            return View();

        }
        private static DateTime ConvertFromUnixTimestamp(double timestamp)
        {
            var origin = new DateTime(2000, 1, 1, 0, 0, 0, 0);
            return origin.AddSeconds(timestamp);
        }





        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }

}