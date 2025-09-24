using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Buzdolabibackend.Data;
using Buzdolabibackend.Models;
using System.Linq;

namespace Buzdolabibackend.Controllers
{ 
    //KENDİ TARİFLERİNİ EKLEMEK İÇİN
    [ApiController]
    [Route("api/[controller]")]
    public class RecipesController : ControllerBase
    {
        private readonly AppDbContext _db;

        public RecipesController(AppDbContext db)
        {
            _db = db;
        }

        // ---------------- DTO'lar ----------------
        public record CreateRecipeDto(int userId, string title, string instructions);
        public record UpdateRecipeDto(string title, string instructions);
        public record RecipeDto(int id, int user_id, string title, string instructions, DateTime? created_at);
        // -----------------------------------------

        // GET: api/recipes?userId=1
        [HttpGet]
        public async Task<ActionResult<IEnumerable<RecipeDto>>> GetRecipes([FromQuery] int userId)
        {
            var list = await _db.Recipes
                .AsNoTracking()
                .Where(r => r.user_id == userId)
                .OrderByDescending(r => r.id)
                .Select(r => new RecipeDto(
                    r.id,
                    r.user_id,
                    r.title,
                    r.instructions,
                    r.created_at
                ))
                .ToListAsync();

            return Ok(list);
        }

        // GET: api/recipes/{id}
        [HttpGet("{id:int}")]
        public async Task<ActionResult<RecipeDto>> GetRecipe(int id)
        {
            var r = await _db.Recipes.AsNoTracking().FirstOrDefaultAsync(x => x.id == id);
            if (r is null) return NotFound();

            return new RecipeDto(r.id, r.user_id, r.title, r.instructions, r.created_at);
        }

        // POST: api/recipes
        [HttpPost]
        public async Task<ActionResult<RecipeDto>> CreateRecipe([FromBody] CreateRecipeDto dto)
        {
            if (string.IsNullOrWhiteSpace(dto.title) || string.IsNullOrWhiteSpace(dto.instructions))
                return BadRequest("title ve instructions zorunludur.");

            var entity = new Recipe
            {
                user_id = dto.userId,
                title = dto.title.Trim(),
                instructions = dto.instructions.Trim(),
                created_at = DateTime.UtcNow
            };

            _db.Recipes.Add(entity);
            await _db.SaveChangesAsync();

            return CreatedAtAction(nameof(GetRecipe), new { id = entity.id },
                new RecipeDto(entity.id, entity.user_id, entity.title, entity.instructions, entity.created_at));
        }

        // PUT: api/recipes/{id}?userId=1
        [HttpPut("{id:int}")]
        public async Task<IActionResult> UpdateRecipe(int id, [FromQuery] int userId, [FromBody] UpdateRecipeDto dto)
        {
            var entity = await _db.Recipes.FirstOrDefaultAsync(r => r.id == id && r.user_id == userId);
            if (entity is null) return NotFound();

            if (!string.IsNullOrWhiteSpace(dto.title)) entity.title = dto.title.Trim();
            if (!string.IsNullOrWhiteSpace(dto.instructions)) entity.instructions = dto.instructions.Trim();

            await _db.SaveChangesAsync();
            return NoContent();
        }

        // DELETE: api/recipes/{id}?userId=1
        [HttpDelete("{id:int}")]
        public async Task<IActionResult> DeleteRecipe(int id, [FromQuery] int userId)
        {
            var entity = await _db.Recipes.FirstOrDefaultAsync(r => r.id == id && r.user_id == userId);
            if (entity is null) return NotFound();

            _db.Recipes.Remove(entity);
            await _db.SaveChangesAsync();
            return NoContent();
        }
    }
}
