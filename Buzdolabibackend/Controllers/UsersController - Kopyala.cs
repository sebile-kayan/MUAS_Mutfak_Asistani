using Buzdolabibackend.Data;
using Buzdolabibackend.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BCrypt.Net;

namespace BuzdolabiBackend.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class UsersController : ControllerBase
	{
		private readonly AppDbContext _context;
		public UsersController(AppDbContext context) => _context = context;

		// GET api/users/1
		[HttpGet("{id:int}")]
		public async Task<IActionResult> GetUser(int id)
		{
			var user = await _context.Users.AsNoTracking().FirstOrDefaultAsync(u => u.Id == id);
			return user is null ? NotFound("Kullanıcı Bulunamadı!") : Ok(user);
		}

		// PUT api/users/1
		[HttpPut("{id:int}")]
		public async Task<IActionResult> UpdateUser(int id, [FromBody] UpdateUserDto dto)
		{
			var user = await _context.Users.FindAsync(id);
			if (user is null) return NotFound("Kullanıcı Bulunamadı!");

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
			if (user is null) return NotFound("Kullanıcı Bulunamadı!");

			if (string.IsNullOrEmpty(dto.OldPassword) || string.IsNullOrEmpty(dto.NewPassword))
				return BadRequest(new { message = "Şifreler boş olamaz!" });

			bool oldPasswordMatches;

			// Şifre hash’li mi kontrol et (BCrypt hash formatı $2a$, $2b$ veya $2y$ ile başlar)
			if (user.PasswordHash.StartsWith("$2a$") || user.PasswordHash.StartsWith("$2b$") || user.PasswordHash.StartsWith("$2y$"))
			{
				oldPasswordMatches = BCrypt.Net.BCrypt.Verify(dto.OldPassword, user.PasswordHash);
			}
			else
			{
				// Düz metin şifre ise direkt karşılaştır
				oldPasswordMatches = dto.OldPassword == user.PasswordHash;
			}

			if (!oldPasswordMatches)
				return BadRequest(new { message = "Eski şifre yanlış!" });

			//  Yeni şifre eskiyle aynı mı kontrol et
			if (dto.OldPassword == dto.NewPassword)
				return BadRequest(new { message = "Yeni şifre eski şifre ile aynı olamaz!" });

			// Yeni şifreyi hash’le ve kaydet
			user.PasswordHash = BCrypt.Net.BCrypt.HashPassword(dto.NewPassword);
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
