namespace IdentitySample.Models
{
    using System.ComponentModel.DataAnnotations;

    public partial class UserType
    {
       
        public int UserTypeId { get; set; }

        [Required]
        [StringLength(50)]
        public string UserTypeName { get; set; }
    }
}