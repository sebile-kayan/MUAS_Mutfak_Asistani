using Buzdolabibackend.Data;
using Buzdolabibackend.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Buzdolabibackend.Controllers
{
	[ApiController]
	[Route("api/[controller]")]
	public class ShoppingListController : ControllerBase
	{
		private readonly AppDbContext _context;

		public ShoppingListController(AppDbContext context)
		{
			_context = context;
		}

		// Tüm listeleri getir (user_id’ye göre)
		[HttpGet("{userId}")]
		public async Task<ActionResult<IEnumerable<ShoppingList>>> GetLists(int userId)
		{
			var lists = await _context.ShoppingLists
				.Include(l => l.ShoppingListItems)
				.Where(l => l.user_id == userId)
				.ToListAsync();

			//if (lists == null || lists.Count == 0)
			//	return NotFound("Bu kullanıcıya ait liste bulunamadı.");

			return Ok(lists);
		}

		// Yeni liste oluştur
		[HttpPost]
		public async Task<ActionResult<ShoppingList>> CreateList([FromBody] ShoppingList list)
		{
			_context.ShoppingLists.Add(list);
			await _context.SaveChangesAsync();
			return CreatedAtAction(nameof(GetLists), new { userId = list.user_id }, list);
		}

		// DTO: Listeye ürün ekle ve güncelleme için
		public class ShoppingListItemDto
		{
			public string product_name { get; set; } = null!;
			public bool? is_checked { get; set; }
		}

		// Listeye ürün ekle
		[HttpPost("{listId}/items")]
		public async Task<ActionResult<ShoppingListItem>> AddItem(int listId, [FromBody] ShoppingListItemDto dto)
		{
			var item = new ShoppingListItem
			{
				list_id = listId,
				product_name = dto.product_name,
				is_checked = dto.is_checked,
				created_at = DateOnly.FromDateTime(DateTime.Now)
			};

			_context.ShoppingListItems.Add(item);
			await _context.SaveChangesAsync();

			return CreatedAtAction(nameof(GetLists), new { userId = listId }, item);
		}

		// Ürün güncelle
		[HttpPut("items/{itemId}")]
		public async Task<IActionResult> UpdateItem(int itemId, [FromBody] ShoppingListItemDto dto)
		{
			var item = await _context.ShoppingListItems.FindAsync(itemId);
			if (item == null) return NotFound();

			item.product_name = dto.product_name;
			item.is_checked = dto.is_checked;

			await _context.SaveChangesAsync();
			return NoContent();
		}

		// Listeyi sil
		[HttpDelete("{listId}")]
		public async Task<IActionResult> DeleteList(int listId)
		{
			Console.WriteLine($"DeleteList çağrıldı - listId: {listId}");
			var list = await _context.ShoppingLists
				.Include(l => l.ShoppingListItems)
				.FirstOrDefaultAsync(l => l.list_id == listId);

			//if (list == null) return NotFound();
			if (list == null)
			{
				Console.WriteLine($"Liste bulunamadı - listId: {listId}");
				return NotFound($"Liste bulunamadı - ID: {listId}");
			}

			Console.WriteLine($"Liste bulundu ve siliniyor - listId: {listId}");

			_context.ShoppingListItems.RemoveRange(list.ShoppingListItems);
			_context.ShoppingLists.Remove(list);
			await _context.SaveChangesAsync();
			return NoContent();
		}
	}
}