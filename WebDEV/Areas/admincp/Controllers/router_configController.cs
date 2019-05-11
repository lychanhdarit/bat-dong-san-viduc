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
    public class router_configController : Controller
    {
        private DataEntities1 db = new DataEntities1();

        // GET: admincp/router_config
        public ActionResult Index()
        {
            return View(db.router_config.OrderByDescending(m => m.id).ToList());
        }

        // GET: admincp/router_config/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            router_config router_config = db.router_config.Find(id);
            if (router_config == null)
            {
                return HttpNotFound();
            }
            return View(router_config);
        }

        // GET: admincp/router_config/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admincp/router_config/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,url,controller,action,itemId,actived")] router_config router_config)
        {
            if (ModelState.IsValid)
            {
                db.router_config.Add(router_config);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(router_config);
        }

        // GET: admincp/router_config/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            router_config router_config = db.router_config.Find(id);
            if (router_config == null)
            {
                return HttpNotFound();
            }
            return View(router_config);
        }

        // POST: admincp/router_config/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,url,controller,action,itemId,actived")] router_config router_config)
        {
            if (ModelState.IsValid)
            {
                db.Entry(router_config).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(router_config);
        }

        // GET: admincp/router_config/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            router_config router_config = db.router_config.Find(id);
            if (router_config == null)
            {
                return HttpNotFound();
            }
            return View(router_config);
        }

        // POST: admincp/router_config/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            router_config router_config = db.router_config.Find(id);
            db.router_config.Remove(router_config);
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
