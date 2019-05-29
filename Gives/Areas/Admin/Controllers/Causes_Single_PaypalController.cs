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

    public class Causes_Single_PaypalController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/Causes_Single_Paypal
        public ActionResult Index()
        {
            return View(db.Causes_Single_Paypal.ToList());
        }

        

        // GET: Admin/Causes_Single_Paypal/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Causes_Single_Paypal causes_Single_Paypal = db.Causes_Single_Paypal.Find(id);
            if (causes_Single_Paypal == null)
            {
                return HttpNotFound();
            }
            return View(causes_Single_Paypal);
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,FirstPrice,SecondPrice,ThirdPrice")] Causes_Single_Paypal causes_Single_Paypal)
        {
            if (ModelState.IsValid)
            {
                Causes_Single_Paypal activeCard = db.Causes_Single_Paypal.Find(causes_Single_Paypal.Id);
                if (activeCard != null)
                {
                    if (causes_Single_Paypal.FirstPrice != null && causes_Single_Paypal.SecondPrice != null && causes_Single_Paypal.ThirdPrice != null)
                    {
                        activeCard.FirstPrice = causes_Single_Paypal.FirstPrice;
                        activeCard.SecondPrice = causes_Single_Paypal.SecondPrice;
                        activeCard.ThirdPrice = causes_Single_Paypal.ThirdPrice;
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
                    return View(activeCard);
                }
            }
            return View(causes_Single_Paypal);
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
