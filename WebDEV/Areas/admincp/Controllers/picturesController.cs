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
    public class picturesController : Controller
    {
        private DataEntities1 db = new DataEntities1();

        // GET: admincp/pictures
        public ActionResult Index()
        {
            var pictures = db.pictures.Include(p => p.picture_group);
            return View(pictures.OrderByDescending(m => m.id).ToList());
        }

        // GET: admincp/pictures/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            picture picture = db.pictures.Find(id);
            if (picture == null)
            {
                return HttpNotFound();
            }
            return View(picture);
        }

        // GET: admincp/pictures/Create
        public ActionResult Create()
        {
            ViewBag.group_picture = new SelectList(db.picture_group, "id", "name");
            return View();
        }

        // POST: admincp/pictures/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,filename,group_picture,active,note")] picture picture, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    string path = Path.Combine(Server.MapPath("~/upload/images/pictures"), Path.GetFileName(file.FileName));
                    file.SaveAs(path);
                    picture.filename = file.FileName;
                }
                db.pictures.Add(picture);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.group_picture = new SelectList(db.picture_group, "id", "name", picture.group_picture);
            return View(picture);
        }

        // GET: admincp/pictures/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            picture picture = db.pictures.Find(id);
            if (picture == null)
            {
                return HttpNotFound();
            }
            ViewBag.group_picture = new SelectList(db.picture_group, "id", "name", picture.group_picture);
            return View(picture);
        }

        // POST: admincp/pictures/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,filename,group_picture,active,note")] picture picture, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    string path = Path.Combine(Server.MapPath("~/upload/images/pictures"), Path.GetFileName(file.FileName));
                    file.SaveAs(path);
                    picture.filename = file.FileName;
                }
                db.Entry(picture).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.group_picture = new SelectList(db.picture_group, "id", "name", picture.group_picture);
            return View(picture);
        }

        // GET: admincp/pictures/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            picture picture = db.pictures.Find(id);
            if (picture == null)
            {
                return HttpNotFound();
            }
            return View(picture);
        }

        // POST: admincp/pictures/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            picture picture = db.pictures.Find(id);
            db.pictures.Remove(picture);
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
