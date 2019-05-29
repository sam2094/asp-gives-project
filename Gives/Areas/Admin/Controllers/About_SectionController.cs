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

    public class About_SectionController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/About_Section
        public ActionResult Index()
        {
            return View(db.About_Section.ToList());
        }

        // GET: Admin/About_Section/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            About_Section about_Section = db.About_Section.Find(id);
            if (about_Section == null)
            {
                return HttpNotFound();
            }
            return View(about_Section);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Title,Text_First,Text_Second,Information,Image")] About_Section about_Section, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                About_Section activeSection = db.About_Section.Find(about_Section.Id);
                if (activeSection != null)
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
                                if (about_Section.Title != null && about_Section.Text_First != null && about_Section.Text_Second != null  && about_Section.Information !=null )
                                {
                                    var path = Path.Combine(Server.MapPath("~/Uploads/"), activeSection.Image);

                                    if (System.IO.File.Exists(path))
                                    {
                                        System.IO.File.Delete(path);
                                    }
                                    DateTime dt = DateTime.Now;
                                    var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                                    fileName = beforeStr + Path.GetFileName(Image.FileName);
                                    var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                                    Image.SaveAs(newFilePath);
                                    activeSection.Image = fileName;
                                    activeSection.Title = about_Section.Title;
                                    activeSection.Text_First = about_Section.Text_First;
                                    activeSection.Text_Second = about_Section.Text_Second;
                                    activeSection.Information = about_Section.Information;
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
                        if (about_Section.Title != null && about_Section.Text_First != null && about_Section.Text_Second != null && about_Section.Information != null)
                        {
                            activeSection.Title = about_Section.Title;
                            activeSection.Text_First = about_Section.Text_First;
                            activeSection.Text_Second = about_Section.Text_Second;
                            activeSection.Information = about_Section.Information;
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
                    return View(activeSection);
                }
            }
            return View(about_Section);
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
