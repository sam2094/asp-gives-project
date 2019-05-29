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

    public class AddPostController : Controller
    {
        private GivesEntities db = new GivesEntities();

        // GET: Admin/AddPost
        public ActionResult Index()
        {
            ViewBag.Post = db.Posts.Where(db => db.Status == 0).ToList();
            return View();
        }

        public ActionResult Create()
        {
            ViewBag.Tag = db.Tags.Where(tg => tg.Status == 0).ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Create(Post post, List<int> Tag, HttpPostedFileBase Image)
        {
            ViewBag.Tag = db.Tags.Where(tg => tg.Status == 0).ToList();
            Post_To_Tag PTT = new Post_To_Tag();
            if (post.Title != null && post.Content != null && post.Date != null && Tag != null && Image != null)
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
                        post.Image = fileName;
                        db.Posts.Add(post);
                        db.SaveChanges();
                        for (var i = 0; i < Tag.Count; i++)
                        {
                            PTT.Tag_Id = Tag[i];
                            PTT.Post_Id = post.Id;
                            db.Post_To_Tag.Add(PTT);
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
            ViewBag.activePost = db.Posts.Find(id);
            return View();
        }
        [HttpPost]
        public ActionResult Edit(int? id, Post post, HttpPostedFileBase Image)
        {
            ViewBag.activePost = db.Posts.Find(id);
            Post activePost = db.Posts.Find(post.Id);
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
                        if (post.Title != null && post.Content != null)
                        {
                            var path = Path.Combine(Server.MapPath("~/Uploads/"), activePost.Image);

                            if (System.IO.File.Exists(path))
                            {
                                System.IO.File.Delete(path);
                            }
                            DateTime dt = DateTime.Now;
                            var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                            fileName = beforeStr + Path.GetFileName(Image.FileName);
                            var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                            Image.SaveAs(newFilePath);
                            activePost.Image = fileName;
                            activePost.Title = post.Title;
                            activePost.Content = post.Content;
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
                if(post.Title != null && post.Content!=null)
                {
                    activePost.Title = post.Title;
                    activePost.Content = post.Content;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.Error = "Please,fill all the fields.";
                }
            }
                return View(activePost);
        }

        public ActionResult Delete(int? id)
        {
            ViewBag.activePost = db.Posts.Find(id);
            return View();
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            ViewBag.activePost = db.Posts.Find(id);
            Post activePost = db.Posts.Find(id);
            activePost.Status = 1;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}