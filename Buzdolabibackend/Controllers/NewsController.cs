using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Buzdolabibackend.Data;
using Buzdolabibackend.Models;

namespace Buzdolabibackend.Controllers
{
	[ApiController]
	[Route("api/[controller]")]
	public class NewsController : ControllerBase
	{
		private readonly AppDbContext _context;

		public NewsController(AppDbContext context)
		{
			_context = context;
		}

		// GET: api/News
		[HttpGet]
		public async Task<ActionResult<IEnumerable<News>>> GetAll()
		{
			return await _context.News
								 .AsNoTracking()
								 .ToListAsync();
		}
	}
}
