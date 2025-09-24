using System.ComponentModel.DataAnnotations.Schema;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace Buzdolabibackend.Models
{

	public class User
	{
		public int Id { get; set; }
		public string Ad { get; set; }
		public string Email { get; set; }
		public string PasswordHash { get; set; }
		public string Salt { get; set; }
		public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

	}
}
