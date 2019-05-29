using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;


namespace Gives.Areas.Admin.Controllers
{
    [AuthorizationFilterController]

    public class MapController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/Map
        public ActionResult Index()
        {
            ViewBag.Map = db.Contact_Map.First();
            return View();
        }

        [HttpPost]
        public ActionResult Index(string Map_Location)
        {
            db.Contact_Map.First().Map_Location = Map_Location;
            db.SaveChanges(); 
            return RedirectToAction("Index");
        }

    }
}