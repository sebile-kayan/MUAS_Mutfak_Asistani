using System.ComponentModel.DataAnnotations;

namespace Buzdolabibackend.DTOs
{
	public class LoginDTO
	{
		[Required(ErrorMessage = "Email zorunludur")]
		[EmailAddress(ErrorMessage = "Geçerli bir email giriniz")]
		public string Email { get; set; }

		[Required(ErrorMessage = "Şifre zorunludur")]
		[MinLength(6, ErrorMessage = "Şifre en az 6 karakter olmalıdır")]
		public string Password { get; set; }
	}

}
