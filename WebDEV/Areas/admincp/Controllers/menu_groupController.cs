using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebDEV.Areas.admincp.Models;

namespace WebDEV.Areas.admincp.Controllers
{
    [AuthorizeController]
    public class menu_groupController : Controller
    {
        private DataEntities1 db = new DataEntities1();

        // GET: admincp/menu_group
        public ActionResult Index()
        {
            return View(db.menu_group.ToList());
        }

        // GET: admincp/menu_group/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            menu_group menu_group = db.menu_group.Find(id);
            if (menu_group == null)
            {
                return HttpNotFound();
            }
            return View(menu_group);
        }

        // GET: admincp/menu_group/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admincp/menu_group/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,note,active,images")] menu_group menu_group)
        {
            if (ModelState.IsValid)
            {
                db.menu_group.Add(menu_group);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(menu_group);
        }

        // GET: admincp/menu_group/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            menu_group menu_group = db.menu_group.Find(id);
            if (menu_group == null)
            {
                return HttpNotFound();
            }
            return View(menu_group);
        }

        // POST: admincp/menu_group/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,note,active,images")] menu_group menu_group)
        {
            if (ModelState.IsValid)
            {
                db.Entry(menu_group).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(menu_group);
        }

        // GET: admincp/menu_group/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            menu_group menu_group = db.menu_group.Find(id);
            if (menu_group == null)
            {
                return HttpNotFound();
            }
            return View(menu_group);
        }

        // POST: admincp/menu_group/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            menu_group menu_group = db.menu_group.Find(id);
            db.menu_group.Remove(menu_group);
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
