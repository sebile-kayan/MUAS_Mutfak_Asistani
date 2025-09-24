using System.ComponentModel.DataAnnotations;

namespace Buzdolabibackend.DTOs
{
	public class RegisterDTO
	{
		[Required(ErrorMessage = "Ad zorunludur")]
		[MaxLength(50, ErrorMessage = "Ad en fazla 50 karakter olabilir")]
		public string Ad { get; set; }

		[Required(ErrorMessage = "Email zorunludur")]
		[EmailAddress(ErrorMessage = "Geçerli bir email giriniz")]
		public string Email { get; set; }

		[Required(ErrorMessage = "Şifre zorunludur")]
		[MinLength(6, ErrorMessage = "Şifre en az 6 karakter olmalıdır")]
		public string Password { get; set; }
	}

}
