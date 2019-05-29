using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;
using System.IO;


namespace Gives.Controllers
{
    public class BecomeVolunteerController : Controller
    {
        GivesEntities db = new GivesEntities();

        // GET: BecomeVolunteer
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(Become_Volunteer newVolunteer ,HttpPostedFileBase Image)
        {
            if(newVolunteer.Fullname != null && newVolunteer.Email != null && newVolunteer.Information != null)
            {
              if(Image != null)
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
                            DateTime dt = DateTime.Now;
                            var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                            fileName = beforeStr + Path.GetFileName(Image.FileName);
                            var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                            Image.SaveAs(newFilePath);
                            newVolunteer.Image = fileName;
                            db.Become_Volunteer.Add(newVolunteer);
                            db.SaveChanges();
                            ViewBag.Success = "Thank you! Your profile has been submitted for review.";
                        }
                        else
                        {
                            ViewBag.RegisterError = "Image type is not valid.";
                        }
                    }
                    else
                    {
                        ViewBag.RegisterError = "Image type should not be more than 4 MB.";
                    }
                }
                else
                {
                    ViewBag.RegisterError = "Please upload your image.";
                }
            }
            else
            {
                ViewBag.RegisterError = "Please, fill all the fields.";
            }
     
            return View();
        }
    }
}