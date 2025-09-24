using Buzdolabibackend.Data;
using Buzdolabibackend.DTOs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Buzdolabibackend.Models;

namespace Buzdolabibackend.Controllers
{
	[ApiController]
	[Route("api/[controller]")]
	public class NotificationsController : ControllerBase
	{
		private readonly AppDbContext _db;
		public NotificationsController(AppDbContext db) => _db = db;

		// GET: api/notifications?userId=1&isRead=false
		[HttpGet]
		public async Task<ActionResult<IEnumerable<NotificationDto>>> Get(
			[FromQuery(Name = "userId")] int? userId = null,
			[FromQuery] bool? isRead = null)
		{
			var query = _db.Notifications.AsNoTracking().AsQueryable();

			if (userId.HasValue)
				query = query.Where(n => n.UserId == userId.Value || (n.UserId == null || n.IsGlobal == true));
			else
				query = query.Where(n => n.UserId == null || n.IsGlobal == true);

			if (isRead.HasValue)
				query = query.Where(n => n.IsRead == isRead.Value);

			var list = await query
				.OrderByDescending(n => n.CreatedAt)
				.Select(n => new NotificationDto
				{
					Id = n.Id,
					UserId = (int)n.UserId,
					Message = n.Message,
					IsRead = n.IsRead,
					CreatedAt = n.CreatedAt,
					Type = n.Type,
					IsGlobal = n.IsGlobal
				})
				.ToListAsync();

			return Ok(list);
		}

		// POST: api/notifications/{id}/read
		[HttpPost("{id:int}/read")]
		public async Task<IActionResult> MarkRead([FromRoute] int id)
		{
			var notif = await _db.Notifications.FirstOrDefaultAsync(n => n.Id == id);
			if (notif == null) return NotFound();
			notif.IsRead = true;
			await _db.SaveChangesAsync();
			return NoContent();
		}

		// POST: api/notifications/read-all?userId=1
		[HttpPost("read-all")]
		public async Task<IActionResult> MarkAllRead([FromQuery] int? userId = null)
		{
			var notifs = await _db.Notifications
				.Where(n => (userId == null ? (n.UserId == null || n.IsGlobal == true) : n.UserId == userId) && n.IsRead == false)
				.ToListAsync();

			foreach (var n in notifs) n.IsRead = true;
			await _db.SaveChangesAsync();
			return NoContent();
		}


		// DELETE: api/notifications/{id}
		[HttpDelete("{id:int}")]
		public async Task<IActionResult> Delete([FromRoute] int id)
		{
			var notif = await _db.Notifications.FirstOrDefaultAsync(n => n.Id == id);
			if (notif == null) return NotFound();

			_db.Notifications.Remove(notif);
			await _db.SaveChangesAsync();
			return NoContent();
		}

		// POST: api/notifications/generate-expire-alerts
		[HttpPost("generate-expire-alerts")]
		public async Task<IActionResult> GenerateExpireAlerts([FromQuery] int? userId = null)
		{
			var now = DateTime.Now;

			//var query = _db.Products.AsQueryable();
			var query = _db.Products.AsNoTracking().AsQueryable();
			if (userId != null)
				query = query.Where(p => p.UserId == userId);

			//var products = await query.ToListAsync();
			// Null güvenli minimal alan projeksiyonu
			var products = await query
				.Select(p => new
				{
					p.UserId,
					PName = p.PName ?? "Bilinmiyor",
					p.PExpireDate
				})
				.ToListAsync();

			foreach (var p in products)
			{
				// Son kullanma tarihi geçen ürün
				if (p.PExpireDate < now)
				{
					//if (!await _db.Notifications.AnyAsync(n => n.UserId == p.UserId && n.Message.Contains(p.PName) && n.Type == "expired"))
					var pname = p.PName ?? "Bilinmiyor";
					if (!await _db.Notifications.AnyAsync(n => n.UserId == p.UserId && n.Message.Contains(pname) && n.Type == "expired"))
					{
						_db.Notifications.Add(new Notification
						{
							UserId = p.UserId,
							//Message = $"\"{p.PName}\" ürününün son kullanma tarihi geçti!",
							Message = $"\"{pname}\" ürününün son kullanma tarihi geçti!",
							IsRead = false,
							CreatedAt = now,
							Type = "expired",
							IsGlobal = false
						});
					}
				}
				// Son kullanma tarihi 2 gün kalan ürün
				else if (p.PExpireDate <= now.AddDays(2))
				{
					//if (!await _db.Notifications.AnyAsync(n => n.UserId == p.UserId && n.Message.Contains(p.PName) && n.Type == "warning"))
					var pname = p.PName ?? "Bilinmiyor";
					if (!await _db.Notifications.AnyAsync(n => n.UserId == p.UserId && n.Message.Contains(pname) && n.Type == "warning"))
					{
						_db.Notifications.Add(new Notification
						{
							UserId = p.UserId,
							//Message = $"\"{p.PName}\" ürününün son kullanma tarihi {(p.PExpireDate - now).Days} gün kaldı!",
							Message = $"\"{pname}\" ürününün son kullanma tarihine {(p.PExpireDate - now).Days} gün kaldı!",
							IsRead = false,
							CreatedAt = now,
							Type = "warning",
							IsGlobal = false
						});
					}
				}
			}

			await _db.SaveChangesAsync();
			return Ok(new { message = "Son kullanma tarihi bildirimleri oluşturuldu." });
		}
	}
}
