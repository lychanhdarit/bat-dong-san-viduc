using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebDEV.Areas.admincp.Models;

namespace WebDEV.Areas.admincp.Controllers
{
    [AuthorizeController]
    public class menusController : Controller
    {
        private DataEntities1 db = new DataEntities1();

        // GET: admincp/menus
        public ActionResult Index()
        {
            var menus = db.menus.Include(m => m.menu_group);
            return View(menus.OrderByDescending(m=>m.id).ToList());
        }

        // GET: admincp/menus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            menu menu = db.menus.Find(id);
            if (menu == null)
            {
                return HttpNotFound();
            }
            return View(menu);
        }

        // GET: admincp/menus/Create
        public ActionResult Create()
        {
            ViewBag.group_menu = new SelectList(db.menu_group, "id", "name");
            ViewBag.parent = new SelectList(db.menus, "id", "name");
            return View();
        }

        // POST: admincp/menus/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,url,active,images,sort,group_menu,style,code,note,parent")] menu menu, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    string path = Path.Combine(Server.MapPath("~/upload/images/menu"), Path.GetFileName(file.FileName));
                    file.SaveAs(path);
                    menu.images = file.FileName;
                }
                db.menus.Add(menu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.group_menu = new SelectList(db.menu_group, "id", "name", menu.group_menu);
            ViewBag.parent = new SelectList(db.menus, "id", "name",menu.parent);
            return View(menu);
        }

        // GET: admincp/menus/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            menu menu = db.menus.Find(id);
            if (menu == null)
            {
                return HttpNotFound();
            }
            ViewBag.group_menu = new SelectList(db.menu_group, "id", "name", menu.group_menu);
            ViewBag.parent = new SelectList(db.menus, "id", "name", menu.parent);
            return View(menu);
        }

        // POST: admincp/menus/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,url,active,images,sort,group_menu,style,code,note,parent")] menu menu, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    string path = Path.Combine(Server.MapPath("~/upload/images/menu"), Path.GetFileName(file.FileName));
                    file.SaveAs(path);
                    menu.images = file.FileName;
                }
                db.Entry(menu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.group_menu = new SelectList(db.menu_group, "id", "name", menu.group_menu);
            ViewBag.parent = new SelectList(db.menus, "id", "name", menu.parent);
            return View(menu);
        }

        // GET: admincp/menus/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            menu menu = db.menus.Find(id);
            if (menu == null)
            {
                return HttpNotFound();
            }
            return View(menu);
        }

        // POST: admincp/menus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            menu menu = db.menus.Find(id);
            db.menus.Remove(menu);
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
