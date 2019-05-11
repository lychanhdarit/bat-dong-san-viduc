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
    public class picture_groupController : Controller
    {
        private DataEntities1 db = new DataEntities1();

        // GET: admincp/picture_group
        public ActionResult Index()
        {
            return View(db.picture_group.ToList());
        }

        // GET: admincp/picture_group/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            picture_group picture_group = db.picture_group.Find(id);
            if (picture_group == null)
            {
                return HttpNotFound();
            }
            return View(picture_group);
        }

        // GET: admincp/picture_group/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admincp/picture_group/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,active,note")] picture_group picture_group)
        {
            if (ModelState.IsValid)
            {
                db.picture_group.Add(picture_group);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(picture_group);
        }

        // GET: admincp/picture_group/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            picture_group picture_group = db.picture_group.Find(id);
            if (picture_group == null)
            {
                return HttpNotFound();
            }
            return View(picture_group);
        }

        // POST: admincp/picture_group/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,active,note")] picture_group picture_group)
        {
            if (ModelState.IsValid)
            {
                db.Entry(picture_group).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(picture_group);
        }

        // GET: admincp/picture_group/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            picture_group picture_group = db.picture_group.Find(id);
            if (picture_group == null)
            {
                return HttpNotFound();
            }
            return View(picture_group);
        }

        // POST: admincp/picture_group/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            picture_group picture_group = db.picture_group.Find(id);
            db.picture_group.Remove(picture_group);
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
