using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;


namespace Gives.Controllers
{
    public class VolunteersController : Controller
    {
        GivesEntities db = new GivesEntities();

        // GET: Volunteers
        public ActionResult Index(int? id)
        {
            ViewBag.activeVolunteer = db.Home_Volunteer.Find(id);
            Home_Volunteer activeVolunter = db.Home_Volunteer.Find(id);
            if (activeVolunter != null)
            {
                return View(activeVolunter);
            }
            else
            {
                return Content("There is no Volunteer with this Id");
            }
        }
    }
}