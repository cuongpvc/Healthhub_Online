using Healthhub_Online.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Healthhub_Online.Controllers
{
    public class TrungtamyteController : Controller
    {
        [HttpGet]
        public ActionResult TraCuu()
        {
            if (Session["user"] != null) { 
                var user = (NguoiDung)Session["user"];
                return View((Object)user.DiaChiCuThe);
            }            
                    
            return View();
        }
       

    }


}