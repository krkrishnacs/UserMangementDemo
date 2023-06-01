using System;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EuphoriaInfotech.Models
{
    public class StudentDetails
    {
        public int Id { get; set; }
        public string StudentName { get; set; }
        public string SchoolName { get; set; }
        public string Degree { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string FatherName { get; set; }
        public string MotherName { get; set; }
        public string StudentAddress { get; set; }
        public string Gender { get; set; }
        public string StudentEmail { get; set; }
        public string StudentPhoneNo { get; set;}
        public string ParentsPhoneNo { get; set; }
        public string Photo { get; set; }
      
    }
}