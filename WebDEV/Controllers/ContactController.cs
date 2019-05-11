using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDEV.Areas.admincp.Models;
using WebDEV.Models;

namespace WebDEV.Controllers
{
    public class ContactController : Controller
    {
        private DataEntities1 db = new DataEntities1();
        // GET: Contact
        public ActionResult Index()
        {
            DataEntities1 db = new DataEntities1();
            var news = db.pages.FirstOrDefault(m => m.id == 2);
            string websiteCDN = "../";
            if (news != null)
            {
                ViewBag.URLcanonical = Request.Url.AbsoluteUri;
                ViewBag.Title = news.meta_title + "";
                ViewBag.Name = news.name;
                ViewBag.Description = news.meta_description;
                ViewBag.Keywords = news.meta_keywords;
                ViewBag.URL = news.url;
                ViewBag.Picture = websiteCDN + "/news/" + news.images;
                ViewBag.IDCAT = news.parent;
                ViewBag.OGtype = "<meta property='og:type' content='article' />";
            }
            else
            {

            }
            ViewBag.Menu = DataMenu.getMenuMain();
            ViewBag.MenuMobile = DataMenu.getMenuMainMobile();
            string Slider = "";
            var listPicture = db.pictures.Where(m => m.active == true && m.picture_group.id == 4);
            if (listPicture != null)
            {
                foreach (var item in listPicture)
                {
                    Slider += " <li> <a href='./" + item.note + "'><img src='../Upload/images/pictures/" + item.filename + "' alt='" + item.name + "'></a> </li>";
                }
            }
            ViewBag.Slider = Slider;
            ViewBag.groupid = new SelectList(db.group_inbox, "id", "name");
            return View();
        }
        [HttpPost]
        public ActionResult Index([Bind(Include = "id,name,email,phone,message,active,groupid,subject,address,note")] inbox inbox)
        {
            DataEntities1 db = new DataEntities1();
            var news = db.pages.FirstOrDefault(m => m.id == 2);
            string websiteCDN = "../";
            if (news != null)
            {
                ViewBag.URLcanonical = Request.Url.AbsoluteUri;
                ViewBag.Title = news.meta_title + "";
                ViewBag.Name = news.name;
                ViewBag.Description = news.meta_description;
                ViewBag.Keywords = news.meta_keywords;
                ViewBag.URL = news.url;
                ViewBag.Picture = websiteCDN + "/news/" + news.images;
                ViewBag.IDCAT = news.parent;
                ViewBag.OGtype = "<meta property='og:type' content='article' />";
            }
            else
            {

            }
            ViewBag.Menu = DataMenu.getMenuMain();
            ViewBag.MenuMobile = DataMenu.getMenuMainMobile();
            string Slider = "";
            var listPicture = db.pictures.Where(m => m.active == true && m.picture_group.id == 4);

            if (listPicture != null)
            {
                foreach (var item in listPicture)
                {
                    Slider += " <li> <a href='./" + item.note + "'><img src='../Upload/images/pictures/" + item.filename + "' alt='" + item.name + "'></a> </li>";
                }
            }
            ViewBag.Slider = Slider;

            if (ModelState.IsValid)
            {
                db.inboxes.Add(inbox);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.groupid = new SelectList(db.group_inbox, "id", "name", inbox.groupid);
            return View("Hoantat");
        }
        public ActionResult Hoantat()
        {
            DataEntities1 db = new DataEntities1();
            var news = db.pages.FirstOrDefault(m => m.id == 2);
            string websiteCDN = "../";
            if (news != null)
            {
                ViewBag.URLcanonical = Request.Url.AbsoluteUri;
                ViewBag.Title = news.meta_title + "";
                ViewBag.Name = news.name;
                ViewBag.Description = news.meta_description;
                ViewBag.Keywords = news.meta_keywords;
                ViewBag.URL = news.url;
                ViewBag.Picture = websiteCDN + "/news/" + news.images;
                ViewBag.IDCAT = news.parent;
                ViewBag.OGtype = "<meta property='og:type' content='article' />";
            }
            else
            {

            }
            ViewBag.Menu = DataMenu.getMenuMain();
            ViewBag.MenuMobile = DataMenu.getMenuMainMobile();
            string Slider = "";
            var listPicture = db.pictures.Where(m => m.active == true && m.picture_group.id == 4);
            if (listPicture != null)
            {
                foreach (var item in listPicture)
                {
                    Slider += " <li> <a href='./" + item.note + "'><img src='../Upload/images/pictures/" + item.filename + "' alt='" + item.name + "'></a> </li>";
                }
            }
            ViewBag.Slider = Slider;
            ViewBag.groupid = new SelectList(db.group_inbox, "id", "name");
            return View();
        }
        }
}