using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;


namespace Gives.Controllers
{
    public class DonationController : Controller
    {
        GivesEntities db = new GivesEntities();

        // GET: Donation
        public ActionResult Index()
        {
            ViewBag.SingleCards = db.Causes_Single_Cards.First();
            ViewBag.SinglePayPal = db.Causes_Single_Paypal.First();
            ViewBag.SinglePayTitle = db.Causes_Single_PayTitle.First();
            return View();
        }

        [HttpPost]
        public ActionResult Index(Visa_Master_Donate newDonate, PayPal_Donate payDonate)
        {
            ViewBag.SingleCards = db.Causes_Single_Cards.First();
            ViewBag.SinglePayPal = db.Causes_Single_Paypal.First();
            ViewBag.SinglePayTitle = db.Causes_Single_PayTitle.First();
            if (newDonate.Firstname != null && newDonate.Lastname != null && newDonate.Amount != null && newDonate.Pay_Type != null && newDonate.Card_Type != null && newDonate.Card_Number != null && newDonate.Card_CVC != null && newDonate.Date != null)
            {
                db.Visa_Master_Donate.Add(newDonate);
                db.SaveChanges();
                ViewBag.Error = "";
                ViewBag.Success = "We really appreciate your support and thank you for this contribution.";
            }
            else
            {
                ViewBag.Error = "Please,fill all the fields.";
            }

            if (payDonate.Amount != null && payDonate.Card_Number != null)
            {
                db.PayPal_Donate.Add(payDonate);
                db.SaveChanges();
                ViewBag.Error = "";
                ViewBag.Success = "We really appreciate your support and thank you for this contribution.";
            }
            else
            {
                ViewBag.Error = "Please,fill all the fields.";
            }
            return View();
        }
    }
}