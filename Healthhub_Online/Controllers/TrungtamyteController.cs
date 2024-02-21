using Healthhub_Online.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Healthhub_Online.Models;

namespace Healthhub_Online.Controllers
{
    public class TrungtamyteController : Controller
    {
        WebAppYteEntities db = new WebAppYteEntities();
        [HttpGet]
        public ActionResult Index()
        {
            ViewBag.IDTinh = new SelectList(db.TinhThanhs, "IDTinh", "TenTinh");
            return View();
        }
        [HttpGet]
        public ActionResult Trungtamyte()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Trungtamyte(FormCollection id)
        {
            String str = id["IDTinh"].ToString();
            int idT = int.Parse(str);
            var tt = db.TrungTamGanNhats.Where(h => h.IDTinh == idT).Include(h => h.TinhThanh).ToList();
            return View(tt);
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.NotFound);
            }
            TrungTamGanNhat tt = db.TrungTamGanNhats.Find(id);
            if (tt == null)
            {
                return HttpNotFound();
            }
            return View(tt);
        }

    }


}