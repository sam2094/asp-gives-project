using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;
using PagedList;

namespace Gives.Controllers
{
    public class HomeController : Controller
    {
        GivesEntities db = new GivesEntities();
        public ActionResult Index()
        {
            ViewBag.HomeSlider = db.Home_Slider.ToList();
            ViewBag.HomeCause = db.Home_Cause.First();
            ViewBag.HomeRecent = db.Home_Recent.Where(db => db.Status3 == 0).ToList();
            ViewBag.HomeWork = db.Home_Work_Us.First();
            ViewBag.HomeVolunteer = db.Home_Volunteer.Where(db=> db.Status3==0).ToList();
            ViewBag.Need = db.Home_Need.First();
            ViewBag.Gallery = db.Home_Gallery.ToList();
            ViewBag.Feature = db.Features.ToList();
            ViewBag.News = db.News.Where(db => db.Status == 0).OrderByDescending(db => db.Dates).Take(3).ToList();
            ViewBag.Author = db.Administrators.First();

            List<News> listNews = db.News.Where(db => db.Status == 0).OrderByDescending(db => db.Dates).Take(3).ToList();
            List<int> commentCount = new List<int>();
            foreach (var item in listNews)
            {
                int num = db.CommentNews.Where(db => db.News_Id == item.Id).Count();
                commentCount.Add(num);
            }
            ViewBag.CommentCount = commentCount;
            return View();
        }
    }
}

