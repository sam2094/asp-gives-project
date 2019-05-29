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

    public class FootersController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/Footers
        public ActionResult Index()
        {
            return View(db.Footers.ToList());
        }

      

        // GET: Admin/Footers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Footer footer = db.Footers.Find(id);
            if (footer == null)
            {
                return HttpNotFound();
            }
            return View(footer);
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Twitter,Google,Facebook,LInkedin,Scype")] Footer footer)
        {
            if (ModelState.IsValid)
            {
                if(footer.Twitter !=null && footer.Google != null && footer.Facebook != null && footer.LInkedin != null && footer.Scype != null)
                {
                    db.Entry(footer).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.Error = "Please fill all the fields.";
                }
             
            }
            return View(footer);
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
