﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
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
            if (ModelState.IsValid)
            {
                lichKham.TrangThai = 0;
                db.LichKhams.Add(lichKham);
                db.SaveChanges();
                return RedirectToAction("Index", "LichKham", new { id = lichKham.IDNguoiDung });
            }

            ViewBag.IDNguoiDung = new SelectList(db.NguoiDungs, "IDNguoiDung", "HoTen", lichKham.IDNguoiDung);
            ViewBag.IDQuanTri = new SelectList(db.QuanTris, "IDQuanTri", "HoTen", lichKham.IDQuanTri);
            return View(lichKham);
        }
    }

}