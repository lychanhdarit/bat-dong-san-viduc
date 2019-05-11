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
    [AuthorizeController]
    public class productsController : Controller
    {
        private DataEntities1 db = new DataEntities1();

        // GET: admincp/products
        public ActionResult Index()
        {
            var products = db.products.Include(p => p.product_category);
            return View(products.OrderByDescending(m=>m.id).ToList());
        }

        // GET: admincp/products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            product product = db.products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: admincp/products/Create
        public ActionResult Create()
        {
            ViewBag.parent = new SelectList(db.product_category, "id", "name");
            return View();
        }

        // POST: admincp/products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,desciption,content1,content2,content3,content4,content5,meta_title,meta_description,meta_keywords,images,datecreate,dateedit,usercreate,dateend,useredit,actived,deleted,parent,tags,views,rating,code,url,price,quantity")] product product, HttpPostedFileBase file, HttpPostedFileBase file2)
        {
            if (ModelState.IsValid)
            {
                string url = "";
                if (product.url != null && product.url != "")
                {
                    url = Common.convertStringLinks(product.url);
                }

                if (url == "")
                {
                    url = Common.convertStringLinks(product.name);
                }
                product.url = url;
                if (file != null)
                {
                    string path = Path.Combine(Server.MapPath("~/upload/images/products"), Path.GetFileName(file.FileName));
                    file.SaveAs(path);
                    product.images = file.FileName;
                }
                if (file2 != null)
                {
                    string path = Path.Combine(Server.MapPath("~/upload/images/products"), Path.GetFileName(file2.FileName));
                    file2.SaveAs(path);
                    product.content5 = file2.FileName;
                }
                product.dateend = DateTime.Now.ToShortDateString();
                product.datecreate = DateTime.Now.ToShortDateString();
                db.products.Add(product);
                db.SaveChanges();
                ServicesData.UpdateRouter("product", "detail", product.id.ToString(), url);
                return RedirectToAction("Index");
            }

            ViewBag.parent = new SelectList(db.product_category, "id", "name", product.parent);
            return View(product);
        }

        // GET: admincp/products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            product product = db.products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.parent = new SelectList(db.product_category, "id", "name", product.parent);
            return View(product);
        }

        // POST: admincp/products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,desciption,content1,content2,content3,content4,content5,meta_title,meta_description,meta_keywords,images,datecreate,dateedit,usercreate,dateend,useredit,actived,deleted,parent,tags,views,rating,code,url,price,quantity")] product product, HttpPostedFileBase file, HttpPostedFileBase file2)
        {
            
            if (ModelState.IsValid)
            {
                string url = "";
                if (product.url != null && product.url != "")
                {
                    url = Common.convertStringLinks(product.url);
                }
                if (url == "")
                {
                    url = Common.convertStringLinks(product.name);
                }
                product item = db.products.FirstOrDefault(m => m.id == product.id);
                if (item != null)
                {
                    item.url = url;
                    item.name = product.name;
                    item.desciption = product.desciption;
                    item.content1 = product.content1;
                    item.content2 = product.content2;
                    item.content3 = product.content3;
                    item.content4 = product.content4;
                    item.content5 = product.content5;
                    item.meta_title = product.meta_title;
                    item.meta_description = product.meta_description;
                    item.meta_keywords = product.meta_keywords;
                    item.parent = product.parent;
                    item.actived = product.actived;
                    item.price = product.price;
                    if (file != null)
                    {
                        string path = Path.Combine(Server.MapPath("~/upload/images/products"), Path.GetFileName(file.FileName));
                        file.SaveAs(path);
                        item.images = file.FileName;
                    }
                    if (file2 != null)
                    {
                        string path = Path.Combine(Server.MapPath("~/upload/images/products"), Path.GetFileName(file2.FileName));
                        file2.SaveAs(path);
                        item.content5 = file2.FileName;
                    }
                    item.dateedit = DateTime.Now.ToShortDateString();
                    db.Entry(item).State = EntityState.Modified;
                    db.SaveChanges();
                    ServicesData.UpdateRouter("product", "detail", product.id.ToString(), url);
                }
                return RedirectToAction("Index");
            }
            ViewBag.parent = new SelectList(db.product_category, "id", "name", product.parent);
            return View(product);
        }

        // GET: admincp/products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            product product = db.products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: admincp/products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            product product = db.products.Find(id);
            db.products.Remove(product);
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
