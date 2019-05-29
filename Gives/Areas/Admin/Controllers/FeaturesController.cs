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

    public class FeaturesController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/Features
        public ActionResult Index()
        {
            return View(db.Features.ToList());
        }

        // GET: Admin/Features/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Feature feature = db.Features.Find(id);
            if (feature == null)
            {
                return HttpNotFound();
            }
            return View(feature);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Title,Content,Information,")] Feature feature)
        {
            if (ModelState.IsValid)
            {

                Feature activeFeature = db.Features.Find(feature.Id);
                if (activeFeature != null)
                {

                    if (feature.Title != null && feature.Information != null && feature.Content != null)
                    {
                        activeFeature.Title = feature.Title;
                        activeFeature.Content = feature.Content;
                        activeFeature.Information = feature.Information;
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ViewBag.EditError = "Please fill all the fields.";
                    }
                }
                else
                {
                    ViewBag.EditError = "Id is not correct.";
                    return View(activeFeature);
                }

            }
            return View(feature);
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
