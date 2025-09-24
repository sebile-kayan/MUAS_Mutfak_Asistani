using Buzdolabibackend.Data;
using Buzdolabibackend.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Runtime.ConstrainedExecution;

namespace Buzdolabibackend.Controllers
{
	//SKT'SİNE 3 GÜN KALAN ÜRÜNLERDEN TARİF ÖNERMEK İÇİN	
	[ApiController]
	[Route("api/suggested-recipes")]
	public class SuggestedRecipesController : ControllerBase
	{
		private readonly AppDbContext _context;

		public SuggestedRecipesController(AppDbContext context)
		{
			_context = context;
		}

		// GET: /api/suggested-recipes/{userId}?days=3&take=5
		[HttpGet("{userId}")]
		public async Task<IActionResult> GetSuggestedRecipes(
			int userId,
			int days = 3,    // kaç gün içinde son kullanma
			int take = 5     // en çok eşleşen kaç tarif
		)
		{
			DateTime today = DateTime.Today;
			DateTime threshold = today.AddDays(days);

			// Null güvenli ürün listesi
			var expiringProducts = await _context.Products
				.Where(p => p.UserId == userId &&
							p.Status == "mevcut" &&
							p.PExpireDate >= today &&
							p.PExpireDate <= threshold)
				.Select(p => (p.PName ?? "").Trim().ToLower())
				.Distinct()
				.ToListAsync();

			if (!expiringProducts.Any())
				return Ok(new object[] { });

			var recipes = await _context.ExpiringRecipes.AsNoTracking().ToListAsync();

			var suggestedRecipes = recipes
				.Select(r => new
				{
					r.Id,
					Title = (r.Title ?? "").Trim(),
					Instructions = (r.Instructions ?? "").Trim(),
					Ingredients = r.Ingredients,
					MatchCount = r.IngredientsList
						.Select(i => (i ?? "").Trim().ToLower())
						.Count(i => expiringProducts.Contains(i))
				})
				.Where(x => x.MatchCount > 0)
				.OrderByDescending(x => x.MatchCount)
				.ThenBy(x => x.Title)
				.Take(take)
				.ToList();

			return Ok(suggestedRecipes);
			//Her tarif için: MatchCount → Tarifin malzemelerinden kaç tanesi kullanıcının SKT yaklaşan ürünlerinde var, onu sayıyor.

			//En çok eşleşeni en üste koyuyor. Aynı sayıda eşleşme varsa → alfabetik sıraya göre. İlk take=5 kadar tarifi öneriyor.
		} 
	}
}
