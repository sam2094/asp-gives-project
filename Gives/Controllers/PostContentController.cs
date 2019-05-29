using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;


namespace Gives.Controllers
{
    public class PostContentController : Controller
    {
        GivesEntities db = new GivesEntities();

        // GET: PostContent
        public ActionResult Index(int? id)
        {
            ViewBag.ActivePost = db.Posts.Find(id);
            Post activePost = db.Posts.Find(id);
            ViewBag.Comments = db.CommentPosts.Where(db => db.Post_Id == activePost.Id).OrderByDescending(db => db.Dates).ToList();
            ViewBag.Author = db.Administrators.First();
            ViewBag.BlogSingleMasking = db.Blog_Single_Masking.First();
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
            ViewBag.CommentCount = db.CommentPosts.Where(db => db.Post_Id == activePost.Id).Count();
            if (activePost != null)
            {
                return View(activePost);
            }
            else
            {
                return Content("There is no News with this Id");
            }
        }

        [HttpPost]
        public ActionResult Index(CommentPost newComment, int? id)
        {
            ViewBag.ActivePost = db.Posts.Find(id);
            User activeUser = (User)Session["UserLogged"];
            Post activePost = db.Posts.Find(id);
            ViewBag.Comments = db.CommentPosts.Where(db => db.Post_Id == activePost.Id).OrderByDescending(db => db.Dates).ToList();
            if (newComment.Content != null)
            {
                newComment.Users_Id = activeUser.Id;
                newComment.Post_Id = activePost.Id;
                newComment.Dates = DateTime.Now;
                db.CommentPosts.Add(newComment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.Error = "Comment cannot be empty !";
            }
            ViewBag.Comments = db.CommentPosts.Where(db => db.Post_Id == activePost.Id).OrderByDescending(db => db.Dates).ToList();
            ViewBag.Author = db.Administrators.First();
            ViewBag.BlogSingleMasking = db.Blog_Single_Masking.First();
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
            ViewBag.CommentCount = db.CommentPosts.Where(db => db.Post_Id == activePost.Id).Count();
            if (activePost != null)
            {
                return View(activePost);
            }
            else
            {
                return Content("There is no News with this Id");
            }
        }
    }
}