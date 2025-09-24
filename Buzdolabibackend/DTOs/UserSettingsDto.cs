namespace Buzdolabibackend.DTOs
{
	public class UserSettingsDto
	{
		public int UserId { get; set; }
		public bool IsDarkMode { get; set; } = false;
		public bool NotificationsEnabled { get; set; } = true;
	}
}
