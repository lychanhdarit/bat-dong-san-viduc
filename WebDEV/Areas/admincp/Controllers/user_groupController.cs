﻿using System;
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
    [AuthorizeController]
    public class user_groupController : Controller
    {
        private DataEntities1 db = new DataEntities1();

        // GET: admincp/user_group
        public ActionResult Index()
        {
            return View(db.user_group.ToList());
        }

        // GET: admincp/user_group/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            user_group user_group = db.user_group.Find(id);
            if (user_group == null)
            {
                return HttpNotFound();
            }
            return View(user_group);
        }

        // GET: admincp/user_group/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admincp/user_group/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,active,permission")] user_group user_group)
        {
            if (ModelState.IsValid)
            {
                db.user_group.Add(user_group);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(user_group);
        }

        // GET: admincp/user_group/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            user_group user_group = db.user_group.Find(id);
            if (user_group == null)
            {
                return HttpNotFound();
            }
            return View(user_group);
        }

        // POST: admincp/user_group/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,active,permission")] user_group user_group)
        {
            if (ModelState.IsValid)
            {
                db.Entry(user_group).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(user_group);
        }

        // GET: admincp/user_group/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            user_group user_group = db.user_group.Find(id);
            if (user_group == null)
            {
                return HttpNotFound();
            }
            return View(user_group);
        }

        // POST: admincp/user_group/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            user_group user_group = db.user_group.Find(id);
            db.user_group.Remove(user_group);
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
