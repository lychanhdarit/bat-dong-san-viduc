using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDEV.Areas.admincp.Models;
using WebDEV.Binary;
using WebDEV.Models;

namespace WebDEV.Controllers
{
    public class searchController : Controller
    {
        private DataEntities1 db = new DataEntities1();
        // GET: search
        public ActionResult Index(string keyword)
        {
            List<SearchItem> data = new List<SearchItem>();
            var news = db.pages.FirstOrDefault(m => m.id == 3);
            if(keyword==null)
            {
                keyword = " ";
            }
            string websiteCDN = "../";
            if (news != null)
            {
                ViewBag.URLcanonical = Request.Url.AbsoluteUri;
                ViewBag.Title = (news.meta_title + "").Replace("@key", keyword);
                ViewBag.Name = news.name.Replace("@key", keyword);
                ViewBag.Description = news.meta_description.Replace("@key", keyword);
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
            var listPicture = db.pictures.Where(m => m.active == true && m.picture_group.id == 2);

            if (listPicture != null)
            {
                foreach (var item in listPicture)
                {
                    Slider += " <li> <a href='./" + item.note + "'><img src='../Upload/images/pictures/" + item.filename + "' alt='" + item.name + "'></a> </li>";
                }
            }
            ViewBag.Slider = Slider;

            var result = (from product in db.products select product).OrderByDescending(p => p.id).ToList();
            List<SearchItem> list = new List<SearchItem>();
            if (result != null)
            {
                foreach (var item in result)
                {
                    string url = item.url;
                    SearchItem m = new SearchItem( item.name,  url, "../upload/images/products/"+item.images, item.desciption);
                    list.Add(m);
                }
            }
            var resultNews = (from n in db.news select n).OrderByDescending(p => p.id).ToList();
            if (resultNews != null)
            {
                foreach (var item in resultNews)
                {
                    string url = item.url;
                    SearchItem m = new SearchItem(item.name, url, "../upload/images/news/" + item.images, item.desciption);
                    list.Add(m);
                }
            }
            var query = list.Where(delegate (SearchItem c)
            {
                if (Common.ConvertToUnSign(c.Name).IndexOf(keyword, StringComparison.CurrentCultureIgnoreCase) >= 0 || (c.Name).IndexOf(keyword) > -1 || (c.Name.ToLower()).IndexOf(keyword.ToLower()) > -1 || (c.Name.ToUpper()).IndexOf(keyword.ToUpper()) > -1)
                    return true;
                else
                    return false;
            }).AsQueryable();

            List<SearchItem> ls = query.ToList();
            if (ls.Count == 0)
            {
                ls = list.Where(m => m.Name.Contains(keyword)).ToList();
            }
            return View(ls);
        }
    }
}