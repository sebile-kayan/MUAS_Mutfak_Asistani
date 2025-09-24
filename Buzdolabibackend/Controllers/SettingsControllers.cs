using Buzdolabibackend.Data;
using Buzdolabibackend.Models;
using Buzdolabibackend.DTOs;
using Microsoft.AspNetCore.Mvc;
using System.Linq;


[Route("api/[controller]")]
//https://localhost:7214/api/settings  flutterda controller adıyla çağırıcaz.
[ApiController] 
public class SettingsController : ControllerBase
{
	private readonly AppDbContext _context;

	public SettingsController(AppDbContext context)
	{
		_context = context;
	}

	// GET: api/settings/5
	[HttpGet("{userId}")]
	public IActionResult GetSettings(int userId)
	{
		if (userId <= 0)
			return BadRequest("Geçersiz UserId");

		var settings = _context.UserSettings.FirstOrDefault(s => s.UserId == userId);

		if (settings == null)
		{
			// Eğer ayar yoksa varsayılan oluştur
			settings = new UserSettings
			{
				UserId = userId,
				IsDarkMode = false,
				NotificationsEnabled = true
			};
			_context.UserSettings.Add(settings);
			_context.SaveChanges();
		}

		return Ok(settings);
	}

	// POST: api/settings
	[HttpPost]
	public IActionResult SaveSettings([FromBody] UserSettingsDto dto)
	{
		if (!_context.Users.Any(u => u.Id == dto.UserId))
		{
			return BadRequest("UserId veritabanında bulunamadı");
		}

		var existing = _context.UserSettings.FirstOrDefault(s => s.UserId == dto.UserId);

		if (existing == null)
		{
			var newSettings = new UserSettings
			{
				UserId = dto.UserId,
				IsDarkMode = dto.IsDarkMode,
				NotificationsEnabled = dto.NotificationsEnabled
			};
			_context.UserSettings.Add(newSettings);
		}
		else
		{
			existing.IsDarkMode = dto.IsDarkMode;
			existing.NotificationsEnabled = dto.NotificationsEnabled;
			_context.UserSettings.Update(existing);
		}

		_context.SaveChanges();
		return Ok(dto);
	}
}