using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebDEV.Areas.admincp.Models;

namespace WebDEV.Models
{
    public class DataMenu
    {
       
        public static string getMenuMain()
        {
            DataEntities1 db = new DataEntities1();
            string html = "";
            var data = db.menus.ToList();
            var menuFirst = data.Where(m => m.parent == null).OrderBy(m=>m.sort).ToList();
            foreach(var itemMain in menuFirst)
            {
                html += "<li class=''><a class='' href='../"+itemMain.url+"'>"+itemMain.name+"</a>";
                var menu1 = data.Where(m => m.parent == itemMain.id).OrderBy(m => m.sort).ToList();
                if(menu1.Count >0)
                {
                    html += "<ul class='sub-menu'>";
                    foreach(var item1 in menu1)
                    {
                        html += "<li class=' '><a class='' href='../"+item1.url+"'>"+item1.name+"</a>";

                        var menu2 = data.Where(m => m.parent == item1.id).OrderBy(m => m.sort).ToList();
                        if (menu2.Count > 0)
                        {
                            html += "<ul class='sub-menu'>";
                            foreach (var item2 in menu2)
                            {
                                html += "<li class=' '><a class='' href='../" + item2.url + "'>" + item2.name + "</a> </li>";
                            }
                            html += "</ul>";
                        }
                        html += "</li>";
                    }
                    html += "</ul>";
                }
                html += "</li>";
            }
            return html;

        }
        public static string getMenuMainMobile()
        {
            DataEntities1 db = new DataEntities1();
            string html = "";
            var data = db.menus.ToList();
            var menuFirst = data.Where(m => m.parent == null).OrderBy(m => m.sort).ToList();
            foreach (var itemMain in menuFirst)
            {
                html += "<li class=''><a class='' href='../" + itemMain.url + "'>" + itemMain.name + "</a>";
                var menu1 = data.Where(m => m.parent == itemMain.id).OrderBy(m => m.sort).ToList();
                if (menu1.Count > 0)
                {
                    html += "<div class='opacity'></div>";
                    html += "<ul>";
                    foreach (var item1 in menu1)
                    {
                        html += "<li class=' '><a class='' href='../" + item1.url + "'>" + item1.name + "</a>";
                        var menu2 = data.Where(m => m.parent == item1.id).OrderBy(m => m.sort).ToList();
                        if (menu2.Count > 0)
                        {
                            html += "<ul class='opacity'>";
                            foreach (var item2 in menu2)
                            {
                                html += "<li class=' '><a class='' href='../" + item2.url + "'>" + item2.name + "</a></li>";
                            }
                            html += "</ul>";
                        }
                        html += "</li>";

                    }
                    html += "</ul>";
                }
                html += "</li>";
            }
            return html;

        }
    }
}