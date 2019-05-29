using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Gives.Models;
using System.IO;


namespace Gives.Areas.Admin.Controllers
{
    [AuthorizationFilterController]

    public class Home_GalleryController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/Home_Gallery
        public ActionResult Index()
        {
            return View(db.Home_Gallery.ToList());
        }

        

        // GET: Admin/Home_Gallery/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Home_Gallery home_Gallery = db.Home_Gallery.Find(id);
            if (home_Gallery == null)
            {
                return HttpNotFound();
            }
            return View(home_Gallery);
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Image")] Home_Gallery home_Gallery, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                Home_Gallery activeGallery = db.Home_Gallery.Find(home_Gallery.Id);
                if (activeGallery != null)
                {
                    string fileName = null;
                    if (Image != null)
                    {
                        if (Image.ContentLength > 0 && Image.ContentLength <= 4 * 1024 * 1024)
                        {
                            if (Image.ContentType.ToLower() == "image/jpeg" ||
                                Image.ContentType.ToLower() == "image/jpg" ||
                                Image.ContentType.ToLower() == "image/png" ||
                                Image.ContentType.ToLower() == "image/gif"
                            )
                            {
                                var path = Path.Combine(Server.MapPath("~/Uploads/"), activeGallery.Image);

                                if (System.IO.File.Exists(path))
                                {
                                    System.IO.File.Delete(path);
                                }
                                DateTime dt = DateTime.Now;
                                var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                                fileName = beforeStr + Path.GetFileName(Image.FileName);
                                var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                                Image.SaveAs(newFilePath);
                                activeGallery.Image = fileName;
                                db.SaveChanges();
                                return RedirectToAction("Index");
                            }
                            else
                            {
                                ViewBag.EditError = "Image type is not valid.";
                                return View(activeGallery);
                            }
                        }
                        else
                        {
                            ViewBag.EditError = "Image type should not be more than 4 MB.";
                            return View(activeGallery);
                        }
                    }
                    else
                    {
                        ViewBag.EditError = "Please,select an image.";
                        return View(activeGallery);
                    }
                }
                else
                {
                    ViewBag.EditError = "Id is not correct.";
                    return View(activeGallery);
                }
            }
            return View(home_Gallery);
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
