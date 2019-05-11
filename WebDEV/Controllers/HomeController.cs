using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDEV.Areas.admincp.Models;
using WebDEV.Models;

namespace WebDEV.Controllers
{
    public class HomeController : Controller
    {
        DataEntities1 db = new DataEntities1();
        // GET: Home
        public ActionResult Index()
        {
            
            var news = db.pages.FirstOrDefault(m => m.id == 1);
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
                ViewBag.content1 = news.content1;
                ViewBag.content2 = news.content2;
                ViewBag.content3 = news.content3;
            }
            else
            {

            }

            ViewBag.Menu = DataMenu.getMenuMain();
            ViewBag.MenuMobile = DataMenu.getMenuMainMobile();
            string Slider = "";

            //banner Slider Home
            var listPicture = db.pictures.Where(m=>m.active == true && m.picture_group.id == 1);
            if(listPicture!=null)
            {
                foreach(var item in listPicture)
                {
                    Slider += " <li> <a href='../"+item.note+"'><img src='../Upload/images/pictures/"+item.filename+"' alt='"+item.name+"'></a> </li>";
                }
            }
            ViewBag.Slider = Slider;
            //banner Footer Home
            string BannerFooter = "";
             listPicture = db.pictures.Where(m => m.active == true && m.picture_group.id == 5);

            if (listPicture != null)
            {
                foreach (var item in listPicture)
                {
                    BannerFooter += "<li class='o-1-1 o-mi-md-1-3'> <a  href='../" + item.note + "'><img src='../Upload/images/pictures/" + item.filename + "' alt='" + item.name + "'></a> </li>";
                }
            }
            ViewBag.BannerFooter = BannerFooter;

            //banner Giớ thiệu chung Home
            string BannerGTC = "";
            listPicture = db.pictures.Where(m => m.active == true && m.picture_group.id == 6);

            if (listPicture != null)
            {
                foreach (var item in listPicture)
                {
                    BannerGTC += "<img src='../Upload/images/pictures/" + item.filename + "' alt='" + item.name + "' style='width:93%'>";
                }
            }
            ViewBag.BannerGTC = BannerGTC;
            //banner Giớ thiệu chung Home
            string BannerTraiNhomSanPham = "";
            listPicture = db.pictures.Where(m => m.active == true && m.picture_group.id == 7);

            if (listPicture != null)
            {
                foreach (var item in listPicture)
                {
                    BannerTraiNhomSanPham += "<a href='../"+item.note+"'><img src='../Upload/images/pictures/" + item.filename + "' alt='" + item.name + "'></a>";
                }
            }
            ViewBag.BannerTraiNhomSanPham = BannerTraiNhomSanPham;

            //banner Nhoms SP chung Home
            string NhomSanPham = "";
            listPicture = db.pictures.Where(m => m.active == true && m.picture_group.id == 8);

            if (listPicture != null)
            {
                foreach (var item in listPicture)
                {
                    NhomSanPham += "<li class='o-1-1 o-mi-md-1-3'><div class='shop-category-small'><div class='box-image'><a href='../" + item.note + "'><img src='../Upload/images/pictures/" + item.filename + "' alt='" + item.name + "'></a></div><div class='box-title'><a href=href='../" + item.note + "'><h4 class='title-de'>"+item.name+"</h4></a></div></div></li>";
                }
            }
            ViewBag.NhomSanPham = NhomSanPham;



            ViewBag.NewsHome = NewsWithHome();
            DataForPage dataForPage = new DataForPage();
            ViewBag.NewsHome2 = dataForPage.newsHome2();
            ViewBag.ProductHome = ProductWithHome();
            //ViewBag.BDSBan = BDSBan();
            return View();
        }
        public string ProductWithHome()
        {
            string html = "";
            var list = db.products.OrderByDescending(m => m.id).ToList().Take(3);
            
            if (list != null)
            {
                foreach (var item in list)
                {
                    string name = item.name;
                    if (name.Length > 201)
                    {
                        name = name.Substring(0, 200) + " ...";
                    }
                    html += "<div class='col-xs-6 custom-col-xs-12 col-sm-6 col-md-4'>  <article class='hentry property-listing-three-post image-transition'> <div class='property-thumbnail'>";
                    html += "<a href='../" + item.url + "'><img class='img-responsive' src='../upload/images/products/" + item.images + "' alt='" + item.name + "'></a>";
                    html += "<a href='../" + item.product_category.url + "'><span class='property-status'>"+ item.product_category.name + "</span></a> </div> <div class='property-description'>  <header class='entry-header'>";
                    html += "<h4 class='entry-title'><a href='../" + item.url + "' rel='bookmark'>" + name+"</a></h4> <div class='price-and-status'> <span class='price'> <i class='fas fa-dollar-sign'></i>"+item.price+"</span>  </div>   </header>";
                    //html += "<p>" + item.desciption + "</p> ";
                    html += " <div class='property-meta entry-meta clearfix'>";
                    html += "<div class='meta-wrapper'><span class='meta-value'>Diện tích: </span><span class='meta-label'>" + item.content2+ "</span></div> <div class='meta-wrapper' style='float:right'><span class='meta-value'>Hướng nhà: </span><span class='meta-label'>" + item.tags + "</span></div> </div> </div>  <img src='../Upload/new-tag.png' style='position:absolute;left: 12px;top: -3px;height: 90px;' /></article>  </div>";

                }
            }
            return html;
        }
        public string BDSBan()
        {
            string html = "";
            var list = db.products.OrderByDescending(m => m.id).ToList().Take(4);

            if (list != null)
            {
                foreach (var item in list)
                {
                    html += "<div class='col-xs-6 custom-col-xs-12'> <article class='hentry featured-property-post clearfix'>  <div class='property-thumbnail'>";
                    html += "<a href='../" + item.url + "'><img class='img-responsive' src='../upload/images/products/" + item.images + "' alt='" + item.name + "'></a> <a href='../"+ item.product_category.url + "'><span class='property-status'>" + item.product_category.name + "</span></a> </div>";
                    html += "<div class='property-description'> <header class='entry-header'> <h4 class='entry-title'><a href='../" + item.url + "' rel='bookmark'>" + item.name + "</a></h4>  <div class='price-and-status'> <span class='price'>"+item.price+"</span>  </div> </header>";
                    html += "<p>" + item.desciption + "</p>";
                    html += "<div class='property-meta entry-meta clearfix'> <div class='meta-wrapper'> <span class='meta-value'>Diện tích: </span> <span class='meta-label'>" + item.content2 + "</span> </div>";
                    html += "</div> </div> </article>  </div>"; 
                }
            }
            return html;
        }
        public string NewsWithHome()
        {
            string html = "";
            string html1 = "";
            string html2="";
            var list  = db.news.OrderByDescending(m => m.id).ToList().Take(5);
            if (list != null)
            {
                int i = 0;
                foreach (var item in list)
                {
                    i++;
                    string desc = item.desciption;
                    if (desc.Length > 201)
                    {
                        desc = desc.Substring(0, 200) + " ...";
                    }
                    string name = item.name;
                    if (name.Length > 60)
                    {
                        name = name.Substring(0, 57) + " ...";
                    }

                    //html += "<div class='recent-posts-item'> <article class='clearfix format-gallery hentry'> <div class='post-thumbnail-container'>  <div class='gallery-slider-two flexslider'> <ul class='slides'>  <li>  <a title='"+item.name+ "' data-rel='gallery-1' class='swipebox' href='../upload/images/news/" + item.images + "'  > <img src='../upload/images/news/" + item.images + "' alt='" + item.name + "' ></a> </li> </ul>  </div>  </div>";
                    //html += "<div class='post-content-wrapper'> <div class='post-header entry-header'>  <h4 class='post-title entry-title'> <a href='../" + item.url + "'>" + item.name+"</a></h4>  </div>   <a class='read-more' href='../"+item.url+"'>Xem thêm <i class='fa fa-arrow-circle-o-right'></i></a> </div></article> </div>";
                    if (i==1)
                    {
                        html1 += "<div class='col-md-6'><div class='item-news'><a href='../" + item.url + "'>";
                        html1 += "<div class='img-news'><img src='../upload/images/news/" + item.images + "' alt='" + item.name + "' /></div>";
                        html1 += "<div class='t-news'><h6>" + name + "</h6></div>";
                        html1 += "<p class='p-news'>"+ desc + "</p>";
                        html1 += "</div></a></div>";
                    }
                    else
                    {
                        html2 += "<div class='item-news-s'><a href='../" + item.url + "'>";
                        html2 += "<div class='img-news'><img src='../upload/images/news/" + item.images + "' alt='" + item.name + "' /></div>";
                        html2 += "<div class='t-news'><h6>" + name + "</h6></div>";
                        html2 += "</a></div>";
                    }

                }
                
            }
            html = html1+ "<div class='col-md-6'><div class='list-item-news'>"+html2+"</div></div>";
            return html;
        }
       
    }
}