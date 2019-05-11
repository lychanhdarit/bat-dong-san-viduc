using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebDEV.Models
{
    public class SearchItem
    {
        public SearchItem()
        {

        }
        public SearchItem(string Name,string URL,string Image,string Desc)
        {
            this.Name = Name;
            this.URL = URL;
            this.Image = Image;
            this.Desc = Desc;
        }
        public string Name { get; set; }
        public string URL { get; set; }
        public string Image { get; set; }
        public string Desc { get; set; }
    }
}