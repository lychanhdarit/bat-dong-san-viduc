using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDEV.Binary;

namespace WebDEV.Areas.admincp.Models
{
    public class AuthorizeController : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            //Thực thi khi action được gọi
            if (HttpContext.Current.Request.Cookies["UserAd"] == null)
            {
                filterContext.Result = new RedirectResult("~/admincp/login/");
            }
            else
            {
                //string username = HttpContext.Current.Request.Cookies["UserSWG"].Value.ToString();
                string username = Common.GetUserName(Common.GetCookie("UserAd"));
                DataEntities1 db = new DataEntities1();

                var user = db.user_member.FirstOrDefault(m => m.username == username);
                if (user != null)
                {

                    //if (user.level == 3)
                    //{
                    //    filterContext.Result = new RedirectResult("~/qldh/");
                    //}
                    //if (user.level != 1 && user.level != 5)
                    //{
                    //    //Gia su co danh sach quyen// chuyen ve chu thuong
                    //    string[] listPermission = db.Permissions.FirstOrDefault(m => m.groupID == user.level).listPermission.Split('|');
                    //    //Action hien tai duoc goi
                    //    string actionName = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName + "-" + filterContext.ActionDescriptor.ActionName;
                    //    //Neu Action hien tai khoong thuoc quyen  cua nguoi dung hien tai
                    //    if (!listPermission.Contains(actionName.ToLower()))
                    //    {
                    //        filterContext.Result = new RedirectResult("~/vina-cp/home/NotificationAuthorize/");
                    //    }

                    //    ////Gia su co danh sach quyen// chuyen ve chu thuong
                    //    //string[] listPermission = { "products-index", "news-index", "home-notificationAuthorize", "home-index", "account-login" };
                    //    ////Action hien tai duoc goi
                    //    //string actionName = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName + "-" + filterContext.ActionDescriptor.ActionName;
                    //    ////Neu Action hien tai khoong thuoc quyen  cua nguoi dung hien tai
                    //    //if (!listPermission.Contains(actionName.ToLower()))
                    //    //{
                    //    //    filterContext.Result = new RedirectResult("~/vina-cp/home/NotificationAuthorize/");
                    //    //}


                    //}

                }
            }


        }

    }
}