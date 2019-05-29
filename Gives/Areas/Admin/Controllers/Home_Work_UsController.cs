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
    public class Home_Work_UsController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/Home_Work_Us
        public ActionResult Index()
        {
            return View(db.Home_Work_Us.ToList());
        }

      

        // GET: Admin/Home_Work_Us/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Home_Work_Us home_Work_Us = db.Home_Work_Us.Find(id);
            if (home_Work_Us == null)
            {
                return HttpNotFound();
            }
            return View(home_Work_Us);
        }
       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Title,Title2,Image")] Home_Work_Us home_Work_Us, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                Home_Work_Us activeWork = db.Home_Work_Us.Find(home_Work_Us.Id);
                if (activeWork != null)
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
                                var path = Path.Combine(Server.MapPath("~/Uploads/"), activeWork.Image);

                                if (System.IO.File.Exists(path))
                                {
                                    System.IO.File.Delete(path);
                                }
                                if (home_Work_Us.Title != null && home_Work_Us.Title2 != null )
                                {
                                    DateTime dt = DateTime.Now;
                                    var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                                    fileName = beforeStr + Path.GetFileName(Image.FileName);
                                    var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                                    Image.SaveAs(newFilePath);
                                    activeWork.Image = fileName;
                                    activeWork.Title = home_Work_Us.Title;
                                    activeWork.Title2 = home_Work_Us.Title2;
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
                                return View(activeWork);
                            }
                        }
                        else
                        {
                            ViewBag.EditError = "Image type should not be more than 4 MB.";
                            return View(activeWork);
                        }

                    }
                    else
                    {
                        if (home_Work_Us.Title != null && home_Work_Us.Title2 != null)
                        {
                            activeWork.Title = home_Work_Us.Title;
                            activeWork.Title2 = home_Work_Us.Title2;
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
                    return View(activeWork);
                }
            }
            return View(home_Work_Us);
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
