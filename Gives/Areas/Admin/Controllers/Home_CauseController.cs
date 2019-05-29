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

    public class Home_CauseController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/Home_Cause
        public ActionResult Index()
        {
            return View(db.Home_Cause.ToList());
        }

        // GET: Admin/Home_Cause/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Home_Cause home_Cause = db.Home_Cause.Find(id);
            if (home_Cause == null)
            {
                return HttpNotFound();
            }
            return View(home_Cause);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Title,Title2,Content,First_Price,Second_Price,Image,Progress")] Home_Cause home_Cause, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                Home_Cause activeCause = db.Home_Cause.Find(home_Cause.Id);
                if (activeCause != null)
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
                                var path = Path.Combine(Server.MapPath("~/Uploads/"), activeCause.Image);

                                if (System.IO.File.Exists(path))
                                {
                                    System.IO.File.Delete(path);
                                }
                                if (home_Cause.Title != null && home_Cause.Content != null && home_Cause.Title2 != null && home_Cause.First_Price!=null && home_Cause.Second_Price !=null && home_Cause.Progress != null)
                                {
                                    DateTime dt = DateTime.Now;
                                    var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                                    fileName = beforeStr + Path.GetFileName(Image.FileName);
                                    var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                                    Image.SaveAs(newFilePath);
                                    activeCause.Image = fileName;
                                    activeCause.Title = home_Cause.Title;
                                    activeCause.Content = home_Cause.Content;
                                    activeCause.Title2 = home_Cause.Title2;
                                    activeCause.First_Price = home_Cause.First_Price;
                                    activeCause.Second_Price = home_Cause.Second_Price;
                                    activeCause.Progress = home_Cause.Progress;

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
                                return View(activeCause);
                            }
                        }
                        else
                        {
                            ViewBag.EditError = "Image type should not be more than 4 MB.";
                            return View(activeCause);
                        }

                    }
                    else
                    {
                        if (home_Cause.Title != null && home_Cause.Content != null && home_Cause.Title2 != null && home_Cause.First_Price != null && home_Cause.Second_Price != null && home_Cause.Progress != null)
                        {

                            activeCause.Title = home_Cause.Title;
                            activeCause.Content = home_Cause.Content;
                            activeCause.Title2 = home_Cause.Title2;
                            activeCause.First_Price = home_Cause.First_Price;
                            activeCause.Second_Price = home_Cause.Second_Price;
                            activeCause.Progress = home_Cause.Progress;
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
                    return View(activeCause);
                }
            }
            return View(home_Cause);
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
