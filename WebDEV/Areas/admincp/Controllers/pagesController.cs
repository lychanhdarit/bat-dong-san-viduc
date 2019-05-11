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
    public class pagesController : Controller
    {
        private DataEntities1 db = new DataEntities1();

        // GET: admincp/pages
        public ActionResult Index()
        {
            return View(db.pages.ToList());
        }

        // GET: admincp/pages/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            page page = db.pages.Find(id);
            if (page == null)
            {
                return HttpNotFound();
            }
            return View(page);
        }

        // GET: admincp/pages/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admincp/pages/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,desciption,content1,content2,content3,content4,content5,meta_title,meta_description,meta_keywords,images,datecreate,dateend,dateedit,usercreate,useredit,actived,deleted,parent,tags,views,rating,code,url,price,quantity")] page page, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                string url = "";
                if (page.url != null && page.url != "")
                {
                    url = Common.convertStringLinks(page.url);
                }

                if (url == "")
                {
                    url = Common.convertStringLinks(page.name);
                }
                page.url = url;
                if (file != null)
                {
                    string path = Path.Combine(Server.MapPath("~/upload/images/news"), Path.GetFileName(file.FileName));
                    file.SaveAs(path);
                    page.images = file.FileName;
                }
                page.dateend = DateTime.Now.ToShortDateString();
                page.datecreate = DateTime.Now.ToShortDateString();
                db.pages.Add(page);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(page);
        }

        // GET: admincp/pages/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            page page = db.pages.Find(id);
            if (page == null)
            {
                return HttpNotFound();
            }
            return View(page);
        }

        // POST: admincp/pages/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,desciption,content1,content2,content3,content4,content5,meta_title,meta_description,meta_keywords,images,datecreate,dateend,dateedit,usercreate,useredit,actived,deleted,parent,tags,views,rating,code,url,price,quantity")] page page, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                string url = "";
                if (page.url != null && page.url != "")
                {
                    url = Common.convertStringLinks(page.url);
                }
                if (url == "")
                {
                    url = Common.convertStringLinks(page.name);
                }
                page item = db.pages.FirstOrDefault(m => m.id == page.id);
                if (item != null)
                {
                    item.url = url;
                    item.name = page.name;
                    item.desciption = page.desciption;
                    item.content1 = page.content1;
                    item.content2 = page.content2;
                    item.content3 = page.content3;
                    item.content4 = page.content4;
                    item.content5 = page.content5;
                    item.meta_title = page.meta_title;
                    item.meta_description = page.meta_description;
                    item.meta_keywords = page.meta_keywords;
                    item.parent = page.parent;
                    item.actived = page.actived;
                    if (file != null)
                    {
                        string path = Path.Combine(Server.MapPath("~/upload/images/news"), Path.GetFileName(file.FileName));
                        file.SaveAs(path);
                        item.images = file.FileName;
                    }
                    item.dateedit = DateTime.Now.ToShortDateString();
                    db.Entry(item).State = EntityState.Modified;
                    db.SaveChanges();
                }
                    
                return RedirectToAction("Index");
            }
            return View(page);
        }

        // GET: admincp/pages/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            page page = db.pages.Find(id);
            if (page == null)
            {
                return HttpNotFound();
            }
            return View(page);
        }

        // POST: admincp/pages/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            page page = db.pages.Find(id);
            db.pages.Remove(page);
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
