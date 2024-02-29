using System;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web.Mvc;
using Healthhub_Online.Models;

namespace Healthhub_Online.Controllers
{
    public class DangkyController : Controller
    {
        private ModelWeb db = new ModelWeb();

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
                    return RedirectToAction("VerifyOTP", "DangKy");
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
                return RedirectToAction("Dangnhap", "Dangnhap");
            }
            else
            {
                ModelState.AddModelError("otp", "Mã OTP không đúng vui lòng thử lại");
                return RedirectToAction("VerifyOTP", "DangKy");
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
    }

}

