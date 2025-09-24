using BCrypt.Net;
using Buzdolabibackend.Data;
using Buzdolabibackend.DTOs;
using Buzdolabibackend.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;


namespace Buzdolabibackend.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class UsersController : ControllerBase
	{
		private readonly AppDbContext _context;
		private readonly AuthService _authService;

		public UsersController(AppDbContext context, AuthService authService)
		{
			_context = context;
			_authService = authService;
		}

		// GET api/users/1
		[HttpGet("{id:int}")]
		public async Task<IActionResult> GetUser(int id)
		{
			var user = await _context.Users.AsNoTracking().FirstOrDefaultAsync(u => u.Id == id);
			return user == null ? NotFound("Kullanıcı Bulunamadı!") : Ok(user);
		}

		// PUT api/users/1
		[HttpPut("{id:int}")]
		public async Task<IActionResult> UpdateUser(int id, [FromBody] UpdateUserDto dto)
		{
			var user = await _context.Users.FindAsync(id);
			if (user == null) return NotFound("Kullanıcı Bulunamadı!");

			if (!string.IsNullOrWhiteSpace(dto.Ad)) user.Ad = dto.Ad.Trim();
			if (!string.IsNullOrWhiteSpace(dto.Email)) user.Email = dto.Email.Trim();

			await _context.SaveChangesAsync();
			return Ok(new { message = "Güncellendi!", user.Ad, user.Email });
		}

		// POST api/users/1/change-password
		[HttpPost("{id:int}/change-password")]
		public async Task<IActionResult> ChangePassword(int id, [FromBody] ChangePasswordDto dto)
		{
			var user = await _context.Users.FindAsync(id);
			if (user == null) return NotFound("Kullanıcı Bulunamadı!");

			if (string.IsNullOrEmpty(dto.OldPassword) || string.IsNullOrEmpty(dto.NewPassword))
				return BadRequest(new { message = "Şifreler boş olamaz!" });

			// SHA256 + salt ile eski şifreyi doğrula
			bool oldPasswordMatches = _authService.VerifyPassword(dto.OldPassword, user.PasswordHash, user.Salt);

			if (!oldPasswordMatches)
				return BadRequest(new { message = "Eski şifre yanlış!" });

			if (dto.OldPassword == dto.NewPassword)
				return BadRequest(new { message = "Yeni şifre eski şifre ile aynı olamaz!" });

			// Yeni şifreyi hashle ve kaydet
			user.PasswordHash = _authService.ComputeSha256Hash(dto.NewPassword, user.Salt);
			await _context.SaveChangesAsync();

			return Ok(new { message = "Şifre güvenli bir şekilde güncellendi!" });
		}

		// GET api/users/test
		[HttpGet("test")]
		public async Task<IActionResult> TestConnection()
		{
			try
			{
				var user = await _context.Users.AsNoTracking().FirstOrDefaultAsync();
				if (user != null)
					return Ok(new { message = "DB ve EF Core uyumlu!", user.Id, user.Ad, user.Email });
				else
					return Ok(new { message = "DB boş ama connection başarılı!" });
			}
			catch (Exception ex)
			{
				return StatusCode(500, new { message = "Hata: " + ex.Message });
			}
		}
	}
}