using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using WebDEV.Areas.admincp.Models;

namespace WebDEV.App_Start
{
    public class MyRouteHander : IRouteHandler
    {
        public IHttpHandler GetHttpHandler(RequestContext requestContext)
        {
            DataEntities1 db = new DataEntities1();
            // Get route value ------------------------------------------------------------------
            var routeData = requestContext.RouteData;
            var action = routeData.GetRequiredString("action");
            var controller = routeData.GetRequiredString("controller");
            var url = controller;
            //Redirect to -----------------------------------------------------------------------
            if (controller != "Home" && action == "Index")
            {
                //var redirectRouter = db.RedirectRouters.FirstOrDefault(m => m.UrlFrom == url);
                //if (redirectRouter != null)
                //{
                //    requestContext.HttpContext.Response.Redirect(redirectRouter.UrlTo);
                //}
            }
            //Router config to ------------------------------------------------------------------
            if (!String.IsNullOrEmpty(action) && action != "Index")
            {
                url = action;
            }
            router_config routerConfig = db.router_config.FirstOrDefault(x => x.url == url);
            if (routerConfig != null)
            {
                requestContext.RouteData.Values["action"] = routerConfig.action;
                requestContext.RouteData.Values["controller"] = routerConfig.controller;
                requestContext.RouteData.Values["id"] = routerConfig.itemId;
            }
            return new MvcHandler(requestContext);
        }


    }
}