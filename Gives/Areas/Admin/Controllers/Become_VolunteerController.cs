using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Gives.Models;

namespace Gives.Areas.Admin.Controllers
{
    [AuthorizationFilterController]

    public class Become_VolunteerController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/Become_Volunteer
        public ActionResult Index()
        {
            return View(db.Become_Volunteer.Where(db=>db.Status == 0).ToList());
        }

        // GET: Admin/Become_Volunteer/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Become_Volunteer become_Volunteer = db.Become_Volunteer.Find(id);
            if (become_Volunteer == null)
            {
                return HttpNotFound();
            }
            return View(become_Volunteer);
        }

        // GET: Admin/Become_Volunteer/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Become_Volunteer become_Volunteer = db.Become_Volunteer.Find(id);
            if (become_Volunteer == null)
            {
                return HttpNotFound();
            }
            return View(become_Volunteer);
        }

        // POST: Admin/Become_Volunteer/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Become_Volunteer activeVolunteer = db.Become_Volunteer.Find(id);
            activeVolunteer.Status = 1;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
