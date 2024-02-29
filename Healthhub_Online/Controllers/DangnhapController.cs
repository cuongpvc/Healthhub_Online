using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Healthhub_Online.Models;

namespace Healthhub_Online.Controllers
{
    public class DangnhapController : Controller
    {
        private ModelWeb db = new ModelWeb();

        // GET: Account/Login
        public ActionResult Dangnhap()
        {
            return View();
        }

        public ActionResult Dangxuat()
        {

            // Xóa session người dùng khi đăng xuất
            Session["user"] = null;
            Session["userBS"] = null;

            // Chuyển hướng về trang đăng nhập
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Dangnhap(string username, string password)
        {
            var nguoiDung = db.NguoiDungs.FirstOrDefault(u => u.TaiKhoan == username.Trim() && u.MatKhau == password);
            var quanTri = db.QuanTris.FirstOrDefault(u => u.TaiKhoan == username.Trim() && u.MatKhau == password);
            if (nguoiDung != null)
            {

                Session["user"] = nguoiDung;
                return RedirectToAction("Index", "Home");
            }
            else if (quanTri != null)
            {
                Session["userBS"] = quanTri;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                // Authentication failed, return back to login view with error message
                ModelState.AddModelError("dangnhasai", "Tên đăng nhập hoặc mật khẩu không đúng !.");
                return View();
            }
        }
    }
}