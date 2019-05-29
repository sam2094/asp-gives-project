using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;


namespace Gives.Controllers
{
    public class ContactController : Controller
    {
        GivesEntities db = new GivesEntities();

        // GET: Contact
        public ActionResult Index()
        {
            ViewBag.ContactMasking = db.Contact_Masking.First();
            ViewBag.ContactInformation = db.Contact_Adress.First();
            ViewBag.Maps = db.Contact_Map.First();
            return View();
        }

        [HttpPost]
        public  ActionResult Index(User_Messages newMessages)
        {
            ViewBag.ContactMasking = db.Contact_Masking.First();
            ViewBag.ContactInformation = db.Contact_Adress.First();
            ViewBag.Maps = db.Contact_Map.First();
            if (newMessages.Name != null && newMessages.Subjects != null && newMessages.Email != null && newMessages.Mesage != null)
            {
                db.User_Messages.Add(newMessages);
                db.SaveChanges();
                ViewBag.Success = "Your message was successfully delivered !";
            }
            else
            {
                ViewBag.Error = "Please, fill all the fields.";
            }
            return View();
        }
      
    }
}