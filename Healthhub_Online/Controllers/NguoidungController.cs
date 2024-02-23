﻿using Healthhub_Online.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages;

namespace Healthhub_Online.Controllers
{
    public class NguoidungController : Controller
    {
        private modelWeb db = new modelWeb();


        // GET: Nguoidung
        public ActionResult Index()
        {
            var nguoiDungs = db.NguoiDungs.Include(n => n.GioiTinh).Include(n => n.TinhThanh);

            return View(nguoiDungs.ToList());
        }

        // GET: Nguoidung/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NguoiDung nguoiDung = db.NguoiDungs.Find(id);
            if (nguoiDung == null)
            {
                return HttpNotFound();
            }
            return View(nguoiDung);
        }

        // GET: Nguoidung/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NguoiDung nguoiDung = db.NguoiDungs.Find(id);
            if (nguoiDung == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDGioiTinh = new SelectList(db.GioiTinhs, "IDGioiTinh", "GioiTinh1", nguoiDung.IDGioiTinh);
            ViewBag.IDTinh = new SelectList(db.TinhThanhs, "IDTinh", "TenTinh", nguoiDung.IDTinh);
            return View(nguoiDung);
        }

        // POST: Nguoidung/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDNguoiDung,HoTen,Email,DienThoai,TaiKhoan,MatKhau,IDGioiTinh,DiaChiCuThe,SoCMND,IDTinh,NhomMau,ThongTinKhac")] NguoiDung nguoiDung)
        {
            bool usernameExists = db.NguoiDungs.Any(u => u.TaiKhoan == nguoiDung.TaiKhoan);
            if (usernameExists)
            {
                ModelState.AddModelError("TaiKhoan", "Tài Khoản đã tồn tại");
            }

            bool phoneExists = db.NguoiDungs.Any(u => u.DienThoai == nguoiDung.DienThoai);
            if (phoneExists)
            {
                ModelState.AddModelError("DienThoai", "Số điện thoại đã được đăng ký");
            }

            bool emailExists = db.NguoiDungs.Any(u => u.Email == nguoiDung.Email);
            if (emailExists)
            {
                ModelState.AddModelError("Email", "Email đã được đăng ký");
            }

            if (ModelState.IsValid)
            {
                db.Entry(nguoiDung).State = EntityState.Modified;
                db.SaveChanges();
                ViewBag.capnhat = " Cập nhật thành công ";
            }
            ViewBag.IDGioiTinh = new SelectList(db.GioiTinhs, "IDGioiTinh", "GioiTinh1", nguoiDung.IDGioiTinh);
            ViewBag.IDTinh = new SelectList(db.TinhThanhs, "IDTinh", "TenTinh", nguoiDung.IDTinh);
            return View(nguoiDung);
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