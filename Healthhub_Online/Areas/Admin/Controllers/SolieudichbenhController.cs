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

namespace Healthhub_Online.Areas.Admin.Controllers
{
    public class SolieudichbenhController : Controller
    {
        private ModelWeb db = new ModelWeb();

        // GET: Admin/Solieucovids
        public ActionResult Index()
        {
            return View(db.Solieudichbenhs.ToList());
        }

        // GET: Admin/Solieucovids/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Solieudichbenh solieudichbenh = db.Solieudichbenhs.Find(id);
            if (solieudichbenh  == null)
            {
                return HttpNotFound();
            }
            return View(solieudichbenh);
        }

        // GET: Admin/Solieucovids/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Solieucovids/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDThongkecovid,Quocgia,Socanhiem,Dangdieutri,Khoi,Tuvong,Ghichu")] Solieudichbenh solieudichbenh)
        {
            if (ModelState.IsValid)
            {
                db.Solieudichbenhs.Add(solieudichbenh);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(solieudichbenh);
        }

        // GET: Admin/Solieucovids/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Solieudichbenh solieucovid = db.Solieudichbenhs.Find(id);
            if (solieucovid == null)
            {
                return HttpNotFound();
            }
            return View(solieucovid);
        }

        // POST: Admin/Solieucovids/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDThongkecovid,Quocgia,Socanhiem,Dangdieutri,Khoi,Tuvong,Ghichu")] Solieudichbenh solieudichbenh)
        {
            if (ModelState.IsValid)
            {
                db.Entry(solieudichbenh).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(solieudichbenh);
        }

        // GET: Admin/Solieucovids/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Solieudichbenh solieucovid = db.Solieudichbenhs.Find(id);
            if (solieucovid == null)
            {
                return HttpNotFound();
            }
            return View(solieucovid);
        }

        // POST: Admin/Solieucovids/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Solieudichbenh solieudichbenh = db.Solieudichbenhs.Find(id);
            db.Solieudichbenhs.Remove(solieudichbenh);
            db.SaveChanges();
            return RedirectToAction("Index");
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
