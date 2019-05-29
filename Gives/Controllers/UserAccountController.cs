using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;
using System.Web.Helpers;
using System.IO;


namespace Gives.Controllers
{
    public class UserAccountController : Controller
    {
        GivesEntities db = new GivesEntities();

        // GET: UserAccount
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(User newUser,string ConfirmPassword, HttpPostedFileBase Image)
        {
            if (newUser.Name != null && newUser.Surname != null && newUser.Email != null && newUser.Image != null && newUser.Password != null && ConfirmPassword != "")
            {
                if (!(db.Users.Any(us => us.Email == newUser.Email)))
                {
                    if (newUser.Password == ConfirmPassword)
                    {
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
                                    DateTime dt = DateTime.Now;
                                    var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                                    fileName = beforeStr + Path.GetFileName(Image.FileName);
                                    var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                                    Image.SaveAs(newFilePath);
                                    newUser.Image = fileName;
                                    newUser.Password = Crypto.HashPassword(newUser.Password);
                                    db.Users.Add(newUser);
                                    db.SaveChanges();
                                    return RedirectToAction("Login");
                                }
                                else
                                {
                                    ViewBag.RegisterError = "Image type is not valid.";
                                }
                            }
                            else
                            {
                                ViewBag.RegisterError = "Image type should not be more than 4 MB.";
                            }

                        }
                        else
                        {
                            ViewBag.RegisterError = "Please upload your image.";

                        }

                    }
                    else
                    {
                        ViewBag.RegisterError = "Password and Confirm password do not match !";
                    }

                }
                else
                {
                    ViewBag.RegisterError = "Email have been used.";
                }

            }
            else
            {
                ViewBag.RegisterError = "Please, fill all the fields.";
            }

            return View();
        }



        public ActionResult Login()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Login(string Email, string Password)
        {
            if (Email != "" && Password != "")
            {
                User activeUser = db.Users.FirstOrDefault(us => us.Email == Email);
                if (activeUser != null)
                {
                    if (activeUser.Email == Email && Crypto.VerifyHashedPassword(activeUser.Password, Password))
                    {
                        Session["UserLogged"] = activeUser;
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        ViewBag.UserLoginError = "Email or Password is wrong!";
                    }
                }
                else
                {
                    ViewBag.UserLoginError = "Email or Password is not correct.";
                }
            }
            else
            {
                ViewBag.UserLoginError = "Email or Password cannot be empty!";
            }
            return View();
        }

        public ActionResult Logout()
        {
            Session["UserLogged"] = null;
            return RedirectToAction("Login", "UserAccount");
        }


        [AuthorizationFilterController]
        public ActionResult Edit(int id)
        {
            ViewBag.activeUser = db.Users.Find(id);
            return View();
        }

        [HttpPost]
        public ActionResult Edit(int? id,User user, string ConfirmPassword, string CurrentPassword, HttpPostedFileBase Image)
        {
            ViewBag.activeUser = db.Users.Find(id);
            User activeUser = db.Users.Find(user.Id);
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
                        if (user.Name != null && user.Surname != null && user.Email != null)
                        {
                            if (user.Password != null)
                            {
                                if (user.Password == ConfirmPassword)
                                {
                                    if (Crypto.VerifyHashedPassword(activeUser.Password, CurrentPassword))
                                    {
                                        if (!(db.Users.Any(us => us.Email == user.Email && us.Email != activeUser.Email)))
                                        {
                                            var path = Path.Combine(Server.MapPath("~/Uploads/"), activeUser.Image);

                                            if (System.IO.File.Exists(path))
                                            {
                                                System.IO.File.Delete(path);
                                            }
                                            DateTime dt = DateTime.Now;
                                            var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                                            fileName = beforeStr + Path.GetFileName(Image.FileName);
                                            var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                                            Image.SaveAs(newFilePath);
                                            activeUser.Image = fileName;
                                            activeUser.Name = user.Name;
                                            activeUser.Surname = user.Surname;
                                            activeUser.Email = user.Email;
                                            activeUser.Password = Crypto.HashPassword(user.Password);
                                            db.SaveChanges();
                                            return RedirectToAction("Login");
                                        }
                                        else
                                        {
                                            ViewBag.UserEditError = "Email have been used!";
                                        }
                                           
                                    }
                                    else
                                    {
                                        ViewBag.UserEditError = "Current Password is wrong !";
                                    }
                                }
                                else
                                {
                                    ViewBag.UserEditError = "Password and Confirm password do not match.";
                                }
                            }
                            else
                            {
                                if (!(db.Users.Any(us => us.Email == user.Email && us.Email != activeUser.Email)))
                                {
                                    var path = Path.Combine(Server.MapPath("~/Uploads/"), activeUser.Image);

                                    if (System.IO.File.Exists(path))
                                    {
                                        System.IO.File.Delete(path);
                                    }
                                    DateTime dt = DateTime.Now;
                                    var beforeStr = dt.Year + "_" + dt.Month + "_" + dt.Day + "_" + dt.Hour + "_" + dt.Minute + "_" + dt.Second + "_" + dt.Millisecond;
                                    fileName = beforeStr + Path.GetFileName(Image.FileName);
                                    var newFilePath = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                                    Image.SaveAs(newFilePath);
                                    activeUser.Image = fileName;
                                    activeUser.Name = user.Name;
                                    activeUser.Surname = user.Surname;
                                    activeUser.Email = user.Email;
                                    db.SaveChanges();
                                    return RedirectToAction("Login");
                                }
                                else
                                {
                                    ViewBag.UserEditError = "Email have been used!";
                                }
                            }
                        }
                        else
                        {
                            ViewBag.UserEditError = "Any fields is empty.";
                        }
                    }
                    else
                    {
                        ViewBag.UserEditError = "Image type is not valid";
                    }
                }
                else
                {
                    ViewBag.UserEditError = "Image type should not be more than 4 MB.";
                }
            }
            else
            {
                if (user.Name != null && user.Surname != null && user.Email != null)
                {
                    if (user.Password != null)
                    {
                        if (user.Password == ConfirmPassword)
                        {
                            if (Crypto.VerifyHashedPassword(activeUser.Password, CurrentPassword))
                            {
                                if (!(db.Users.Any(us => us.Email == user.Email && us.Email != activeUser.Email)))
                                {
                                    activeUser.Name = user.Name;
                                    activeUser.Surname = user.Surname;
                                    activeUser.Email = user.Email;
                                    activeUser.Password = Crypto.HashPassword(user.Password);
                                    db.SaveChanges();
                                    return RedirectToAction("Login");
                                }
                                else
                                {
                                    ViewBag.UserEditError = "Email have been used!";
                                }
                                  
                            }
                            else
                            {
                                ViewBag.UserEditError = "Current Password is wrong !";
                            }
                        }
                        else
                        {
                            ViewBag.UserEditError = "Password and Confirm password do not match.";
                        }
                    }
                    else
                    {
                        if (!(db.Users.Any(us => us.Email == user.Email && us.Email != activeUser.Email)))
                        {
                            activeUser.Name = user.Name;
                            activeUser.Surname = user.Surname;
                            activeUser.Email = user.Email;
                            db.SaveChanges();
                            return RedirectToAction("Login");
                        }
                        else
                        {
                            ViewBag.UserEditError = "Email have been used!";
                        }
                    }
                }
                else
                {
                    ViewBag.UserEditError = "Any fields is empty.";
                }
            }
            return View(activeUser);
        }

    }
}
