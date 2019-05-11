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
    public class product_categoryController : Controller
    {
        private DataEntities1 db = new DataEntities1();

        // GET: admincp/product_category
        public ActionResult Index()
        {
            return View(db.product_category.ToList());
        }

        // GET: admincp/product_category/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            product_category product_category = db.product_category.Find(id);
            if (product_category == null)
            {
                return HttpNotFound();
            }
            return View(product_category);
        }

        // GET: admincp/product_category/Create
        public ActionResult Create()
        {
            ViewBag.parent = new SelectList(db.product_category, "id", "name");
            return View();
        }

        // POST: admincp/product_category/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,desciption,content1,content2,content3,content4,content5,meta_title,meta_description,meta_keywords,images,datecreate,dateedit,usercreate,useredit,actived,deleted,parent,tags,views,rating,code,url,price,quantity")] product_category product_category, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                string url = "";
                if (product_category.url != null && product_category.url != "")
                {
                    url = Common.convertStringLinks(product_category.url);
                }

                if (url == "")
                {
                    url = Common.convertStringLinks(product_category.name);
                }
                product_category.url = url;
                if (file != null)
                {
                    string path = Path.Combine(Server.MapPath("~/upload/images/products"), Path.GetFileName(file.FileName));
                    file.SaveAs(path);
                    product_category.images = file.FileName;
                }
                db.product_category.Add(product_category);
                db.SaveChanges();
                ServicesData.UpdateRouter("product", "index", product_category.id.ToString(), url);
                return RedirectToAction("Index");
            }
            ViewBag.parent = new SelectList(db.product_category, "id", "name", product_category.parent);
            return View(product_category);
        }

        // GET: admincp/product_category/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            product_category product_category = db.product_category.Find(id);
            if (product_category == null)
            {
                return HttpNotFound();
            }
            ViewBag.parent = new SelectList(db.product_category, "id", "name", product_category.parent);
            return View(product_category);
        }

        // POST: admincp/product_category/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost,ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,desciption,content1,content2,content3,content4,content5,meta_title,meta_description,meta_keywords,images,datecreate,dateedit,usercreate,useredit,actived,deleted,parent,tags,views,rating,code,url,price,quantity")] product_category product_category, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                string url = "";
                if (product_category.url != null && product_category.url != "")
                {
                    url = Common.convertStringLinks(product_category.url);
                }
                if (url == "")
                {
                    url = Common.convertStringLinks(product_category.name);
                }
                product_category item = db.product_category.AsNoTracking().Single(m => m.id == product_category.id);
                if (item != null)
                {
                    item.url = url;
                    item.name = product_category.name;
                    item.desciption = product_category.desciption;
                    item.content1 = product_category.content1;
                    item.meta_title = product_category.meta_title;
                    item.meta_description = product_category.meta_description;
                    item.meta_keywords = product_category.meta_keywords;
                    item.parent = product_category.parent;
                    item.actived = product_category.actived;
                    if (file != null)
                    {
                        string path = Path.Combine(Server.MapPath("~/upload/images/products"), Path.GetFileName(file.FileName));
                        file.SaveAs(path);
                        item.images = file.FileName;
                    }
                    item.dateedit = DateTime.Now.ToShortDateString();
                    db.Entry(item).State = EntityState.Modified;
                    db.SaveChanges();
                    ServicesData.UpdateRouter("product", "index", product_category.id.ToString(), url);
                    return RedirectToAction("Index");
                }
              
               
            }
            ViewBag.parent = new SelectList(db.product_category, "id", "name", product_category.parent);
            return View(product_category);
        }

        // GET: admincp/product_category/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            product_category product_category = db.product_category.Find(id);
            if (product_category == null)
            {
                return HttpNotFound();
            }
            return View(product_category);
        }

        // POST: admincp/product_category/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            product_category product_category = db.product_category.Find(id);
            db.product_category.Remove(product_category);
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
