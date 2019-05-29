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

    public class Home_RecentController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/Home_Recent
        public ActionResult Index()
        {
            return View(db.Home_Recent.Where(db=> db.Status3==0).ToList());
        }


        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Home_Recent home_Recent, HttpPostedFileBase Image)
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
                        if (home_Recent.Recent_Title != null && home_Recent.Recent_Content != null && home_Recent.First_Price != null && home_Recent.Second_Price != null && home_Recent.Progres != null)
                        {
                            DateTime dt = DateTime.Now;
                            var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                            fileName = beforeStr + Path.GetFileName(Image.FileName);
                            var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                            Image.SaveAs(newFilePath);
                            home_Recent.Image = fileName;
                            db.Home_Recent.Add(home_Recent);
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
            return View(home_Recent);
        }


        // GET: Admin/Home_Recent/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Home_Recent home_Recent = db.Home_Recent.Find(id);
            if (home_Recent == null)
            {
                return HttpNotFound();
            }
            return View(home_Recent);
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Recent_Title,Recent_Content,First_Price,Second_Price,Progres,Image")] Home_Recent home_Recent, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                Home_Recent activeRecent = db.Home_Recent.Find(home_Recent.Id);
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
                                var path = Path.Combine(Server.MapPath("~/Uploads/"), activeRecent.Image);

                                if (System.IO.File.Exists(path))
                                {
                                    System.IO.File.Delete(path);
                                }
                                if (home_Recent.Recent_Title != null && home_Recent.Recent_Content != null  && home_Recent.First_Price != null && home_Recent.Second_Price != null && home_Recent.Progres != null)
                                {
                                    DateTime dt = DateTime.Now;
                                    var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                                    fileName = beforeStr + Path.GetFileName(Image.FileName);
                                    var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                                    Image.SaveAs(newFilePath);
                                    activeRecent.Image = fileName;
                                    activeRecent.Recent_Title = home_Recent.Recent_Title;
                                    activeRecent.Recent_Content = home_Recent.Recent_Content;
                                    activeRecent.First_Price = home_Recent.First_Price;
                                    activeRecent.Second_Price = home_Recent.Second_Price;
                                    activeRecent.Progres = home_Recent.Progres;

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
                                return View(activeRecent);
                            }
                        }
                        else
                        {
                            ViewBag.EditError = "Image type should not be more than 4 MB.";
                            return View(activeRecent);
                        }

                    }
                    else
                    {
                        if (home_Recent.Recent_Title != null && home_Recent.Recent_Content != null && home_Recent.First_Price != null && home_Recent.Second_Price != null && home_Recent.Progres != null)
                        {

                            activeRecent.Recent_Title = home_Recent.Recent_Title;
                            activeRecent.Recent_Content = home_Recent.Recent_Content;
                            activeRecent.First_Price = home_Recent.First_Price;
                            activeRecent.Second_Price = home_Recent.Second_Price;
                            activeRecent.Progres = home_Recent.Progres;
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
            return View(home_Recent);
        }

        // GET: Admin/Books/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Home_Recent home_Recent = db.Home_Recent.Find(id);
            if (home_Recent == null)
            {
                return HttpNotFound();
            }
            return View(home_Recent);
        }

        // POST: Admin/Books/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Home_Recent activeRecent = db.Home_Recent.Find(id);
            activeRecent.Status3 = 1;
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
