using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebDEV.Areas.admincp.Models;

namespace WebDEV.Models
{
    public class DataForPage
    {
        DataEntities1 db = new DataEntities1();
        public string newsHome2()
        {
            string html = "";
            var list = db.news.OrderByDescending(m => m.id).ToList().Take(4);
            if (list != null)
            {
                int i = 0;
                int cl = list.Count();
                foreach (var item in list)
                {
                    i++;
                    string desc = item.desciption;
                    if (desc.Length > 201)
                    {
                        desc = desc.Substring(0, 200) + " ...";
                    }
                    html += " <li class='o-1-1 o-mi-sm-1-2 o-mi-lg-1-4'><div class='news-item-grid'> <div class='box-title'><a href='../" + item.url + "' title='" + item.name + "'><h4 class='title-de'>" + item.name + "</h4></a></div> </div></li>";
                }
            }

            return html;
        }
    }
}