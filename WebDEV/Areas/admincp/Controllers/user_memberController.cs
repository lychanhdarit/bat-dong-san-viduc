using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebDEV.Areas.admincp.Models;
using WebDEV.Binary;

namespace WebDEV.Areas.admincp.Controllers
{
    [AuthorizeController]
    public class user_memberController : Controller
    {
        private DataEntities1 db = new DataEntities1();

        // GET: admincp/user_member
        public ActionResult Index()
        {
            var user_member = db.user_member.Include(u => u.user_group);
            return View(user_member.OrderByDescending(m => m.id).ToList());
        }

        // GET: admincp/user_member/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            user_member user_member = db.user_member.Find(id);
            if (user_member == null)
            {
                return HttpNotFound();
            }
            return View(user_member);
        }

        // GET: admincp/user_member/Create
        public ActionResult Create()
        {
            ViewBag.group_user = new SelectList(db.user_group, "id", "name");
            return View();
        }

        // POST: admincp/user_member/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,username,password_user,fullname,email,phone,address,birthday,active,group_user,datecreate")] user_member user_member)
        {
            if (ModelState.IsValid)
            {
                if (db.user_member.FirstOrDefault(m => m.username == user_member.username) == null)
                {
                    if (user_member.password_user == "" || user_member.password_user == null)
                    {
                        user_member.password_user = Common.HashPassword("web@");
                    }
                    else
                    {
                        user_member.password_user = Common.HashPassword(user_member.password_user);
                    }
                    db.user_member.Add(user_member);
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }

            ViewBag.group_user = new SelectList(db.user_group, "id", "name", user_member.group_user);
            return View(user_member);
        }
        public ActionResult ChangePassword()
        {
            //ViewBag.IsAuthenticated = User.Identity.IsAuthenticated;
            return View();
        }
        [HttpPost]
        public ActionResult ChangePassword(ChangePasswordModel changePasswordModel, string returnUrl)
        {
            string username = Common.GetUserName(Common.GetCookie("UserAd"));

            var user = db.user_member.FirstOrDefault(m => m.username == username);
            string message = "";
            if (user != null)
            {
                if (string.IsNullOrEmpty(changePasswordModel.OldPassword) || user.password_user != Common.HashPassword(changePasswordModel.OldPassword))
                {
                    message = "Mật khẩu cũ không đúng!";
                }
                else if (changePasswordModel.NewPassword == "")
                {
                    message = "Nhập mật khẩu mới!";
                }
                else if (changePasswordModel.NewPassword != changePasswordModel.ConfirmPassword)
                {
                    message = "Xác nhận lại mật khẩu!";
                }
                else
                {
                    user.password_user = Common.HashPassword(changePasswordModel.NewPassword);
                    db.Entry(user).State = EntityState.Modified;
                    db.SaveChanges();
                    message = "Cập nhật thành công!";
                    return Redirect("~/login/");
                }
            }
            else
            {
                message = "";
            }
            ViewBag.Message = message;
            ModelState.AddModelError("", message);
            return View();
        }
        // GET: admincp/user_member/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            user_member user_member = db.user_member.Find(id);
            if (user_member == null)
            {
                return HttpNotFound();
            }
            ViewBag.group_user = new SelectList(db.user_group, "id", "name", user_member.group_user);
            return View(user_member);
        }

        // POST: admincp/user_member/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,username,password_user,fullname,email,phone,address,birthday,active,group_user,datecreate")] user_member user_member)
        {
            if (ModelState.IsValid)
            {
                var item = db.user_member.FirstOrDefault(m=>m.username == user_member.username);
                if(item!=null)
                {
                    string pwOld = item.password_user;
                    item = user_member;
                    if(item.password_user =="")
                    {
                        item.password_user = pwOld;
                    }
                    else
                    {
                        item.password_user = Common.HashPassword(item.password_user);
                    }
                    db.Entry(user_member).State = EntityState.Modified;
                    db.SaveChanges();
                }
                
                return RedirectToAction("Index");
            }
            ViewBag.group_user = new SelectList(db.user_group, "id", "name", user_member.group_user);
            return View(user_member);
        }

        // GET: admincp/user_member/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            user_member user_member = db.user_member.Find(id);
            if (user_member == null)
            {
                return HttpNotFound();
            }
            return View(user_member);
        }

        // POST: admincp/user_member/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            user_member user_member = db.user_member.Find(id);
            db.user_member.Remove(user_member);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: admincp/user_member/Delete/5
        public ActionResult ResetPass(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            user_member user_member = db.user_member.Find(id);
            if (user_member == null)
            {
                return HttpNotFound();
            }
            return View(user_member);
        }

        // POST: admincp/user_member/Delete/5
        [HttpPost, ActionName("ResetPass")]
        [ValidateAntiForgeryToken]
        public ActionResult ResetPassConfirmed(int id)
        {
            user_member user_member = db.user_member.Find(id);
            user_member.password_user = Common.HashPassword("web@");
            db.Entry(user_member).State = EntityState.Modified;
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
