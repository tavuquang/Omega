using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TechnoShop.Areas.admin.Controllers
{
    public class HomeAdminController : Controller
    {
        // GET: admin/HomeAdmin
        public ActionResult Index()
        {
            return View();
        }
    }
}