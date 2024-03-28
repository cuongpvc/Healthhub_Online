using Healthhub_Online.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Healthhub_Online.Models;
using PagedList;

namespace Healthhub_Online.Areas.Admin.Controllers
{
    public class QuanTrisController : Controller
    {
        private ModelWeb db = new ModelWeb();

        // GET: Admin/QuanTris
        public ActionResult Index()
        {
            var quanTris = db.QuanTris.Include(q => q.Khoa);
            return View(quanTris.ToList());
        }
        public ActionResult ListBan()
        {
            var quanTris = db.QuanTris.Where(q => q.TrangThai == false).ToList();
            return View(quanTris);
        }
        // GET: Admin/QuanTris/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            QuanTri quanTri = db.QuanTris.Find(id);
            if (quanTri == null)
            {
                return HttpNotFound();
            }
            return View(quanTri);
        }

        // GET: Admin/QuanTris/Create
        public ActionResult Create()
        {
            ViewBag.IDKhoa = new SelectList(db.Khoas, "IDKhoa", "TenKhoa");
            return View();
        }

        // POST: Admin/QuanTris/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDQuanTri,TaiKhoan,MatKhau,VaiTro,ThongTinBacSi,TrinhDo,IDKhoa,HoTen,AnhBia")] QuanTri quanTri)
        {
            if (ModelState.IsValid)
            {
                db.QuanTris.Add(quanTri);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDKhoa = new SelectList(db.Khoas, "IDKhoa", "TenKhoa", quanTri.IDKhoa);
            return View(quanTri);
        }

        // GET: Admin/QuanTris/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            QuanTri quanTri = db.QuanTris.Find(id);
            if (quanTri == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDKhoa = new SelectList(db.Khoas, "IDKhoa", "TenKhoa", quanTri.IDKhoa);
            return View(quanTri);
        }

        // POST: Admin/QuanTris/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDQuanTri,TaiKhoan,MatKhau,VaiTro,ThongTinBacSi,TrinhDo,IDKhoa,HoTen,AnhBia")] QuanTri quanTri)
        {
            if (ModelState.IsValid)
            {
                db.Entry(quanTri).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDKhoa = new SelectList(db.Khoas, "IDKhoa", "TenKhoa", quanTri.IDKhoa);
            return View(quanTri);
        }

        // GET: Admin/QuanTris/Ban/5
        public ActionResult Ban(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            QuanTri quanTri = db.QuanTris.Find(id);
            if (quanTri == null)
            {
                return HttpNotFound();
            }
            else
            {
                quanTri.TrangThai = !quanTri.TrangThai;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            
        }

        public ActionResult UnBan(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            QuanTri quanTri = db.QuanTris.Find(id);
            if (quanTri == null)
            {
                return HttpNotFound();
            }
            else
            {
                quanTri.TrangThai = !quanTri.TrangThai;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
        }
        public ActionResult KiemTraDanhGia(int? page)
        {
            var danhgia = db.DanhGias.OrderBy(x => x.IDDanhGia).ThenBy(y => y.IDDanhGiaChatLuong).ToList();
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            return View(danhgia.ToPagedList(pageNumber, pageSize));
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
