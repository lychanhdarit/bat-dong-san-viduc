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
using WebDEV.Binary;

namespace WebDEV.Areas.admincp.Controllers
{
    public class product_pictureController : Controller
    {
        private DataEntities1 db = new DataEntities1();

        // GET: admincp/product_picture
        public ActionResult Index(int? idProduct)
        {
            if(idProduct!=null)
            {
                ViewBag.Id = idProduct;
                var product = db.products.FirstOrDefault(m=>m.id == idProduct);
                if(product!=null)
                {
                    ViewBag.Name = product.name;
                }
                return View(db.product_picture.Where(m=>m.id_product== idProduct).ToList());
            }
            return View(db.product_picture.ToList());
        }

        // GET: admincp/product_picture/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            product_picture product_picture = db.product_picture.Find(id);
            if (product_picture == null)
            {
                return HttpNotFound();
            }
            return View(product_picture);
        }

        // GET: admincp/product_picture/Create
        public ActionResult Create(int? idProduct)
        {
            ViewBag.Id = idProduct;
            var product = db.products.FirstOrDefault(m => m.id == idProduct);
            if (product != null)
            {
                ViewBag.Name = product.name;
            }
            return View();
        }

        // POST: admincp/product_picture/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,id_product,filename,title,active,lang")] product_picture product_picture,string IdProduct, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                product_picture.id_product = Common.SQLToInt(IdProduct);
                if (file != null)
                {
                    string path = Path.Combine(Server.MapPath("~/upload/images/products"), Path.GetFileName(file.FileName));
                    file.SaveAs(path);
                    product_picture.filename = file.FileName;
                }
                db.product_picture.Add(product_picture);
                db.SaveChanges();
                return Redirect("~/admincp/product_picture/?idProduct="+product_picture.id_product);
            }

            return View(product_picture);
        }

        // GET: admincp/product_picture/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            product_picture product_picture = db.product_picture.Find(id);
            if (product_picture == null)
            {
                return HttpNotFound();
            }
            return View(product_picture);
        }

        // POST: admincp/product_picture/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,id_product,filename,title,active,lang")] product_picture product_picture,HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    string path = Path.Combine(Server.MapPath("~/upload/images/products"), Path.GetFileName(file.FileName));
                    file.SaveAs(path);
                    product_picture.filename = file.FileName;
                }
                db.Entry(product_picture).State = EntityState.Modified;
                db.SaveChanges();
                return Redirect("~/admincp/product_picture/?idProduct=" + product_picture.id_product);
            }
            return View(product_picture);
        }

        // GET: admincp/product_picture/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            product_picture product_picture = db.product_picture.Find(id);
            if (product_picture == null)
            {
                return HttpNotFound();
            }
            return View(product_picture);
        }

        // POST: admincp/product_picture/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            product_picture product_picture = db.product_picture.Find(id);
            db.product_picture.Remove(product_picture);
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
