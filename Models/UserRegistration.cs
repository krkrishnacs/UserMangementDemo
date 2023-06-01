using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EuphoriaInfotech.Models
{
    public class UserRegistration
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        public string UserName { get; set; }
        [Required]
        public string  Password { get; set; }
       
        [Required]
        public Role RoleName { get; set; }

    }
    public enum Role
    {
        User,
        Admin
    }
}