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

    public class Home_VolunteerController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/Home_Volunteer
        public ActionResult Index()
        {
            return View(db.Home_Volunteer.Where(db=>db.Status3==0).ToList());
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Home_Volunteer home_Volunteer, HttpPostedFileBase Image)
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
                        if (home_Volunteer.Information != null && home_Volunteer.Amount != null && home_Volunteer.Fullname != null && home_Volunteer.Content != null && home_Volunteer.Twitter != null && home_Volunteer.Facebook != null && home_Volunteer.Youtube != null)
                        {
                            DateTime dt = DateTime.Now;
                            var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                            fileName = beforeStr + Path.GetFileName(Image.FileName);
                            var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                            Image.SaveAs(newFilePath);
                            home_Volunteer.Image = fileName;
                            db.Home_Volunteer.Add(home_Volunteer);
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
            return View(home_Volunteer);
        }



        // GET: Admin/Home_Volunteer/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Home_Volunteer home_Volunteer = db.Home_Volunteer.Find(id);
            if (home_Volunteer == null)
            {
                return HttpNotFound();
            }
            return View(home_Volunteer);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Amount,Fullname,Content,Information,Image,Twitter,Facebook,Youtube")] Home_Volunteer home_Volunteer, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                Home_Volunteer activeVolunteer = db.Home_Volunteer.Find(home_Volunteer.Id);
                if (activeVolunteer != null)
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
                                var path = Path.Combine(Server.MapPath("~/Uploads/"), activeVolunteer.Image);

                                if (System.IO.File.Exists(path))
                                {
                                    System.IO.File.Delete(path);
                                }
                                if (home_Volunteer.Information != null && home_Volunteer.Amount != null && home_Volunteer.Fullname != null && home_Volunteer.Content != null && home_Volunteer.Twitter != null && home_Volunteer.Facebook != null && home_Volunteer.Youtube != null)
                                {
                                    DateTime dt = DateTime.Now;
                                    var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                                    fileName = beforeStr + Path.GetFileName(Image.FileName);
                                    var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                                    Image.SaveAs(newFilePath);
                                    activeVolunteer.Image = fileName;
                                    activeVolunteer.Amount = home_Volunteer.Amount;
                                    activeVolunteer.Fullname = home_Volunteer.Fullname;
                                    activeVolunteer.Content = home_Volunteer.Content;
                                    activeVolunteer.Information = home_Volunteer.Information;
                                    activeVolunteer.Twitter = home_Volunteer.Twitter;
                                    activeVolunteer.Facebook = home_Volunteer.Facebook;
                                    activeVolunteer.Youtube = home_Volunteer.Youtube;
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
                                return View(activeVolunteer);
                            }
                        }
                        else
                        {
                            ViewBag.EditError = "Image type should not be more than 4 MB.";
                            return View(activeVolunteer);
                        }

                    }
                    else
                    {
                        if (home_Volunteer.Information != null && home_Volunteer.Amount != null && home_Volunteer.Fullname != null && home_Volunteer.Content != null && home_Volunteer.Twitter != null && home_Volunteer.Facebook != null && home_Volunteer.Youtube != null)
                        {
                            activeVolunteer.Amount = home_Volunteer.Amount;
                            activeVolunteer.Fullname = home_Volunteer.Fullname;
                            activeVolunteer.Content = home_Volunteer.Content;
                            activeVolunteer.Information = home_Volunteer.Information;
                            activeVolunteer.Twitter = home_Volunteer.Twitter;
                            activeVolunteer.Facebook = home_Volunteer.Facebook;
                            activeVolunteer.Youtube = home_Volunteer.Youtube;
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
                    return View(activeVolunteer);
                }
            }
            return View(home_Volunteer);
        }

        // GET: Admin/Books/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Home_Volunteer home_Volunteer = db.Home_Volunteer.Find(id);
            if (home_Volunteer == null)
            {
                return HttpNotFound();
            }
            return View(home_Volunteer);
        }

        // POST: Admin/Books/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Home_Volunteer activeVolunter = db.Home_Volunteer.Find(id);
            activeVolunter.Status3 = 1;
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
