using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDEV.Areas.admincp.Models;
using WebDEV.Binary;

namespace WebDEV.Areas.admincp.Controllers
{
    public class LoginController : Controller
    {
        // GET: admincp/Login
        private DataEntities1 db = new DataEntities1();
        // GET: Adminstrator/Login
        public ActionResult Index()
        {

            ViewBag.User = null;
            CookieHelper.RemoveCookie();
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        public ActionResult Index(LogOnModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                string strError = string.Empty;
                string pass = Common.HashPassword(model.Password);
                user_member accountLogin = db.user_member.FirstOrDefault(m => m.username == model.UserName && m.password_user == pass);
                if (accountLogin != null)
                {
                    string hash = Common.HashPassword(model.Password);

                    //if (accountLogin.level == 1)
                    //{
                    string username = model.UserName + "|" + accountLogin.id.ToString();
                    CookieHelper myCokie = new CookieHelper();
                    CookieHelper.SetCookie(username, 30);
                    //HistoryCall hc = new HistoryCall();
                    //hc.LogAdd(model.UserName, " đã đăng nhập!", DateTime.Now, 1);


                    return RedirectToAction("Index", "Home");

                    //}
                    //else
                    //{
                    //    ModelState.AddModelError("", "Tài khoản bị khóa");
                    //    strError = "Tai khoan bi khoa";
                    //}

                }
                //if (model.UserName == "admin" && model.Password == "123")
                //{
                //    CookieHelper.SetCookie("admin|1", 30);
                //    return RedirectToAction("Index", "Home");
                //}
                else
                {
                    ModelState.AddModelError("", "Đăng nhập thất bại!");
                    strError = "Đăng nhập thất bại!";
                }
                ViewBag.Error = strError;
            }
            // If we got this far, something failed, redisplay form
            return View(model);
        }
    }
}