using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;
using System.IO;
using System.Globalization;


namespace Gives.Areas.Admin.Controllers
{
    [AuthorizationFilterController]


    public class AddNewsController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/AddNews
        public ActionResult Index()
        {
            ViewBag.News = db.News.Where(db => db.Status == 0).ToList();
            return View();
        }

        public ActionResult Create()
        {
            ViewBag.Category = db.Categories.Where(ct=>ct.Status==0).ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Create(News news, List<int> Category, HttpPostedFileBase Image)
        {
            ViewBag.Category = db.Categories.Where(ct => ct.Status == 0).ToList();
            News_To_Category NTC = new News_To_Category();
            Category newCategory = new Category();
            if (news.Title != null && news.Content != null && news.First_Content != null && news.Second_Content != null && news.States != null && news.Dates != null && Image != null && Category != null)
            {
                string fileName = null;
                if (Image.ContentLength > 0 && Image.ContentLength <= 4 * 1024 * 1024) {
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
                        news.Image = fileName;
                        db.News.Add(news);
                        db.SaveChanges();
                        for (var i = 0; i < Category.Count; i++)
                        {
                            NTC.Category_Id = Category[i];
                            NTC.News_Id = news.Id;
                            db.News_To_Category.Add(NTC);
                            db.SaveChanges();
                        }
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ViewBag.Error = "Image type is not valid.";
                    }
                }
                else
                {
                    ViewBag.Error = "Image type should not be more than 4 MB.";
                }
            }
            else
            {
                ViewBag.Error = "Please,fill all the fields.";
            }
            return View();
        }

        public ActionResult Edit(int? id)
        {
            ViewBag.activeNews = db.News.Find(id);
            return View();
        }

        [HttpPost]
        public ActionResult Edit(int? id, News news, HttpPostedFileBase Image)
        {
            ViewBag.activeNews = db.News.Find(id);
            News activeNews = db.News.Find(news.Id);
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
                        if (news.Title != null && news.Content != null && news.First_Content != null && news.Second_Content != null && news.States != null)
                        {
                            var path = Path.Combine(Server.MapPath("~/Uploads/"), activeNews.Image);

                            if (System.IO.File.Exists(path))
                            {
                                System.IO.File.Delete(path);
                            }
                            DateTime dt = DateTime.Now;
                            var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                            fileName = beforeStr + Path.GetFileName(Image.FileName);
                            var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                            Image.SaveAs(newFilePath);
                            activeNews.Image = fileName;
                            activeNews.Title = news.Title;
                            activeNews.Content = news.Content;
                            activeNews.First_Content = news.First_Content;
                            activeNews.Second_Content = news.Second_Content;
                            activeNews.States = news.States;
                            db.SaveChanges();
                            return RedirectToAction("Index");
                        }
                        else
                        {
                            ViewBag.Error = "Please,fill all the fields.";
                        }
                    }
                    else
                    {
                        ViewBag.Error = "Image type is not valid.";
                    }
                }
                else
                {
                    ViewBag.Error = "Image type should not be more than 4 MB.";
                }
            }
            else
            {
                if (news.Title != null && news.Content != null && news.First_Content != null && news.Second_Content != null && news.States != null)
                {
                    activeNews.Title = news.Title;
                    activeNews.Content = news.Content;
                    activeNews.First_Content = news.First_Content;
                    activeNews.Second_Content = news.Second_Content;
                    activeNews.States = news.States;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.Error = "Please,fill all the fields.";
                }
            }

            return View(activeNews);
        }
        public ActionResult Delete(int? id)
        {
            ViewBag.activeNews = db.News.Find(id);
            return View();
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            ViewBag.activeNews = db.News.Find(id);
            News activeNews = db.News.Find(id);
            activeNews.Status = 1;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }

}