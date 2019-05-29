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

    public class About_PartnersController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/About_Partners
        public ActionResult Index()
        {
            return View(db.About_Partners.Where(db=>db.Status==0).ToList());
        }

        // GET: Admin/About_Partners/Create
        public ActionResult Create()
        {
            return View();
        }
       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Image,Website")] About_Partners about_Partners, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                if (Image != null)
                {
                    string fileName = null;

                    if (Image.ContentLength > 0 && Image.ContentLength <= 4 * 1024 * 1024)
                    {
                        if (Image.ContentType.ToLower() == "image/jpeg" ||
                                    Image.ContentType.ToLower() == "image/jpg" ||
                                    Image.ContentType.ToLower() == "image/png" ||
                                    Image.ContentType.ToLower() == "image/gif"
                                )
                        {
                            if (about_Partners.Website != null )
                            {
                                DateTime dt = DateTime.Now;
                                var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                                fileName = beforeStr + Path.GetFileName(Image.FileName);
                                var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                                Image.SaveAs(newFilePath);
                                about_Partners.Image = fileName;
                                db.About_Partners.Add(about_Partners);
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
                            ViewBag.EditError = "Image type is not valid.";
                        }
                    }
                    else
                    {
                        ViewBag.EditError = "Image type should not be more than 4 MB.";
                    }
                }
                else
                {
                    ViewBag.EditError = "Please,select an image.";
                }
            }

            return View(about_Partners);
        }

        // GET: Admin/About_Partners/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            About_Partners about_Partners = db.About_Partners.Find(id);
            if (about_Partners == null)
            {
                return HttpNotFound();
            }
            return View(about_Partners);
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Image,Website")] About_Partners about_Partners , HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                About_Partners activePartner = db.About_Partners.Find(about_Partners.Id);
                if (activePartner != null)
                {
                    if (Image != null)
                    {
                        string fileName = null;
                        if (Image.ContentLength > 0 && Image.ContentLength <= 4 * 1024 * 1024)
                        {
                            if (Image.ContentType.ToLower() == "image/jpeg" ||
                                Image.ContentType.ToLower() == "image/jpg" ||
                                Image.ContentType.ToLower() == "image/png" ||
                                Image.ContentType.ToLower() == "image/gif"
                            )
                            {
                                if (about_Partners.Website != null )
                                {
                                    var path = Path.Combine(Server.MapPath("~/Uploads/"), activePartner.Image);

                                    if (System.IO.File.Exists(path))
                                    {
                                        System.IO.File.Delete(path);
                                    }
                                    DateTime dt = DateTime.Now;
                                    var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                                    fileName = beforeStr + Path.GetFileName(Image.FileName);
                                    var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                                    Image.SaveAs(newFilePath);
                                    activePartner.Image = fileName;
                                    activePartner.Website = about_Partners.Website;
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
                                ViewBag.EditError = "Image type is not valid.";
                            }
                        }
                        else
                        {
                            ViewBag.EditError = "Image type should not be more than 4 MB.";
                        }

                    }
                    else
                    {
                        if (about_Partners.Website != null)
                        {
                            activePartner.Website = about_Partners.Website;
                            db.SaveChanges();
                            return RedirectToAction("Index");
                        }
                        else
                        {
                            ViewBag.EditError = "Please fill all the fields.";
                        }
                    }

                }
                else
                {
                    ViewBag.EditError = "Id is not correct.";
                    return View(activePartner);
                }
            }
            return View(about_Partners);
        }

        // GET: Admin/About_Partners/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            About_Partners about_Partners = db.About_Partners.Find(id);
            if (about_Partners == null)
            {
                return HttpNotFound();
            }
            return View(about_Partners);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            About_Partners activePartner = db.About_Partners.Find(id);
            activePartner.Status = 1;
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
