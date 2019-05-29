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

    public class Contact_AdressController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/Contact_Adress
        public ActionResult Index()
        {
            return View(db.Contact_Adress.ToList());
        }

        // GET: Admin/Contact_Adress/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contact_Adress contact_Adress = db.Contact_Adress.Find(id);
            if (contact_Adress == null)
            {
                return HttpNotFound();
            }
            return View(contact_Adress);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Adress,First_Number,Second_Number,First_Email,Second_Email")] Contact_Adress contact_Adress)
        {
            if (ModelState.IsValid)
            {
                Contact_Adress activeAdress = db.Contact_Adress.Find(contact_Adress.Id);

                if (activeAdress != null)
                {
                    if (contact_Adress.Adress != null && contact_Adress.First_Number != null && contact_Adress.Second_Number != null && contact_Adress.First_Email != null && contact_Adress.Second_Email != null)
                    {
                        activeAdress.Adress = contact_Adress.Adress;
                        activeAdress.First_Number = contact_Adress.First_Number;
                        activeAdress.Second_Number = contact_Adress.Second_Number;
                        activeAdress.First_Email = contact_Adress.First_Email;
                        activeAdress.Second_Email = contact_Adress.Second_Email;
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
            return View(contact_Adress);
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