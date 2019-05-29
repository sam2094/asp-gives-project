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
    public class User_MessagesController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/User_Messages
        public ActionResult Index()
        {
            return View(db.User_Messages.Where(db=>db.Status==0).ToList());
        }

        // GET: Admin/User_Messages/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User_Messages user_Messages = db.User_Messages.Find(id);
            if (user_Messages == null)
            {
                return HttpNotFound();
            }
            return View(user_Messages);
        }

        // GET: Admin/User_Messages/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User_Messages user_Messages = db.User_Messages.Find(id);
            if (user_Messages == null)
            {
                return HttpNotFound();
            }
            return View(user_Messages);
        }

        // POST: Admin/User_Messages/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            User_Messages user_Messages = db.User_Messages.Find(id);
            user_Messages.Status = 1;
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
