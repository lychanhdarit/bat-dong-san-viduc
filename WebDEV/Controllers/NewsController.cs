using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDEV.Areas.admincp.Models;
using WebDEV.Models;

namespace WebDEV.Controllers
{
    public class NewsController : Controller
    {
        private DataEntities1 db = new DataEntities1();
        // GET: News
        public ActionResult Index(int? id)
        {
            var news = db.news_category.FirstOrDefault(m => m.id == id);
            string websiteCDN = "../";
            if (news != null)
            {
                ViewBag.URLcanonical = Request.Url.AbsoluteUri;
                string title = news.meta_title + "";
                if (title.Length < 1)
                {
                    title = news.name;
                }
                ViewBag.Title = title;
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
            DataForPage dataForPage = new DataForPage();
            ViewBag.NewsHome2 = dataForPage.newsHome2();
            string Slider = "";
            var listPicture = db.pictures.Where(m => m.active == true && m.picture_group.id == 3);

            if (listPicture != null)
            {
                foreach (var item in listPicture)
                {
                    Slider += " <li> <a href='./" + item.note + "'><img src='../Upload/images/pictures/" + item.filename + "' alt='" + item.name + "'></a> </li>";
                }
            }
            ViewBag.Slider = Slider;
            return View(db.news.Where(m=>m.parent==id).ToList());
        }
        public ActionResult Detail(int? id)
        {
            var news = db.news.FirstOrDefault(m => m.id == id);
            string websiteCDN = "../";
            if (news != null)
            {
                ViewBag.URLcanonical = Request.Url.AbsoluteUri;
                string title = news.meta_title + "";
                if (title.Length < 1)
                {
                    title = news.name;
                }
                ViewBag.Title = title;
                ViewBag.Name = news.name;
                ViewBag.Description = news.meta_description;
                ViewBag.Keywords = news.meta_keywords;
                ViewBag.URL = news.url;
                ViewBag.Picture = websiteCDN + "/news/" + news.images;
                ViewBag.IDCAT = news.parent;
                ViewBag.OGtype = "<meta property='og:type' content='article' />";
                ViewBag.NewsCategory = NewsWithCategory(news.parent ?? 0);
            }
            else
            {

            }
            ViewBag.Menu = DataMenu.getMenuMain();
            ViewBag.MenuMobile = DataMenu.getMenuMainMobile();
            string Slider = "";
            var listPicture = db.pictures.Where(m => m.active == true && m.picture_group.id == 3);

            if (listPicture != null)
            {
                foreach (var item in listPicture)
                {
                    Slider += " <li> <a href='./" + item.note + "'><img src='../Upload/images/pictures/" + item.filename + "' alt='" + item.name + "'></a> </li>";
                }
            }
            ViewBag.Slider = Slider;
            ViewBag.ProductList = ProductWithCategory();
            ViewBag.NewsList = NewsWithCategory();
            DataForPage dataForPage = new DataForPage();
            ViewBag.NewsHome2 = dataForPage.newsHome2();
            return View(db.news.FirstOrDefault(m => m.id == id));
        }
        public string NewsWithCategory(int catId)
        {
            string html = "";
            var list = db.news.Where(m => m.parent == catId).OrderByDescending(m => m.id).ToList().Take(8);
            if (list == null)
            {
                list = db.news.OrderByDescending(m => m.id).ToList().Take(8);
            }
            if (list != null)
            {
                foreach (var item in list)
                {
                    html += "<li class='o-1-1 o-mi-sm-1-2 o-mi-lg-1-4'><div class='news-item-grid'>";
                    html += "<div class='box-image'>";
                    html += "<a href='../"+item.url+"'>";
                    html += "<img src='../upload/images/news/"+item.images+"' alt='"+item.name+"'>";
                    html += "</a>";
                    html += "</div>";
                    html += "<div class='box-title'>";
                    html += "<a href='../" + item.url + "' title='"+item.name+"'><h4 class='title-de'>"+item.name+"</h4></a>";
                    html += "</div><div class='box-time-add'><i class='far fa-calendar-alt'></i> "+item.datecreate+" <i class='fas fa-eye i-views'></i>Lượt xem: 10</div>";

                    string desc = item.desciption;
                    if(desc.Length>201)
                    {
                        desc = desc.Substring(0, 200) + " ...";
                    }
                    html += "<div class='box-description'>"+desc+"</div>";
                    html += "<div class='box-read-more'><a href='../" + item.url + "'><span>Xem thêm<i class='mgl5 fas fa-angle-double-right'></i></span></a></div>";
                    html += "</div></li>";
                }
            }
            return html;
        }
        public string ProductWithCategory()
        {
            string html = "";
            var list =  db.products.OrderByDescending(m => m.id).ToList().Take(5);
            if (list != null)
            {
                foreach (var item in list)
                {
                    html += "<li><figure class='featured-properties-thumbnail'> <span class='price'>"+item.price+"</span>";
                    html += "<a href=''><img class='img-responsive'  src='../upload/images/products/" + item.images + "' alt='" + item.name + "'></a>";
                    html += "</figure>  <h4 class='featured-properties-title'><a href='../"+item.url+"'>"+item.name+"</a></h4>  <a href='../"+item.url+"' class='read-more-link'>Xem thêm</a> </li>";

                }
            }
            return html;
        }
        public string NewsWithCategory()
        {
            string html = "";
            var list = db.news.OrderByDescending(m => m.id).ToList().Take(5);
            if (list != null)
            {
                foreach (var item in list)
                {
                    html += "<li><figure class='featured-properties-thumbnail'>";

                    html += "</figure>  <h4 class='featured-properties-title'><a href='../" + item.url + "'>" + item.name + "</a></h4>   </li>";

                }
            }
            return html;
        }
    }
}