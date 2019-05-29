using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;
using System.Web.Helpers;

namespace Gives.Areas.Admin.Controllers
{

    public class AdminAccountController : Controller
    {
        GivesEntities db = new GivesEntities();
        // GET: Admin/AdminAccount
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string Fullname, string Password)
        {
            if (Fullname != "" && Password != "")
            {
                Administrator ad = db.Administrators.Find(1);
                if (ad.Fullname == Fullname && Crypto.VerifyHashedPassword(ad.Password, Password))
                {
                    Session["AdminLogged"] = true;
                    return RedirectToAction("Index", "Admin");
                }
                else
                {
                    ViewBag.AdminLoginError = "Username or Password is wrong!";
                }
            }
            else
            {
                ViewBag.AdminLoginError = "Username or Password cannot be empty!";
            }
            return View();
        }

        public ActionResult Logout()
        {
            Session["AdminLogged"] = null;
            return RedirectToAction("Login", "AdminAccount");
        }

        [AuthorizationFilterController]

        public ActionResult Edit()
        {
            ViewBag.Admin = db.Administrators.Find(1);
            return View();
        }

        [HttpPost]
        public ActionResult Edit(Administrator administrator, string ConfirmPassword,string CurrentPassword)
        {
            ViewBag.Admin = db.Administrators.Find(1);
            Administrator activeAdmin = db.Administrators.Find(1);
           if(administrator.Password != null)
            {
                if(administrator.Password == ConfirmPassword)
                {
                    if(Crypto.VerifyHashedPassword(activeAdmin.Password, CurrentPassword))
                    {
                        if (administrator.Fullname != null)
                        {
                            activeAdmin.Password = Crypto.HashPassword(administrator.Password);
                            activeAdmin.Fullname = administrator.Fullname;
                            db.SaveChanges();
                            return RedirectToAction("Login");
                        }
                        else
                        {
                            ViewBag.Error = "Please fill User Name's field";
                        }
                    }
                    else
                    {
                        ViewBag.Error = "Current Password is wrong ";
                    }
                  
                   
                }
                else
                {
                    ViewBag.Error = "Password and Confirm password do not match";

                }
            }
            else
            {
                if (administrator.Fullname != null)
                {
                    activeAdmin.Fullname = administrator.Fullname;
                    db.SaveChanges();
                    return RedirectToAction("Login");
                }
                else
                {
                    ViewBag.Error = "Please fill User Name's field";
                }
            }
            return View();
        }
    }
}

