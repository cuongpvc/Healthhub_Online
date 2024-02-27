using Healthhub_Online.Controllers;
using Healthhub_Online.Models;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Net;

namespace HealthhubOnline.Tests.Controllers
{
    [TestClass]
    public class NguoidungControllerTest
    {
        private Mock<modelWeb> mockContext;
        private Mock<DbSet<NguoiDung>> mockSet;
        private NguoidungController controller;

        [TestInitialize]
        public void Initialize()
        {
            mockSet = new Mock<DbSet<NguoiDung>>();
            mockContext = new Mock<modelWeb>();
            mockContext.Setup(m => m.NguoiDungs).Returns(mockSet.Object);

            controller = new NguoidungController(mockContext.Object);
        }


        [TestMethod]
        public void Details_WithNullId_ReturnsBadRequest()
        {
            // Arrange
            int? id = null;

            // Act
            var result = controller.Details(id);

            // Assert
            Assert.IsInstanceOfType(result, typeof(HttpStatusCodeResult));
            var httpResult = result as HttpStatusCodeResult;
            Assert.AreEqual((int)HttpStatusCode.BadRequest, httpResult.StatusCode);
        }

        [TestMethod]
        public void Edit_Get_WithValidId_ReturnsCorrectView()
        {
            var validId = 1;
            GioiTinh testGender1 = new GioiTinh { IDGioiTinh = 3, GioiTinh1 = "bede" };
            TinhThanh testCity1 = new TinhThanh { IDTinh = 1, TenTinh = "hihi" };

            var expectedNguoiDung = new NguoiDung
            {
                IDGioiTinh = 1,
                HoTen = "huy",
                GioiTinh = testGender1,
                TinhThanh = testCity1,
                IDTinh = testCity1.IDTinh,
                BenhAns = null,
                DiaChiCuThe = "hehe",
                DienThoai = "123123123",
                Email = "hihihaha@gmail.com",
                HoiDaps = null,
                IDNguoiDung = 1,
                LichKhams = null,
                MatKhau = "123123",
                NhomMau = "A",
                SoCMND = 123123123,
                TaiKhoan = "hhhiyu",
                ThongTinKhac = null
            };
            mockSet.Setup(m => m.Find(validId)).Returns(expectedNguoiDung);

            // Act
            var result = controller.Edit(validId) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
            var model = result.Model as NguoiDung;
            Assert.IsNotNull(model);
            Assert.AreEqual(expectedNguoiDung.IDNguoiDung, model.IDNguoiDung);
        }
    }
}