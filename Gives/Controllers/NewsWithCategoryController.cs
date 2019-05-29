using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;
using PagedList;

namespace Gives.Controllers
{
    public class NewsWithCategoryController : Controller
    {
        GivesEntities db = new GivesEntities();

        // GET: NewsWithCategory
        public ActionResult Index(int? id, int page = 1, int pageSize = 3)
        {
            Category activeCategory = db.Categories.Find(id);
           
            List<News_To_Category> listNews = db.News_To_Category.Where(db => db.News.Status == 0 && db.Category_Id == activeCategory.Id).OrderByDescending(db => db.News.Dates).ToList();
            PagedList<News_To_Category> model = new PagedList<News_To_Category>(listNews, page, pageSize);

            List<News> listNew = db.News.Where(db => db.Status == 0).ToList();
            List<int> commentCount = new List<int>();
            foreach (var item in listNew)
            {
                int num = db.CommentNews.Where(db => db.News_Id == item.Id).Count();
                commentCount.Add(num);
            }
            ViewBag.CommentCount = commentCount;

            ViewBag.BlogListMasking = db.Blog_List_Masking.First();
            ViewBag.Author = db.Administrators.First();

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
            return View(model);
        }
    }
}