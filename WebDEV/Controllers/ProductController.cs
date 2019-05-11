using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDEV.Areas.admincp.Models;
using WebDEV.Models;

namespace WebDEV.Controllers
{
    public class ProductController : Controller
    {
        private DataEntities1 db = new DataEntities1();
        // GET: Product
        public ActionResult Index(int? id)
        {
            var news = db.product_category.FirstOrDefault(m => m.id == id);
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
            var listPicture = db.pictures.Where(m => m.active == true && m.picture_group.id == 2);

            if (listPicture != null)
            {
                foreach (var item in listPicture)
                {
                    Slider += " <li> <a href='./" + item.note + "'><img src='../Upload/images/pictures/" + item.filename + "' alt='" + item.name + "'></a> </li>";
                }
            }
            ViewBag.Slider = Slider;
            return View(db.products.Where(m => m.parent == id).ToList());
        }
        public string getListImages(int idProduct)
        {
            string html = "";
            var product_img = db.product_picture.Where(m => m.id_product == idProduct).ToList();
            if(product_img!=null)
            {
                foreach(var item in product_img)
                {
                    html += "<li data-thumb='../Upload/images/products/"+item.filename+ "'> <a class='swipebox' data-rel='gallery12' href='../Upload/images/products/" + item.filename + "'><img src='../Upload/images/products/" + item.filename + "' alt='" + item.title + "'></a> </li>";
                }
            }
            
            return html;
        }
        public ActionResult Detail(int? id)
        {
            var news = db.products.FirstOrDefault(m => m.id == id);
            string websiteCDN = "../";
            if (news != null)
            {
                ViewBag.URLcanonical = Request.Url.AbsoluteUri;
                string title = news.meta_title + "";
                if(title.Length<1)
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
                ViewBag.ProductCategory = ProductWithCategory(news.parent??0);
                ViewBag.ListImage = getListImages(id ?? 0);
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
            return View(db.products.FirstOrDefault(m => m.id == id));
        }

        public string ProductWithCategory(int catId)
        {
            string html = "";
            var list = db.products.Where(m => m.parent == catId).OrderByDescending(m=>m.id).ToList().Take(8);
            if(list==null)
            {
                list = db.products.OrderByDescending(m => m.id).ToList().Take(8);
            }
            if(list!=null)
            {
                foreach(var item in list)
                {
                    html += " <article class='hentry clearfix'><figure class='property-thumbnail'> <a href='../" + item.url + "'><img width='850' height='570' src='../upload/images/products/" + item.images + "' alt='" + item.name + "' class='img-responsive wp-post-image'  > </a></figure>";
                    html += "<div class='property-description'><div class='arrow'></div><header class='entry-header'>";
                    html += "<h3 class='entry-title'><a href='../" + item.url + "' rel='bookmark'>"+item.name+"</a></h3>";
                    html += "<div class='price-and-status'><span class='price'>"+item.price+ "</span><a href='../" + item.product_category.url + "'><span class='property-status-tag'>"+item.product_category.name+"</span></a></div> </header>";
                    html += "<div class='property-meta entry-meta clearfix '> <div class='meta-item'> <i class='meta-item-icon icon-area'><svg xmlns='http://www.w3.org/2000/svg' class='meta-icon-container' width='30' height='30' viewBox='0 0 48 48'>";
                    html += "<path class='meta-icon' fill='#660000' d='M46 16v-12c0-1.104-.896-2.001-2-2.001h-12c0-1.103-.896-1.999-2.002-1.999h-11.997c-1.105 0-2.001.896-2.001 1.999h-12c-1.104 0-2 .897-2 2.001v12c-1.104 0-2 .896-2 2v11.999c0 1.104.896 2 2 2v12.001c0 1.104.896 2 2 2h12c0 1.104.896 2 2.001 2h11.997c1.106 0 2.002-.896 2.002-2h12c1.104 0 2-.896 2-2v-12.001c1.104 0 2-.896 2-2v-11.999c0-1.104-.896-2-2-2zm-4.002 23.998c0 1.105-.895 2.002-2 2.002h-31.998c-1.105 0-2-.896-2-2.002v-31.999c0-1.104.895-1.999 2-1.999h31.998c1.105 0 2 .895 2 1.999v31.999zm-5.623-28.908c-.123-.051-.256-.078-.387-.078h-11.39c-.563 0-1.019.453-1.019 1.016 0 .562.456 1.017 1.019 1.017h8.935l-20.5 20.473v-8.926c0-.562-.455-1.017-1.018-1.017-.564 0-1.02.455-1.02 1.017v11.381c0 .562.455 1.016 1.02 1.016h11.39c.562 0 1.017-.454 1.017-1.016 0-.563-.455-1.019-1.017-1.019h-8.933l20.499-20.471v8.924c0 .563.452 1.018 1.018 1.018.561 0 1.016-.455 1.016-1.018v-11.379c0-.132-.025-.264-.076-.387-.107-.249-.304-.448-.554-.551z'></path></svg></i>";
                    html += "<div class='meta-inner-wrapper'><span class='meta-item-label'>Diện tích:</span><span class='meta-item-value'>"+item.content2+" </span></div></div>  </div></div> </article>";

                }
            }
            return html;
        }
    }
}