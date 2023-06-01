using EuphoriaInfotech.Models;
using EuphoriaInfotech.Repository;
using EuphoriaInfotech.ViewModels;
using OpenXmlPowerTools;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;

namespace EuphoriaInfotech.Controllers
{
    public class StudentDeatilController : Controller
    {
        // GET: StudentDeatil
        [HttpGet]
        public ActionResult StudentDeatil()
        {
            return View();
        }


        [HttpPost]
        public ActionResult StudentDeatil(StudentDetailsVM studentDetailsVM, HttpPostedFileBase Photo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    StudentDetailRepo studentDetailRepo = new StudentDetailRepo();
                    string fileName = string.Empty;
                    if (Photo != null && Photo.ContentLength > 0)
                    {
                        fileName = Path.GetFileName(Photo.FileName);
                        studentDetailsVM.Photo = fileName;
                    }

                    if (studentDetailRepo.AddStudent(studentDetailsVM))
                    {
                        if (Photo != null && Photo.ContentLength > 0)
                        {
                            studentDetailsVM.Photo = fileName;
                            string path = Server.MapPath("~/Uploads/" + Photo);
                            string fullpath = Path.Combine(fileName, path);
                            Photo.SaveAs(fullpath);
                            //var fileName = Path.GetFileName(Photo.FileName);
                            //var path = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                            //Photo.SaveAs(path);
                            //studentDetailsVM.Photo = fileName;
                            //studentDetailRepo.AddStudent(studentDetailsVM);
                            if (studentDetailRepo != null)
                            {
                                return RedirectToAction(nameof(StudentAllRecod));
                            }
                        }


                        ViewBag.Message = " Student Recod  Added successfully";
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
        public ActionResult StudentAllRecod()
        {

            DataTable dt = new DataTable();
            string SqlCon = ConfigurationManager.ConnectionStrings["EuphoriaDB"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(SqlCon))
            {
                using (SqlCommand cmd = new SqlCommand($"select * from StudenDetails"))
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

    }
}