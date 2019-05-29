using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;
using PagedList;

namespace Gives.Controllers
{
    public class PostToTagController : Controller
    {
        GivesEntities db = new GivesEntities();

        // GET: PostToTag
        public ActionResult Index(int? id, int page = 1, int pageSize = 3)
        {
            ViewBag.BlogSingleMasking = db.Blog_Single_Masking.First();
            ViewBag.Author = db.Administrators.First();

            Tag activeTag = db.Tags.Find(id);
            List<Post_To_Tag> postList = db.Post_To_Tag.Where(db => db.Post.Status == 0 && db.Tag_Id == activeTag.Id).OrderByDescending(db => db.Post.Date).ToList();
            PagedList<Post_To_Tag> model = new PagedList<Post_To_Tag>(postList, page, pageSize);

            List<Post> postLists = db.Posts.Where(db => db.Status == 0).OrderByDescending(db => db.Date).ToList();

            List<int> commentCount = new List<int>();
            foreach (var item in postLists)
            {
                int num = db.CommentPosts.Where(db => db.Post_Id == item.Id).Count();
                commentCount.Add(num);
            }
            ViewBag.CommentCount = commentCount;

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