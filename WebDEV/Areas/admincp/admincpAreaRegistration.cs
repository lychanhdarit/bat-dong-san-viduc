using System.Web.Mvc;

namespace WebDEV.Areas.admincp
{
    public class admincpAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "admincp";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "admincp_default",
                "admincp/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
           
            context.MapRoute(
               "admincp_default 23",
               "admincp/{controller}/{action}/{id}",
               new { controller = "Home", action = "Index", id = UrlParameter.Optional }
           );
          
        }
    }
}