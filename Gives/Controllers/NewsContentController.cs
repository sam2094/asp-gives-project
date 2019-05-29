using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;
using PagedList;


namespace Gives.Controllers
{
    public class NewsContentController : Controller
    {
        GivesEntities db = new GivesEntities();

        public ActionResult Index(int? id)
        {
            ViewBag.ActiveNews = db.News.Find(id);
            News activeNews = db.News.Find(id);
            ViewBag.Comments = db.CommentNews.Where(db => db.News_Id == activeNews.Id).OrderByDescending(db=>db.Dates).ToList();
            ViewBag.Author = db.Administrators.First();
            ViewBag.BlogSingleMasking = db.Blog_List_Masking.First();
            ViewBag.Category = db.Categories.Where(db => db.Status == 0).ToList();
            ViewBag.Post = db.Posts.Where(db => db.Status == 0).OrderByDescending(db => db.Date).Take(3).ToList();
            ViewBag.Tag = db.Tags.Where(db => db.Status == 0).ToList();
            List<Category> ctg = db.Categories.Where(db => db.Status == 0).ToList();
            List<int> newsCount = new List<int>();
            foreach (var item in ctg)
            {
                var sum = db.News_To_Category.Where(db => db.Category_Id == item.Id).Count();
                newsCount.Add(sum);
            }
            ViewBag.NewsCount = newsCount;
            ViewBag.CommentCount = db.CommentNews.Where(db => db.News_Id == activeNews.Id).Count();
            if (activeNews != null)
            {
                return View(activeNews);
            }
            else
            {
                return Content("There is no News with this Id");
            }
        }

        [HttpPost]
        public ActionResult Index(CommentNew newComment,int? id)
        {
            User activeUser = (User)Session["UserLogged"];
            News activeNews = db.News.Find(id);
            ViewBag.Comments = db.CommentNews.Where(db => db.News_Id == activeNews.Id).ToList();
            if (newComment.Content != null)
            {
                newComment.Users_Id = activeUser.Id;
                newComment.News_Id = activeNews.Id;
                newComment.Dates = DateTime.Now;
                db.CommentNews.Add(newComment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.Error = "Comment cannot be empty !";
            }
            ViewBag.CommentCount = db.CommentNews.Where(db => db.News_Id == activeNews.Id).Count();
            ViewBag.Author = db.Administrators.First();
            ViewBag.BlogSingleMasking = db.Blog_Single_Masking.First();
            ViewBag.Category = db.Categories.Where(db => db.Status == 0).ToList();
            ViewBag.Post = db.Posts.Where(db => db.Status == 0).Take(3).ToList();
            ViewBag.Tag = db.Tags.Where(db => db.Status == 0).ToList();
            List<Category> ctg = db.Categories.Where(db => db.Status == 0).ToList();
            List<int> newsCount = new List<int>();
            foreach (var item in ctg)
            {
                var sum = db.News_To_Category.Where(db => db.Category_Id == item.Id).Count();
                newsCount.Add(sum);
            }
            ViewBag.NewsCount = newsCount;
            ViewBag.ActiveNews = db.News.Find(id);
            
            if (activeNews != null)
            {
                return View(activeNews);
            }
            else
            {
                return Content("There is no News with this Id");
            }

        }
    }
}