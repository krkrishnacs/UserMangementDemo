using EuphoriaInfotech.Models;
using EuphoriaInfotech.Repository;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
namespace EuphoriaInfotech.Controllers
{
    public class AccountController : Controller
    {
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(UserRegistration userRegistration)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    AccountRepo accountRepo = new AccountRepo();

                    if (accountRepo.UserRegister(userRegistration))
                    {
                        ViewBag.Message = "Register successfully";
                        ModelState.Clear();
                    }
                }
                return View();
            }
            catch
            {
                return View();
            }
        }

        [HttpGet]
        public ActionResult Login()
        {
            if (Session["LoggedInUserName"] == null)
                return View();
            else
                return RedirectToAction(nameof(AccountDetail));
        }
        [HttpGet]
        public ActionResult Logout()
        {
            Session["LoggedInUserName"] = null;
            Session.Clear();
            return RedirectToAction(nameof(Login));
        }
        //[CustomAuthenticationFilter]

        [HttpPost]
        public ActionResult Login(UserLogin userLogin)
        {
            string SqlCon = ConfigurationManager.ConnectionStrings["EuphoriaDB"].ConnectionString;
            SqlConnection con = new SqlConnection(SqlCon);
            string SqlQuery = "select UserName,Password from UserRegister where UserName=@UserName and Password=@Password";
            con.Open();
            SqlCommand cmd = new SqlCommand(SqlQuery, con);
            cmd.Parameters.AddWithValue("@UserName", userLogin.UserName);
            cmd.Parameters.AddWithValue("@Password", userLogin.Password);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                Session["Id"] = Guid.NewGuid();
                Session["LoggedInUserName"] = userLogin.UserName.ToString();
                return RedirectToAction(nameof(AccountDetail));

            }
            else
            {
                ViewData["Message"] = "Login Failed, Username OR Password incorrect!!";
                ModelState.Clear();
            }
            con.Close();
            return View();
        }


        //[CustomAuthenticationFilter]
        [HttpGet]
        public ActionResult AccountDetail()
        {
            if (Session["LoggedInUserName"] != null)
            {
                DataTable dt = new DataTable();
                string SqlCon = ConfigurationManager.ConnectionStrings["EuphoriaDB"].ConnectionString;
                using (SqlConnection cn = new SqlConnection(SqlCon))
                {
                    using (SqlCommand cmd = new SqlCommand($"select Name,Address,UserName from UserRegister where UserName='{Session["LoggedInUserName"]}'"))
                    {
                        cmd.Connection = cn;
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt);
                        }
                    }
                }
                return View(dt);
            }
            return RedirectToAction(nameof(Login));
        }



        [HttpGet]
        public ActionResult AccountAllDetail( UserRegistration userRegistration)
        {
            if (userRegistration != null)
            {
                DataTable dt = new DataTable();
                string SqlCon = ConfigurationManager.ConnectionStrings["EuphoriaDB"].ConnectionString;
                using (SqlConnection cn = new SqlConnection(SqlCon))
                {
                    using (SqlCommand cmd = new SqlCommand($"select * from UserRegister"))
                    {
                        cmd.Connection = cn;
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt);
                        }
                    }
                }
                return View(dt);
            }
            return RedirectToAction(nameof(Login));
        }
        [HttpGet]
        public ActionResult GetAllDetails()
        {

            AccountRepo accountRepo = new AccountRepo();
            ModelState.Clear();
            return View(accountRepo.GetAllData());
        }


    }
}


