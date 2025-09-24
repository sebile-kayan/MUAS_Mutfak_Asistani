﻿
namespace Buzdolabibackend.DTOs
{
	public class NotificationDto
	{
		public int Id { get; set; }
		public int UserId { get; set; }
		public string Message { get; set; } = string.Empty;
		public bool IsRead { get; set; }
		public DateTime CreatedAt { get; set; }
		public string? Type { get; set; }
		public bool? IsGlobal { get; set; }
	}
}
