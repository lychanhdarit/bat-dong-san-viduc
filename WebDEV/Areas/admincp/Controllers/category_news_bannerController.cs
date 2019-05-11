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
    public class category_news_bannerController : Controller
    {
        private DataEntities1 db = new DataEntities1();

        // GET: admincp/category_news_banner
        public ActionResult Index()
        {
            var category_banner = db.category_banner.Include(c => c.news_category).Include(c => c.picture_group);
            return View(category_banner.ToList());
        }

        // GET: admincp/category_news_banner/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            category_banner category_banner = db.category_banner.Find(id);
            if (category_banner == null)
            {
                return HttpNotFound();
            }
            return View(category_banner);
        }

        // GET: admincp/category_news_banner/Create
        public ActionResult Create()
        {
            ViewBag.idCategory = new SelectList(db.news_category, "id", "name");
            ViewBag.idGroupBanner = new SelectList(db.picture_group, "id", "name");
            return View();
        }

        // POST: admincp/category_news_banner/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,idCategory,idGroupBanner,Note")] category_banner category_banner)
        {
            if (ModelState.IsValid)
            {
                db.category_banner.Add(category_banner);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idCategory = new SelectList(db.news_category, "id", "name", category_banner.idCategory);
            ViewBag.idGroupBanner = new SelectList(db.picture_group, "id", "name", category_banner.idGroupBanner);
            return View(category_banner);
        }

        // GET: admincp/category_news_banner/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            category_banner category_banner = db.category_banner.Find(id);
            if (category_banner == null)
            {
                return HttpNotFound();
            }
            ViewBag.idCategory = new SelectList(db.news_category, "id", "name", category_banner.idCategory);
            ViewBag.idGroupBanner = new SelectList(db.picture_group, "id", "name", category_banner.idGroupBanner);
            return View(category_banner);
        }

        // POST: admincp/category_news_banner/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,idCategory,idGroupBanner,Note")] category_banner category_banner)
        {
            if (ModelState.IsValid)
            {
                db.Entry(category_banner).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idCategory = new SelectList(db.news_category, "id", "name", category_banner.idCategory);
            ViewBag.idGroupBanner = new SelectList(db.picture_group, "id", "name", category_banner.idGroupBanner);
            return View(category_banner);
        }

        // GET: admincp/category_news_banner/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            category_banner category_banner = db.category_banner.Find(id);
            if (category_banner == null)
            {
                return HttpNotFound();
            }
            return View(category_banner);
        }

        // POST: admincp/category_news_banner/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            category_banner category_banner = db.category_banner.Find(id);
            db.category_banner.Remove(category_banner);
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
