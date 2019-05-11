using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDEV.Areas.admincp.Models;

namespace WebDEV.Areas.admincp.Controllers
{
    [AuthorizeController]
    public class HomeController : Controller
    {
        // GET: admincp/Home
        public ActionResult Index()
        {
            return View();
        }
    }
}