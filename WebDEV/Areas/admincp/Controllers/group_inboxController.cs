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
    public class group_inboxController : Controller
    {
        private DataEntities1 db = new DataEntities1();

        // GET: admincp/group_inbox
        public ActionResult Index()
        {
            return View(db.group_inbox.ToList());
        }

        // GET: admincp/group_inbox/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            group_inbox group_inbox = db.group_inbox.Find(id);
            if (group_inbox == null)
            {
                return HttpNotFound();
            }
            return View(group_inbox);
        }

        // GET: admincp/group_inbox/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admincp/group_inbox/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,active")] group_inbox group_inbox)
        {
            if (ModelState.IsValid)
            {
                db.group_inbox.Add(group_inbox);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(group_inbox);
        }

        // GET: admincp/group_inbox/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            group_inbox group_inbox = db.group_inbox.Find(id);
            if (group_inbox == null)
            {
                return HttpNotFound();
            }
            return View(group_inbox);
        }

        // POST: admincp/group_inbox/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,active")] group_inbox group_inbox)
        {
            if (ModelState.IsValid)
            {
                db.Entry(group_inbox).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(group_inbox);
        }

        // GET: admincp/group_inbox/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            group_inbox group_inbox = db.group_inbox.Find(id);
            if (group_inbox == null)
            {
                return HttpNotFound();
            }
            return View(group_inbox);
        }

        // POST: admincp/group_inbox/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            group_inbox group_inbox = db.group_inbox.Find(id);
            db.group_inbox.Remove(group_inbox);
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
