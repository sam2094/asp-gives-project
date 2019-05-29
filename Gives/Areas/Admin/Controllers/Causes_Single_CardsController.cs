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

    public class Causes_Single_CardsController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/Causes_Single_Cards
        public ActionResult Index()
        {
            return View(db.Causes_Single_Cards.ToList());
        }

        // GET: Admin/Causes_Single_Cards/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Causes_Single_Cards causes_Single_Cards = db.Causes_Single_Cards.Find(id);
            if (causes_Single_Cards == null)
            {
                return HttpNotFound();
            }
            return View(causes_Single_Cards);
        }
       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,FirstPrice,SecondPrice,ThirdPrice")] Causes_Single_Cards causes_Single_Cards)
        {
            if (ModelState.IsValid)
            {
                Causes_Single_Cards activeCard = db.Causes_Single_Cards.Find(causes_Single_Cards.Id);
                if(activeCard != null)
                {
                    if(causes_Single_Cards.FirstPrice != null && causes_Single_Cards.SecondPrice != null && causes_Single_Cards.ThirdPrice != null)
                    {
                        activeCard.FirstPrice = causes_Single_Cards.FirstPrice;
                        activeCard.SecondPrice = causes_Single_Cards.SecondPrice;
                        activeCard.ThirdPrice = causes_Single_Cards.ThirdPrice;
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
            return View(causes_Single_Cards);
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
