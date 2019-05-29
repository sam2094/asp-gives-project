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

    public class Causes_List_MaskingController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/Causes_List_Masking
        public ActionResult Index()
        {
            return View(db.Causes_List_Masking.ToList());
        }

       

        // GET: Admin/Causes_List_Masking/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Causes_List_Masking causes_List_Masking = db.Causes_List_Masking.Find(id);
            if (causes_List_Masking == null)
            {
                return HttpNotFound();
            }
            return View(causes_List_Masking);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Title,Text_First,Text_Second,Image")] Causes_List_Masking causes_List_Masking, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                Causes_List_Masking activeMasking = db.Causes_List_Masking.Find(causes_List_Masking.Id);
                if (activeMasking != null)
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
                                if (causes_List_Masking.Title != null && causes_List_Masking.Text_First != null && causes_List_Masking.Text_Second != null)
                                {
                                    var path = Path.Combine(Server.MapPath("~/Uploads/"), activeMasking.Image);

                                    if (System.IO.File.Exists(path))
                                    {
                                        System.IO.File.Delete(path);
                                    }
                                    DateTime dt = DateTime.Now;
                                    var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                                    fileName = beforeStr + Path.GetFileName(Image.FileName);
                                    var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                                    Image.SaveAs(newFilePath);
                                    activeMasking.Image = fileName;
                                    activeMasking.Title = causes_List_Masking.Title;
                                    activeMasking.Text_First = causes_List_Masking.Text_First;
                                    activeMasking.Text_Second = causes_List_Masking.Text_Second;
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
                        if (causes_List_Masking.Title != null && causes_List_Masking.Text_First != null && causes_List_Masking.Text_Second != null)
                        {
                            activeMasking.Title = causes_List_Masking.Title;
                            activeMasking.Text_First = causes_List_Masking.Text_First;
                            activeMasking.Text_Second = causes_List_Masking.Text_Second;
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
                    return View(activeMasking);
                }
            }
            return View(causes_List_Masking);
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
