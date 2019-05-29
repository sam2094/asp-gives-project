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
    public class PayPal_DonateController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/PayPal_Donate
        public ActionResult Index()
        {
            return View(db.PayPal_Donate.ToList());
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
