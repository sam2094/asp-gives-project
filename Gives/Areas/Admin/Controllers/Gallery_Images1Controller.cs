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

    public class Gallery_Images1Controller : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/Gallery_Images1
        public ActionResult Index()
        {
            return View(db.Gallery_Images.ToList());
        }

        // GET: Admin/Gallery_Images1/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Gallery_Images gallery_Images = db.Gallery_Images.Find(id);
            if (gallery_Images == null)
            {
                return HttpNotFound();
            }
            return View(gallery_Images);
        }
      
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Image,Width")] Gallery_Images gallery_Images, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                Gallery_Images activeGallery = db.Gallery_Images.Find(gallery_Images.Id);
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
            return View(gallery_Images);
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
