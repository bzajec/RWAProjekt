using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AplikacijaZaEvidencijuSati.Models
{
    public class UserPassword
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Enter your Email")]
        [EmailAddress(ErrorMessage = "Invalid Email")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Please Enter Your Password")]
        [DataType(DataType.Password)]
        [StringLength(18, ErrorMessage = "The password must be atleast 3 characters long", MinimumLength = 3)]
        public string Password { get; set; }

        [Required(ErrorMessage = "Please Enter Your Password")]
        [DataType(DataType.Password)]
        [StringLength(18, ErrorMessage = "The password must be atleast 3 characters long", MinimumLength = 3)]
        public string NewPassword { get; set; }
    }
}