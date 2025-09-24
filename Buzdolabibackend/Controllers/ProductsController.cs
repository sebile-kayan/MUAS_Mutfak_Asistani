using Buzdolabibackend.Data;
using Buzdolabibackend.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace Buzdolabibackend.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ProductsController : ControllerBase
	{
		private readonly AppDbContext _context;

		public ProductsController(AppDbContext context)
		{
			_context = context;
		}

		// CREATE
		[HttpPost]
		//public IActionResult CreateProduct([FromBody] Product product)
		public async Task<IActionResult> CreateProduct([FromBody] Product product)
		{
			product.PBrand = string.IsNullOrWhiteSpace(product.PBrand) ? "Bilinmiyor" : product.PBrand.Trim();
			product.PBarcode = string.IsNullOrWhiteSpace(product.PBarcode) ? "Bilinmiyor" : product.PBarcode.Trim();
			product.PName = string.IsNullOrWhiteSpace(product.PName) ? "Bilinmiyor" : product.PName.Trim();

			product.PCreatedAt = DateTime.Now;
			product.Status = "mevcut";

			_context.Products.Add(product);
			//_context.SaveChanges();
			await _context.SaveChangesAsync();
			// Ürün eklendikten sonra otomatik bildirim oluştur
			await CreateNotificationForProduct(product);

			return CreatedAtAction(nameof(GetProductById), new { id = product.ProductsId }, product);
		}

		private async Task CreateNotificationForProduct(Product product)
		{
			var now = DateTime.Now;
			var pname = product.PName ?? "Bilinmiyor";

			// Son kullanma tarihi geçen ürün
			if (product.PExpireDate < now)
			{
				if (!await _context.Notifications.AnyAsync(n => n.UserId == product.UserId && n.Message.Contains(pname) && n.Type == "expired"))
				{
					_context.Notifications.Add(new Notification
					{
						UserId = product.UserId,
						Message = $"\"{pname}\" ürününün son kullanma tarihi geçti!",
						IsRead = false,
						CreatedAt = now,
						Type = "expired",
						IsGlobal = false
					});
				}
			}
			// Son kullanma tarihi 2 gün kalan ürün
			else if (product.PExpireDate <= now.AddDays(2))
			{
				if (!await _context.Notifications.AnyAsync(n => n.UserId == product.UserId && n.Message.Contains(pname) && n.Type == "warning"))
				{
					_context.Notifications.Add(new Notification
					{
						UserId = product.UserId,
						Message = $"\"{pname}\" ürününün son kullanma tarihine {(product.PExpireDate - now).Days} gün kaldı!",
						IsRead = false,
						CreatedAt = now,
						Type = "warning",
						IsGlobal = false
					});
				}
			}

			await _context.SaveChangesAsync();
		}


		// READ - Kullanıcıya ait ürünler
		[HttpGet("user/{userId}")]
		public IActionResult GetProductsByUser(int userId)
		{
			var products = _context.Products
				.Where(p => p.UserId == userId)
				.OrderByDescending(p => p.PCreatedAt)
				.Select(p => new
				{
					p.ProductsId,
					PName = (p.PName ?? "Bilinmiyor").Trim(),
					PBrand = (p.PBrand ?? "Bilinmiyor").Trim(),
					PBarcode = (p.PBarcode ?? "Bilinmiyor").Trim(),
					p.PExpireDate,
					p.PQuantity,
					p.PUnit,
					p.Status,
					p.PCreatedAt
				})
				.ToList();

			return Ok(products);
		}

		// READ - Tek ürün
		[HttpGet("{id}")]
		public IActionResult GetProductById(int id)
		{
			var product = _context.Products
				.Where(p => p.ProductsId == id)
				.Select(p => new
				{
					p.ProductsId,
					PName = (p.PName ?? "Bilinmiyor").Trim(),
					PBrand = (p.PBrand ?? "Bilinmiyor").Trim(),
					PBarcode = (p.PBarcode ?? "Bilinmiyor").Trim(),
					p.PExpireDate,
					p.PQuantity,
					p.PUnit,
					p.Status,
					p.PCreatedAt
				})
				.FirstOrDefault();

			if (product == null) return NotFound();
			return Ok(product);
		}

		// UPDATE
		[HttpPut("{id}")]
		public IActionResult UpdateProduct(int id, [FromBody] Product updatedProduct)
		{
			var product = _context.Products.Find(id);
			if (product == null || product.UserId != updatedProduct.UserId)
				return NotFound("Ürün bulunamadı veya yetkisiz işlem.");

			product.PName = string.IsNullOrWhiteSpace(updatedProduct.PName) ? "Bilinmiyor" : updatedProduct.PName.Trim();
			product.PBrand = string.IsNullOrWhiteSpace(updatedProduct.PBrand) ? "Bilinmiyor" : updatedProduct.PBrand.Trim();
			product.PBarcode = string.IsNullOrWhiteSpace(updatedProduct.PBarcode) ? "Bilinmiyor" : updatedProduct.PBarcode.Trim();
			product.PExpireDate = updatedProduct.PExpireDate;
			product.PQuantity = updatedProduct.PQuantity;
			product.PUnit = updatedProduct.PUnit;
			product.Status = updatedProduct.Status;

			_context.SaveChanges();
			return Ok(product);
		}

		// DELETE
		[HttpDelete("{id}/user/{userId}")]
		public IActionResult DeleteProduct(int id, int userId)
		{
			var deletedCount = _context.Products
				.Where(p => p.ProductsId == id && p.UserId == userId)
				.ExecuteDelete();

			if (deletedCount == 0)
				return NotFound("Ürün bulunamadı veya yetkisiz işlem.");

			return NoContent();
		}
	}
}
