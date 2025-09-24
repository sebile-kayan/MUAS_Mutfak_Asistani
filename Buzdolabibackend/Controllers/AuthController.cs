using Buzdolabibackend.Data;
using Buzdolabibackend.DTOs;
using Buzdolabibackend.Models;
using Buzdolabibackend.Services;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Security.Cryptography;

namespace Buzdolabibackend.Controllers
{
	[Route("api/auth")]
	[ApiController]
	public class AuthController : ControllerBase
	{
		private readonly AppDbContext _context;
		private readonly AuthService _authService;

		public AuthController(AppDbContext context, AuthService authService)
		{
			_context = context;
			_authService = authService;
		}

		//[HttpPost("register")]
		//public IActionResult Register([FromBody] RegisterDTO dto)
		//{
		//	var salt = Convert.ToBase64String(RandomNumberGenerator.GetBytes(16));
		//	var hashedPassword = _authService.ComputeSha256Hash(dto.Password, salt);
		[HttpPost("register")] //email benzersizliği kontrolü yapıyor.
		public IActionResult Register([FromBody] RegisterDTO dto)
		{
			// Email benzersizlik kontrolü
			var existingUser = _context.Users.FirstOrDefault(u => u.Email == dto.Email);
			if (existingUser != null)
			{
				return BadRequest(new { message = "Bu email adresi zaten kayıtlı" });
			}

			var salt = Convert.ToBase64String(RandomNumberGenerator.GetBytes(16));
			var hashedPassword = _authService.ComputeSha256Hash(dto.Password, salt);

			var user = new User
			{
				Ad = dto.Ad,
				Email = dto.Email,
				PasswordHash = hashedPassword,
				Salt = salt
			};

			_context.Users.Add(user);
			_context.SaveChanges();

			return Ok(new { message = "Kayıt başarılı", userId = user.Id });
		}

		[HttpPost("login")]
		public IActionResult Login([FromBody] LoginDTO dto)
		{
			var user = _context.Users.FirstOrDefault(u => u.Email == dto.Email);
			if (user == null)
				return Unauthorized(new { message = "Email bulunamadı" });

			var isValid = _authService.VerifyPassword(dto.Password, user.PasswordHash, user.Salt);
			if (!isValid)
				return Unauthorized(new { message = "Şifre hatalı" });

			// Token yerine direkt userId ve kullanıcı bilgilerini dönüyoruz
			return Ok(new
			{
				userId = user.Id,
				name = user.Ad,
				email = user.Email
			});
		}
	}
}
