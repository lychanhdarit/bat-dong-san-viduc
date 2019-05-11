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
    public class config_siteController : Controller
    {
        private DataEntities1 db = new DataEntities1();

        // GET: admincp/config_site
        public ActionResult Index()
        {
            return View(db.config_site.ToList());
        }

        // GET: admincp/config_site/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            config_site config_site = db.config_site.Find(id);
            if (config_site == null)
            {
                return HttpNotFound();
            }
            return View(config_site);
        }

        // GET: admincp/config_site/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admincp/config_site/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,map_content,contact_footer,facebook_code,content1,content2,content3")] config_site config_site)
        {
            if (ModelState.IsValid)
            {
                db.config_site.Add(config_site);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(config_site);
        }

        // GET: admincp/config_site/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            config_site config_site = db.config_site.Find(id);
            if (config_site == null)
            {
                return HttpNotFound();
            }
            return View(config_site);
        }

        // POST: admincp/config_site/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,map_content,contact_footer,facebook_code,content1,content2,content3")] config_site config_site)
        {
            if (ModelState.IsValid)
            {
                db.Entry(config_site).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(config_site);
        }

        // GET: admincp/config_site/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            config_site config_site = db.config_site.Find(id);
            if (config_site == null)
            {
                return HttpNotFound();
            }
            return View(config_site);
        }

        // POST: admincp/config_site/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            config_site config_site = db.config_site.Find(id);
            db.config_site.Remove(config_site);
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
