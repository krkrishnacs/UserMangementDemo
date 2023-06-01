using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace EuphoriaInfotech.ViewModels
{
    public class StudentDetailsVM
    {
        public int Id { get; set; }

        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Please Enter  Student Name"), MaxLength(30)]
        [Display(Name = "Student Name")]
        public string StudentName { get; set; }

        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Please Enter  School Name"), MaxLength(30)]
        [Display(Name = "School Name")]
        public string SchoolName { get; set; }
        [Required (ErrorMessage = "Degree is Required !")]
        public string Degree { get; set; }

        [DataType(DataType.Date)]
        [Required(ErrorMessage = "DateOfBirth is Required !")]
        public DateTime DateOfBirth { get; set; }


        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Please Enter  Father Name"), MaxLength(10)]
        [Display(Name = "Father Name")]
        public string FatherName { get; set; }



        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Please Enter  Mother Name"), MaxLength(10)]
        [Display(Name = "Mother Name")]

        public string MotherName { get; set; }

        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Please Enter  Student Address"), MaxLength(50)]
        [Display(Name = "Student Address")]

        public string StudentAddress { get; set; }

        [Required(ErrorMessage ="Gender Is Required")]
        public string Gender { get; set; }


        [DataType(DataType.EmailAddress)]
        [Required(ErrorMessage = "Email id is required")]
        //[RegularExpression(@"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", ErrorMessage = "Please enter a valid email address")]
        public string StudentEmail { get; set; }


        [Required(ErrorMessage = "Please Enter StudentPhoneNo")]
        [Display(Name = "Student PhoneNo")]
        [DataType(DataType.PhoneNumber)]
        public string StudentPhoneNo { get; set; }


        [Required(ErrorMessage = "Please Enter StudentPhoneNo")]
        [Display(Name = "Student PhoneNo")]
        [DataType(DataType.PhoneNumber)]
        public string ParentsPhoneNo { get; set; }

        public string Photo { get; set; }

    }

    
}