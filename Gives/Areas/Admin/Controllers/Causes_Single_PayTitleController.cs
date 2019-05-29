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

    public class Causes_Single_PayTitleController : Controller
    {

        private GivesEntities db = new GivesEntities();

        // GET: Admin/Causes_Single_PayTitle
        public ActionResult Index()
        {
            return View(db.Causes_Single_PayTitle.ToList());
        }

       

        // GET: Admin/Causes_Single_PayTitle/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Causes_Single_PayTitle causes_Single_PayTitle = db.Causes_Single_PayTitle.Find(id);
            if (causes_Single_PayTitle == null)
            {
                return HttpNotFound();
            }
            return View(causes_Single_PayTitle);
        }

     
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Title")] Causes_Single_PayTitle causes_Single_PayTitle)
        {
            if (ModelState.IsValid)
            {
                Causes_Single_PayTitle activeTitle = db.Causes_Single_PayTitle.Find(causes_Single_PayTitle.Id);

                if (activeTitle != null)
                {
                    if (causes_Single_PayTitle.Title !=null)
                    {
                        activeTitle.Title = causes_Single_PayTitle.Title;
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ViewBag.EditError = "Please fill a field.";
                    }
                }
                else
                {
                    ViewBag.EditError = "Id is not correct.";
                }
            }
            return View(causes_Single_PayTitle);
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
