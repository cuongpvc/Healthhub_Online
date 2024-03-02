using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using Healthhub_Online.Models;

namespace Healthhub_Online.Controllers
{
 

    public class HomeController : Controller
    {
        private ModelWeb db = new ModelWeb();
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
            // Truy vấn danh sách giới tính và danh sách tỉnh từ cơ sở dữ liệu
            var gioiTinhs = db.GioiTinhs.ToList();
            var tinhThanhs = db.TinhThanhs.ToList();

            // Truyền danh sách giới tính và danh sách tỉnh đến view
            ViewBag.GioiTinhs = new SelectList(gioiTinhs, "IDGioiTinh", "GioiTinh1");
            ViewBag.TinhThanhs = new SelectList(tinhThanhs, "IDTinh", "TenTinh");

            return View();         
        }
        public ActionResult VerifyOTP()
        {
            // Display a view to verify OTP
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Dangky([Bind(Include = "IDNguoiDung,HoTen,Email,DienThoai,TaiKhoan,MatKhau,IDGioiTinh,IDTinh")] NguoiDung nguoiDung, string ConfirmMatKhau)
        {
            if (ModelState.IsValid)
            {
                // Kiểm tra xem mật khẩu và mật khẩu xác nhận có khớp nhau không
                if (nguoiDung.MatKhau != ConfirmMatKhau)
                {
                    ModelState.AddModelError("ConfirmMatKhau", "Mật khẩu xác nhận không khớp.");

                    var gioiTinhs = db.GioiTinhs.ToList();
                    var tinhThanhs = db.TinhThanhs.ToList();
                    ViewBag.GioiTinhs = new SelectList(gioiTinhs, "IDGioiTinh", "GioiTinh1");
                    ViewBag.TinhThanhs = new SelectList(tinhThanhs, "IDTinh", "TenTinh");
                    return View(nguoiDung);
                }

                if (db.NguoiDungs.Any(u => u.TaiKhoan == nguoiDung.TaiKhoan.ToLower().Trim()))
                {
                    ModelState.AddModelError("TaiKhoan", "Tên đăng nhập đã tồn tại.");
                    var gioiTinhs = db.GioiTinhs.ToList();
                    var tinhThanhs = db.TinhThanhs.ToList();

                    // Truyền danh sách giới tính và danh sách tỉnh đến view
                    ViewBag.GioiTinhs = new SelectList(gioiTinhs, "IDGioiTinh", "GioiTinh1");
                    ViewBag.TinhThanhs = new SelectList(tinhThanhs, "IDTinh", "TenTinh");
                    return View(nguoiDung);
                }
                Random random = new Random();
                int otp = random.Next(100000, 999999);
                if (SendOTP(nguoiDung.Email, otp))
                {
                    TempData["OTP"] = otp;
                    TempData["NguoiDung"] = nguoiDung;
                    return RedirectToAction("VerifyOTP", "Home");
                }



            }

            // Nếu model không hợp lệ, trả về view với model
            return View(nguoiDung);
        }

        [HttpPost]
        public ActionResult VerifyOTP(int otp)
        {
            int storedOTP = Convert.ToInt32(TempData["OTP"]);
            if (otp == storedOTP)
            {
                ViewBag.Message = "OTP xác thực thành công";
                NguoiDung nguoiDung = TempData["NguoiDung"] as NguoiDung;
                db.NguoiDungs.Add(nguoiDung);
                db.SaveChanges();
                return RedirectToAction("Dangnhap", "Home");
            }
            else
            {
                ModelState.AddModelError("otp", "Mã OTP không đúng vui lòng thử lại");
                return RedirectToAction("VerifyOTP", "Home");
            }

            return View();
        }

        private bool SendOTP(string email, int otp)
        {
            try
            {
                // Configure SMTP client
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587); // Update with your SMTP server details
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Credentials = new NetworkCredential("haizaki505@gmail.com", "dnwhqnezsnhqpgmg"); // Update with your email credentials
                smtpClient.EnableSsl = true;

                // Compose email message
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("haizaki505@gmail.com"); // Update with your email address
                mailMessage.To.Add(email);
                mailMessage.Subject = "Your OTP for Registration";
                mailMessage.Body = "Your OTP is: " + otp.ToString();

                // Send email
                smtpClient.Send(mailMessage);
                return true;
            }
            catch (Exception ex)
            {
                // Failed to send email
                Console.WriteLine(ex.Message);
                return false;
            }
        }
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
                if (quanTri.VaiTro == 1)
                {
                    Session["admin"] = quanTri;
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    Session["userBS"] = quanTri;
                    return RedirectToAction("Index", "Home");

                }
               
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