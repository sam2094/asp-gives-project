using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;


namespace Gives.Controllers
{
    public class AboutInfoController : Controller
    {
        GivesEntities db = new GivesEntities();

        // GET: AboutInfo
        public ActionResult Index()
        {
            ViewBag.AboutInfo = db.About_Section.First();
            return View();
        }
    }
}