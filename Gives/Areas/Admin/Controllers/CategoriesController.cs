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

    public class CategoriesController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/Categories
        public ActionResult Index()
        {
            
            return View(db.Categories.Where(ct=> ct.Status == 0).ToList());
        }

        // GET: Admin/Categories/Details/5
       

        // GET: Admin/Categories/Create
        public ActionResult Create()
        {
            return View();
        }

       //go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Status")] Category category)
        {
            if (ModelState.IsValid)
            {
                if (category.Name != null)
                {
                        db.Categories.Add(category);
                        db.SaveChanges();
                        return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.EditError = "Please,fill Category's fill.";
                }
                
            }

            return View(category);
        }

        // GET: Admin/Categories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Status")] Category category)
        {
            if (ModelState.IsValid)
            {
                if(category.Name != null)
                {
                    db.Entry(category).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.EditError = "Please,fill Category's fill.";
                }
                
            }
            return View(category);
        }

        // GET: Admin/Categories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Admin/Categories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Category category = db.Categories.Find(id);
            category.Status = 1;
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
