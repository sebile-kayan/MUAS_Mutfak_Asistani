using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Buzdolabibackend.Models
{
	[Table("News")]
	public class News
	{
		[Key]
		[Column("newsid")]
		public int NewsId { get; set; }

		[Required]
		[Column("ntitle")]
		[MaxLength(200)]
		public string NTitle { get; set; } = null!;

		[Required]
		[Column("ncontent")]
		public string NContent { get; set; } = null!;

		[Column("ncreated_at", TypeName = "date")]
		public DateTime NCreatedAt { get; set; } = DateTime.Now;
	}
}
