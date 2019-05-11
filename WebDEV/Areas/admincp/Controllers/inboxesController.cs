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
    public class inboxesController : Controller
    {
        private DataEntities1 db = new DataEntities1();

        // GET: admincp/inboxes
        public ActionResult Index()
        {
            var inboxes = db.inboxes.Include(i => i.group_inbox);
            return View(inboxes.OrderByDescending(m=>m.id).ToList());
        }

        // GET: admincp/inboxes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inbox inbox = db.inboxes.Find(id);
            if (inbox == null)
            {
                return HttpNotFound();
            }
            return View(inbox);
        }

        // GET: admincp/inboxes/Create
        public ActionResult Create()
        {
            ViewBag.groupid = new SelectList(db.group_inbox, "id", "name");
            return View();
        }

        // POST: admincp/inboxes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,email,phone,message,active,groupid,subject,address,note")] inbox inbox)
        {
            if (ModelState.IsValid)
            {
                db.inboxes.Add(inbox);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.groupid = new SelectList(db.group_inbox, "id", "name", inbox.groupid);
            return View(inbox);
        }

        // GET: admincp/inboxes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inbox inbox = db.inboxes.Find(id);
            if (inbox == null)
            {
                return HttpNotFound();
            }
            ViewBag.groupid = new SelectList(db.group_inbox, "id", "name", inbox.groupid);
            return View(inbox);
        }

        // POST: admincp/inboxes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,email,phone,message,active,groupid,subject,address,note")] inbox inbox)
        {
            if (ModelState.IsValid)
            {
                db.Entry(inbox).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.groupid = new SelectList(db.group_inbox, "id", "name", inbox.groupid);
            return View(inbox);
        }

        // GET: admincp/inboxes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inbox inbox = db.inboxes.Find(id);
            if (inbox == null)
            {
                return HttpNotFound();
            }
            return View(inbox);
        }

        // POST: admincp/inboxes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            inbox inbox = db.inboxes.Find(id);
            db.inboxes.Remove(inbox);
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
