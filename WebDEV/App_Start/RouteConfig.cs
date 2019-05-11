using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using WebDEV.App_Start;

namespace WebDEV
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
               "Home",
               "Home/{action}/{id}",
               new { controller = "Home", action = "Index", id = UrlParameter.Optional }, new[] { "WebDEV.Controllers" }
             ).RouteHandler = new MyRouteHander();

            routes.MapRoute(
             "Search",
             "Search/{key}",
             new { controller = "Search", action = "Index", id = UrlParameter.Optional }, new[] { "WebDEV.Controllers" }
           ).RouteHandler = new MyRouteHander();

            routes.MapRoute(
             "Search Product",
             "searchp/{key}",
             new { controller = "Search", action = "Product", id = UrlParameter.Optional }, new[] { "WebDEV.Controllers" }
           ).RouteHandler = new MyRouteHander();
            routes.MapRoute(
            "Top San Pham",
            "top-san-pham-moi",
            new { controller = "LandingPage", action = "Index" }, new[] { "WebDEV.Controllers" }
          ).RouteHandler = new MyRouteHander();

            routes.MapRoute(
              "Default 2",
              "{controller}/{action}/{id}",
              new { controller = "Home", action = "Index", id = UrlParameter.Optional }, new[] { "WebDEV.Controllers" }
            ).RouteHandler = new MyRouteHander();

        }
    }
}
