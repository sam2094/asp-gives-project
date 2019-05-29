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
    public class Home_SliderController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/Home_Slider
        public ActionResult Index()
        {
            return View(db.Home_Slider.ToList());
        }

        // GET: Admin/Home_Slider/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Home_Slider home_Slider = db.Home_Slider.Find(id);
            if (home_Slider == null)
            {
                return HttpNotFound();
            }
            return View(home_Slider);
        }
  
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Title,Content,Image,Content2")] Home_Slider home_Slider, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                Home_Slider activeSlider = db.Home_Slider.Find(home_Slider.Id);
                if (activeSlider != null)
                {
                    string fileName = null;
                    if (Image !=null)
                    {
                        if (Image.ContentLength > 0 && Image.ContentLength <= 4 * 1024 * 1024)
                        {
                            if (Image.ContentType.ToLower() == "image/jpeg" ||
                                Image.ContentType.ToLower() == "image/jpg" ||
                                Image.ContentType.ToLower() == "image/png" ||
                                Image.ContentType.ToLower() == "image/gif"
                            )
                            {
                                var path = Path.Combine(Server.MapPath("~/Uploads/"), activeSlider.Image);

                                if (System.IO.File.Exists(path))
                                {
                                    System.IO.File.Delete(path);
                                }
                                 if (home_Slider.Title != null && home_Slider.Content != null && home_Slider.Content2 != null)
                                {
                                    DateTime dt = DateTime.Now;
                                    var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                                    fileName = beforeStr + Path.GetFileName(Image.FileName);
                                    var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                                    Image.SaveAs(newFilePath);
                                    activeSlider.Image = fileName;
                                    activeSlider.Title = home_Slider.Title;
                                    activeSlider.Content = home_Slider.Content;
                                    activeSlider.Content2 = home_Slider.Content2;
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
                                return View(activeSlider);
                            }
                        }
                        else
                        {
                            ViewBag.EditError = "Image type should not be more than 4 MB.";
                            return View(activeSlider);
                        }

                    }
                        else {
                        if (home_Slider.Title != null && home_Slider.Content != null && home_Slider.Content2 != null)
                        {

                            activeSlider.Title = home_Slider.Title;
                            activeSlider.Content = home_Slider.Content;
                            activeSlider.Content2 = home_Slider.Content2;
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
                    return View(activeSlider);
                }

            }
            return View(home_Slider);
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
