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
    public class newsController : Controller
    {
        private DataEntities1 db = new DataEntities1();

        // GET: admincp/news
        public ActionResult Index()
        {
            var news = db.news.Include(n => n.news_category);
            return View(news.OrderByDescending(m => m.id).ToList());
        }

        // GET: admincp/news/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            news news = db.news.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // GET: admincp/news/Create
        public ActionResult Create()
        {
            ViewBag.parent = new SelectList(db.news_category, "id", "name");
            return View();
        }

        // POST: admincp/news/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,desciption,content1, meta_title,meta_description,meta_keywords,images,actived,parent,tags,views,rating,code,url,price,quantity")] news news, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                string url = "";
                if (news.url!=null&& news.url!="")
                {
                    url = Common.convertStringLinks(news.url);
                }
               
                if (url == "")
                {
                    url = Common.convertStringLinks(news.name);
                }
                news.url = url;
                if (file != null)
                {
                    string path = Path.Combine(Server.MapPath("~/upload/images/news"), Path.GetFileName(file.FileName));
                    file.SaveAs(path);
                    news.images = file.FileName;
                }
                news.dateend = DateTime.Now.ToShortDateString();
                news.datecreate = DateTime.Now.ToShortDateString();
                db.news.Add(news);
                db.SaveChanges();
                ServicesData.UpdateRouter("news", "detail", news.id.ToString(), url);
                return RedirectToAction("Index");
            }

            ViewBag.parent = new SelectList(db.news_category, "id", "name", news.parent);
            return View(news);
        }

        // GET: admincp/news/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            news news = db.news.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            ViewBag.parent = new SelectList(db.news_category, "id", "name", news.parent);
            return View(news);
        }

        // POST: admincp/news/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,desciption,content1,meta_title,meta_description,meta_keywords,images,actived,parent,tags,views,rating,code,url,price,quantity")] news news, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
               
                string url = "";
                if (news.url != null && news.url != "")
                {
                    url = Common.convertStringLinks(news.url);
                }
                if (url == "")
                {
                    url = Common.convertStringLinks(news.name);
                }
                news item = db.news.FirstOrDefault(m => m.id == news.id);
                if(item!=null)
                {
                    item.url = url;
                    item.name = news.name;
                    item.desciption = news.desciption;
                    item.content1 = news.content1;
                    item.meta_title = news.meta_title;
                    item.meta_description = news.meta_description;
                    item.meta_keywords = news.meta_keywords;
                    item.parent = news.parent;
                    item.actived = news.actived;
                    if (file != null)
                    {
                        string path = Path.Combine(Server.MapPath("~/upload/images/news"), Path.GetFileName(file.FileName));
                        file.SaveAs(path);
                        item.images = file.FileName;
                    }
                    item.dateedit = DateTime.Now.ToShortDateString();
                    db.Entry(item).State = EntityState.Modified;
                    db.SaveChanges();
                    ServicesData.UpdateRouter("news", "detail", news.id.ToString(), url);
                }
                return RedirectToAction("Index");
            }
            ViewBag.parent = new SelectList(db.news_category, "id", "name", news.parent);
            return View(news);
        }

        // GET: admincp/news/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            news news = db.news.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // POST: admincp/news/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            news news = db.news.Find(id);
            db.news.Remove(news);
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
