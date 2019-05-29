using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;
using PagedList;



namespace Gives.Controllers
{
    public class BlogListController : Controller
    {
        GivesEntities db = new GivesEntities();

        // GET: BlogList
        public ActionResult Index(int page = 1, int pageSize = 3)
        {
            ViewBag.BlogListMasking = db.Blog_List_Masking.First();
            ViewBag.Author = db.Administrators.First();
            List<News> listNews = db.News.Where(db => db.Status == 0).OrderByDescending(db => db.Dates).ToList();
            PagedList<News> model = new PagedList<News>(listNews, page, pageSize);


            List<int> commentCount = new List<int>();
            foreach(var item in listNews)
            {
                 int num = db.CommentNews.Where(db => db.News_Id == item.Id).Count();
                commentCount.Add(num);
            }
            ViewBag.CommentCount = commentCount;


            ViewBag.Category = db.Categories.Where(db => db.Status == 0).ToList();
            ViewBag.Post = db.Posts.Where(db=> db.Status==0).OrderByDescending(db => db.Date).Take(3).ToList();
            ViewBag.Tag = db.Tags.Where(db => db.Status == 0).ToList();

            List<Category> ctg = db.Categories.Where(db => db.Status == 0).ToList();
            List<int> newsCount = new List<int>();
            foreach(var item in ctg)
            {
                var sum = db.News_To_Category.Where(db => db.Category_Id == item.Id).Count();
                newsCount.Add(sum);
            }
            ViewBag.NewsCount = newsCount;
            return View(model);
        }
    }
}

