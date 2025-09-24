using Buzdolabibackend.Data;
using Buzdolabibackend.Models;
using Buzdolabibackend.DTOs;
using Microsoft.AspNetCore.Mvc;
using System.Net.Http;
using System.Text.Json;
using System.Threading.Tasks;

namespace Buzdolabibackend.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ProductController : ControllerBase //qr kod için 
	{
		private readonly AppDbContext _context;
		private readonly IHttpClientFactory _httpClientFactory;

		public ProductController(AppDbContext context, IHttpClientFactory httpClientFactory)
		{
			_context = context;
			_httpClientFactory = httpClientFactory;
		}

		// GET api/Product/food/{barcode}
		[HttpGet("food/{barcode}")]
		public async Task<IActionResult> UrunBilgiGetir(string barcode)
		{
			var client = _httpClientFactory.CreateClient();
			var response = await client.GetAsync($"https://world.openfoodfacts.org/api/v0/product/{barcode}.json");

			if (!response.IsSuccessStatusCode)
				return NotFound(new { message = "Ürün bulunamadı" });

			var jsonString = await response.Content.ReadAsStringAsync();
			using var jsonDoc = JsonDocument.Parse(jsonString);
			var root = jsonDoc.RootElement;

			if (root.GetProperty("status").GetInt32() != 1)
				return NotFound(new { message = "Ürün bulunamadı" });

			var productData = root.GetProperty("product");

			var result = new
			{
				Barcode = barcode,
				Name = productData.TryGetProperty("product_name", out var name) ? name.GetString() : "Bilinmiyor"
			};

			return Ok(result);
		}

		// POST api/Product/ekle
		[HttpPost("ekle")]
		public IActionResult Ekle([FromBody] Product urun)
		{
			if (urun.UserId == 0 || string.IsNullOrEmpty(urun.PName) || urun.PQuantity <= 0)
				return BadRequest(new { message = "Eksik alan" });

			_context.Products.Add(urun);
			_context.SaveChanges();

			// Burada BadRequest değil, Ok dön
			return Ok(new { message = "Ürün başarıyla eklendi" });
		}

	}



}
