using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDEV.Areas.admincp.Models;
using WebDEV.Binary;
using WebDEV.Models;

namespace WebDEV.Controllers
{
    public class sitemapController : Controller
    {
        // GET: sitemap
        private DataEntities1 db = new DataEntities1();
        public SitemapActionResult Index()
        {
          
            var Website = ConfigurationSettings.AppSettings["website"].ToString();
            var SitemapItems = new List<SitemapItem>();

            #region Product
            var resultProduct = (from product in db.products
                                 select new
                                 {
                                     url = product.url,
                                     date = product.datecreate,
                                     View = product.views,
                                 }).OrderByDescending(m => m.View); ;
            if (resultProduct != null)
            {
                foreach (var item in resultProduct)
                {
                    DateTime dateTime = Common.SQLToDateRic(item.date);
                    if (dateTime.Year == 1)
                    {
                        dateTime = DateTime.Now;
                    }
                    SitemapItems.Add(new SitemapItem
                    {
                        URL = "/" + item.url,
                        Priority = "0.85",
                        DateAdded = new DateTime(dateTime.Year, dateTime.Month, dateTime.Day)
                    });
                }
            }
            #endregion

            #region News
            var resultNews = (from info in db.news
                                 select new
                                 {
                                     url = info.url,
                                     date = info.datecreate,
                                     View = info.views,
                                 }).OrderByDescending(m => m.View); ;
            if (resultNews != null)
            {
                foreach (var item in resultNews)
                {
                    DateTime dateTime = Common.SQLToDateRic(item.date);
                    if (dateTime.Year == 1)
                    {
                        dateTime = DateTime.Now;
                    }
                    SitemapItems.Add(new SitemapItem
                    {
                        URL = "/" + item.url,
                        Priority = "0.85",
                        DateAdded = new DateTime(dateTime.Year, dateTime.Month, dateTime.Day)
                    });
                }
            }
            #endregion


            #region News
            var resultPD = (from info in db.product_category
                              select new
                              {
                                  url = info.url,
                                  date = info.datecreate,
                                  View = info.views,
                              }).OrderByDescending(m => m.View); ;
            if (resultPD != null)
            {
                foreach (var item in resultPD)
                {
                    DateTime dateTime = Common.SQLToDateRic(item.date);
                    if (dateTime.Year == 1)
                    {
                        dateTime = DateTime.Now;
                    }
                    SitemapItems.Add(new SitemapItem
                    {
                        URL = "/" + item.url,
                        Priority = "1",
                        DateAdded = new DateTime(dateTime.Year, dateTime.Month, dateTime.Day)
                    });
                }
            }
            #endregion

            #region News
            var resultNC = (from info in db.news_category
                              select new
                              {
                                  url = info.url,
                                  date = info.datecreate,
                                  View = info.views,
                              }).OrderByDescending(m => m.View); ;
            if (resultNC != null)
            {
                foreach (var item in resultNC)
                {
                    DateTime dateTime = Common.SQLToDateRic(item.date);
                    if (dateTime.Year == 1)
                    {
                        dateTime = DateTime.Now;
                    }
                    SitemapItems.Add(new SitemapItem
                    {
                        URL = "/" + item.url,
                        Priority = "1",
                        DateAdded = new DateTime(dateTime.Year, dateTime.Month, dateTime.Day)
                    });
                }
            }
            #endregion
            return new SitemapActionResult(SitemapItems, Website);
        }
    }
}