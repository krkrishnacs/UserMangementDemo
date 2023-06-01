using EuphoriaInfotech.Models;
using EuphoriaInfotech.ViewModels;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EuphoriaInfotech.Repository
{
    public class StudentDetailRepo
    {
        private SqlConnection con;
        private void connection()
        {
            string constr = ConfigurationManager.ConnectionStrings["EuphoriaDB"].ToString();
            con = new SqlConnection(constr);
        }
        public bool AddStudent(StudentDetailsVM studentDetailsVM)
        {
            connection();
            SqlCommand com = new SqlCommand("sp_AddStudentData", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@StudentName", studentDetailsVM.StudentName);
            com.Parameters.AddWithValue("@SchoolName",  studentDetailsVM.SchoolName);
            com.Parameters.AddWithValue("@Degree", studentDetailsVM.Degree);
            com.Parameters.AddWithValue("@DateOfBirth", studentDetailsVM.DateOfBirth);
            com.Parameters.AddWithValue("@FatherName", studentDetailsVM.FatherName);
            com.Parameters.AddWithValue("@MotherName", studentDetailsVM.MotherName);
            com.Parameters.AddWithValue("@StudentAddress", studentDetailsVM.StudentAddress);
            com.Parameters.AddWithValue("@Gender", studentDetailsVM.Gender);
            com.Parameters.AddWithValue("@StudentEmail", studentDetailsVM.StudentEmail);
            com.Parameters.AddWithValue("@StudentPhoneNo", studentDetailsVM.StudentPhoneNo);
            com.Parameters.AddWithValue("@ParentsPhoneNo", studentDetailsVM.ParentsPhoneNo);
            com.Parameters.AddWithValue("@Photo", studentDetailsVM.Photo);
            //com.Parameters.AddWithValue("@UserName", studentDetailsVM);
            //com.Parameters.AddWithValue("@Password", studentDetailsVM.DateOfBirth);
            //com.Parameters.AddWithValue("@RoleName", studentDetailsVM.FatherName);
            con.Open();
            int i = com.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}