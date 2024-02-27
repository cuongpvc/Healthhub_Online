using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Healthhub_Online.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Trangchu()
        {
            

            return View();
        }

        public ActionResult Dangky()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}