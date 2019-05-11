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
    public class news_categoryController : Controller
    {
        private DataEntities1 db = new DataEntities1();

        // GET: admincp/news_category
        public ActionResult Index()
        {
            return View(db.news_category.OrderByDescending(m => m.id).ToList());
        }

        // GET: admincp/news_category/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            news_category news_category = db.news_category.Find(id);
            if (news_category == null)
            {
                return HttpNotFound();
            }
            return View(news_category);
        }

        // GET: admincp/news_category/Create
        public ActionResult Create()
        {
            ViewBag.parent = new SelectList(db.news_category, "id", "name");
            return View();
        }

        // POST: admincp/news_category/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,desciption,content1,content2,content3,content4,content5,meta_title,meta_description,meta_keywords,images,datecreate,dateedit,usercreate,useredit,actived,deleted,parent,tags,views,rating,code,url,price,quantity")] news_category news_category, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                string url = "";
                if (news_category.url != null && news_category.url != "")
                {
                    url = Common.convertStringLinks(news_category.url);
                }

                if (url == "")
                {
                    url = Common.convertStringLinks(news_category.name);
                }
                news_category.url = url;
                if (file != null)
                {
                    string path = Path.Combine(Server.MapPath("~/upload/images/news"), Path.GetFileName(file.FileName));
                    file.SaveAs(path);
                    news_category.images = file.FileName;
                }
                
                news_category.datecreate = DateTime.Now.ToShortDateString();
                db.news_category.Add(news_category);
                db.SaveChanges();
                ServicesData.UpdateRouter("news", "index", news_category.id.ToString(), url);
                return RedirectToAction("Index");
            }
            ViewBag.parent = new SelectList(db.news_category, "id", "name", news_category.parent);
            return View(news_category);
        }

        // GET: admincp/news_category/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            news_category news_category = db.news_category.Find(id);
            if (news_category == null)
            {
                return HttpNotFound();
            }
            ViewBag.parent = new SelectList(db.news_category, "id", "name", news_category.parent);
            return View(news_category);
        }

        // POST: admincp/news_category/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,desciption,content1,content2,content3,content4,content5,meta_title,meta_description,meta_keywords,images,datecreate,dateedit,usercreate,useredit,actived,deleted,parent,tags,views,rating,code,url,price,quantity")] news_category news_category, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                string url = "";
                if (news_category.url != null && news_category.url != "")
                {
                    url = Common.convertStringLinks(news_category.url);
                }
                if (url == "")
                {
                    url = Common.convertStringLinks(news_category.name);
                }
                news_category item = db.news_category.AsNoTracking().Single(m => m.id == news_category.id);
                if (item != null)
                {
                    item.url = url;
                    item.name = news_category.name;
                    item.desciption = news_category.desciption;
                    item.content1 = news_category.content1;
                    item.meta_title = news_category.meta_title;
                    item.meta_description = news_category.meta_description;
                    item.meta_keywords = news_category.meta_keywords;
                    item.parent = news_category.parent;
                    item.actived = news_category.actived;
                    if (file != null)
                    {
                        string path = Path.Combine(Server.MapPath("~/upload/images/news"), Path.GetFileName(file.FileName));
                        file.SaveAs(path);
                        item.images = file.FileName;
                    }
                    item.dateedit = DateTime.Now.ToShortDateString();
                    db.Entry(item).State = EntityState.Modified;
                    db.SaveChanges();
                    ServicesData.UpdateRouter("news", "index", news_category.id.ToString(), url);
                    return RedirectToAction("Index");
                }
                    
            }
            ViewBag.parent = new SelectList(db.news_category, "id", "name", news_category.parent);
            return View(news_category);
        }

        // GET: admincp/news_category/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            news_category news_category = db.news_category.Find(id);
            if (news_category == null)
            {
                return HttpNotFound();
            }
            return View(news_category);
        }

        // POST: admincp/news_category/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            news_category news_category = db.news_category.Find(id);
            db.news_category.Remove(news_category);
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
