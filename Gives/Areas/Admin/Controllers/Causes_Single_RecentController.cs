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

    public class Causes_Single_RecentController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/Causes_Single_Recent
        public ActionResult Index()
        {
            return View(db.Causes_Single_Recent.ToList());
        }

       

        // GET: Admin/Causes_Single_Recent/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Causes_Single_Recent causes_Single_Recent = db.Causes_Single_Recent.Find(id);
            if (causes_Single_Recent == null)
            {
                return HttpNotFound();
            }
            return View(causes_Single_Recent);
        }
       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Image,Title,First_Price,Second_Price,Progress,Donors,Days,Content1,Content2,Content3")] Causes_Single_Recent causes_Single_Recent, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                Causes_Single_Recent activeRecent = db.Causes_Single_Recent.Find(causes_Single_Recent.Id);
                if (activeRecent != null)
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
                                if (causes_Single_Recent.Title != null && causes_Single_Recent.Content1 != null && causes_Single_Recent.Content2 != null && causes_Single_Recent.Content3 != null && causes_Single_Recent.First_Price != null && causes_Single_Recent.Second_Price != null && causes_Single_Recent.Progress != null && causes_Single_Recent.Donors != null && causes_Single_Recent.Days != null)
                                {
                                    var path = Path.Combine(Server.MapPath("~/Uploads/"), activeRecent.Image);

                                    if (System.IO.File.Exists(path))
                                    {
                                        System.IO.File.Delete(path);
                                    }
                                    DateTime dt = DateTime.Now;
                                    var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                                    fileName = beforeStr + Path.GetFileName(Image.FileName);
                                    var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                                    Image.SaveAs(newFilePath);
                                    activeRecent.Image = fileName;
                                    activeRecent.Title = causes_Single_Recent.Title;
                                    activeRecent.Content1 = causes_Single_Recent.Content1;
                                    activeRecent.Content2 = causes_Single_Recent.Content2;
                                    activeRecent.Content3 = causes_Single_Recent.Content3;
                                    activeRecent.First_Price = causes_Single_Recent.First_Price;
                                    activeRecent.Second_Price = causes_Single_Recent.Second_Price;
                                    activeRecent.Progress = causes_Single_Recent.Progress;
                                    activeRecent.Donors = causes_Single_Recent.Donors;
                                    activeRecent.Days = causes_Single_Recent.Days;
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
                        if(causes_Single_Recent.Title != null && causes_Single_Recent.Content1 != null && causes_Single_Recent.Content2 != null && causes_Single_Recent.Content3 != null && causes_Single_Recent.First_Price != null && causes_Single_Recent.Second_Price != null && causes_Single_Recent.Progress != null && causes_Single_Recent.Donors != null && causes_Single_Recent.Days != null)
                        {
                            activeRecent.Title = causes_Single_Recent.Title;
                            activeRecent.Content1 = causes_Single_Recent.Content1;
                            activeRecent.Content2 = causes_Single_Recent.Content2;
                            activeRecent.Content3 = causes_Single_Recent.Content3;
                            activeRecent.First_Price = causes_Single_Recent.First_Price;
                            activeRecent.Second_Price = causes_Single_Recent.Second_Price;
                            activeRecent.Progress = causes_Single_Recent.Progress;
                            activeRecent.Donors = causes_Single_Recent.Donors;
                            activeRecent.Days = causes_Single_Recent.Days;
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
                    return View(activeRecent);
                }


            }
            return View(causes_Single_Recent);
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
