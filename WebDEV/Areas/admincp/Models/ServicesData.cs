using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace WebDEV.Areas.admincp.Models
{
    public class ServicesData
    {
        public static int UpdateRouter(string Controller, string Action, string IdItem, string URL)
        {
            DataEntities1 db = new DataEntities1();
            var itemRouter2 = db.router_config.FirstOrDefault(m => m.action == Action && m.controller ==Controller&& m.itemId == IdItem);
            if(itemRouter2!=null)
            {
                itemRouter2.controller = Controller;
                itemRouter2.action = Action;
                itemRouter2.itemId = IdItem;
                itemRouter2.url = URL;
                db.Entry(itemRouter2).State = EntityState.Modified;
                db.SaveChanges();
            }
            else
            {
                var itemRouter = db.router_config.FirstOrDefault(m => m.url == URL);
                if (itemRouter == null)
                {
                    router_config routeConfig = new router_config();
                    routeConfig.controller = Controller;
                    routeConfig.action = Action;
                    routeConfig.itemId = IdItem;
                    routeConfig.url = URL;
                    db.router_config.Add(routeConfig);
                    db.SaveChanges();
                }
                else
                {
                    itemRouter.controller = Controller;
                    itemRouter.action = Action;
                    itemRouter.itemId = IdItem;
                    itemRouter.url = URL;
                    db.Entry(itemRouter).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }
            

            return 1;
        }
    }
}