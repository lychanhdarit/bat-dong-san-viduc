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
    public class category_product_bannerController : Controller
    {
        private DataEntities1 db = new DataEntities1();

        // GET: admincp/category_product_banner
        public ActionResult Index()
        {
            var category_product_banner = db.category_product_banner.Include(c => c.picture_group).Include(c => c.product_category);
            return View(category_product_banner.ToList());
        }

        // GET: admincp/category_product_banner/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            category_product_banner category_product_banner = db.category_product_banner.Find(id);
            if (category_product_banner == null)
            {
                return HttpNotFound();
            }
            return View(category_product_banner);
        }

        // GET: admincp/category_product_banner/Create
        public ActionResult Create()
        {
            ViewBag.idGroupBanner = new SelectList(db.picture_group, "id", "name");
            ViewBag.idCategory = new SelectList(db.product_category, "id", "name");
            return View();
        }

        // POST: admincp/category_product_banner/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,idCategory,idGroupBanner,Note")] category_product_banner category_product_banner)
        {
            if (ModelState.IsValid)
            {
                db.category_product_banner.Add(category_product_banner);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idGroupBanner = new SelectList(db.picture_group, "id", "name", category_product_banner.idGroupBanner);
            ViewBag.idCategory = new SelectList(db.product_category, "id", "name", category_product_banner.idCategory);
            return View(category_product_banner);
        }

        // GET: admincp/category_product_banner/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            category_product_banner category_product_banner = db.category_product_banner.Find(id);
            if (category_product_banner == null)
            {
                return HttpNotFound();
            }
            ViewBag.idGroupBanner = new SelectList(db.picture_group, "id", "name", category_product_banner.idGroupBanner);
            ViewBag.idCategory = new SelectList(db.product_category, "id", "name", category_product_banner.idCategory);
            return View(category_product_banner);
        }

        // POST: admincp/category_product_banner/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,idCategory,idGroupBanner,Note")] category_product_banner category_product_banner)
        {
            if (ModelState.IsValid)
            {
                db.Entry(category_product_banner).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idGroupBanner = new SelectList(db.picture_group, "id", "name", category_product_banner.idGroupBanner);
            ViewBag.idCategory = new SelectList(db.product_category, "id", "name", category_product_banner.idCategory);
            return View(category_product_banner);
        }

        // GET: admincp/category_product_banner/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            category_product_banner category_product_banner = db.category_product_banner.Find(id);
            if (category_product_banner == null)
            {
                return HttpNotFound();
            }
            return View(category_product_banner);
        }

        // POST: admincp/category_product_banner/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            category_product_banner category_product_banner = db.category_product_banner.Find(id);
            db.category_product_banner.Remove(category_product_banner);
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
