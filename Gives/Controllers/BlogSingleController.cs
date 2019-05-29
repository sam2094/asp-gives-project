using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;
using PagedList;



namespace Gives.Controllers
{
    public class BlogSingleController : Controller
    {
        GivesEntities db = new GivesEntities();

        // GET: BlogSingle
        public ActionResult Index(int page = 1, int pageSize = 3)
        {
            ViewBag.BlogSingleMasking = db.Blog_Single_Masking.First();
            ViewBag.Author = db.Administrators.First();
            List<Post> postList = db.Posts.Where(db => db.Status == 0).OrderByDescending(db => db.Date).ToList();
            PagedList<Post> model = new PagedList<Post>(postList ,page, pageSize);

            List<int> commentCount = new List<int>();
            foreach (var item in postList)
            {
                int num = db.CommentPosts.Where(db => db.Post_Id == item.Id).Count();
                commentCount.Add(num);
            }
            ViewBag.CommentCount = commentCount;
            ViewBag.News = db.News.Where(db => db.Status == 0).ToList();
            ViewBag.Category = db.Categories.Where(db => db.Status == 0).ToList();
            ViewBag.Post = db.Posts.Where(db => db.Status == 0).Take(3).OrderByDescending(db => db.Date).ToList();
            ViewBag.Tag = db.Tags.Where(db => db.Status == 0).ToList();
            List<Category> ctg = db.Categories.Where(db => db.Status == 0).ToList();
            List<int> newsCount = new List<int>();
            foreach (var item in ctg)
            {
                var sum = db.News_To_Category.Where(db => db.Category_Id == item.Id).Count();
                newsCount.Add(sum);
            }
            ViewBag.NewsCount = newsCount;
            return View(model);
        }
    }
}