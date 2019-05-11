using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebDEV.Binary
{
    public class CookieHelper
    {
        public static string _CookieName { get; set; }
        //public virtual Application App { get; set; }


        public CookieHelper()
        {
            _CookieName = _CookieName;
        }

        public static void SetCookie(string user, int cookieExpireDate = 30)
        {
            HttpCookie myCookie = new HttpCookie("UserAd", user);
            myCookie.Expires = DateTime.Now.AddDays(cookieExpireDate);
            HttpContext.Current.Response.Cookies.Add(myCookie);
        }
        public static void RemoveCookie()
        {
            string[] myCookies = HttpContext.Current.Request.Cookies.AllKeys;
            foreach (string cookie in myCookies)
            {
                HttpContext.Current.Response.Cookies[cookie].Expires = DateTime.Now.AddDays(-1);
            }
        }
    }
}