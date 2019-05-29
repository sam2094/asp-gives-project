using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;


namespace Gives.Controllers
{
    public class FeatureController : Controller
    {
        GivesEntities db = new GivesEntities();
        // GET: Feature
        public ActionResult Index(int? id)
        {
            ViewBag.activeFeature = db.Features.Find(id);
            Feature activeFeture = db.Features.Find(id);
            if (activeFeture != null)
            {
                return View(activeFeture);
            }
            else
            {
                return Content("There is no Feature with this Id");
            }
            
        }
    }
}