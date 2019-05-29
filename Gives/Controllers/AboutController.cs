using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;


namespace Gives.Controllers
{
    public class AboutController : Controller
    {
        GivesEntities db = new GivesEntities();

        // GET: About
        public ActionResult Index()
        {
            ViewBag.AboutMasking = db.About_Masking.First();
            ViewBag.AboutSection = db.About_Section.First();
            ViewBag.HomeVolunteer = db.Home_Volunteer.Where(db => db.Status3 == 0).ToList();
            ViewBag.Partners = db.About_Partners.Where(db => db.Status == 0).ToList();
            return View();
        }
    }
}