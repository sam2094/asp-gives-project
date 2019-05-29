using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;


namespace Gives.Controllers
{
    public class GalleryController : Controller
    {
        GivesEntities db = new GivesEntities();

        // GET: Gallery
        public ActionResult Index()
        {
            ViewBag.GalleryMasking = db.Gallery_Masking.First();
            ViewBag.Gallery = db.Gallery_Images.ToList();
            return View();
        }
    }
}