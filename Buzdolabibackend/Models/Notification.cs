
namespace Buzdolabibackend.Models
{
	public class Notification
	{
		public int Id { get; set; }
		public int? UserId { get; set; }   // Kullanıcıya özel veya global olabilir
		public string Message { get; set; } = string.Empty;
		public int? ProductId { get; set; } // hangi ürün için bildirim
		public bool IsRead { get; set; }
		public DateTime CreatedAt { get; set; }
		public string? Type { get; set; }
		public bool? IsGlobal { get; set; }  // Global bildirim için
	}
}
