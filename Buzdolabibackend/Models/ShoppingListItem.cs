using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace Buzdolabibackend.Models
{
	public partial class ShoppingListItem
	{
		[Key]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public int item_id { get; set; }

		public int list_id { get; set; }

		[StringLength(200)]
		public string product_name { get; set; } = null!;

		public bool? is_checked { get; set; }

		public DateOnly? created_at { get; set; }

		// Nullable ve JsonIgnore yapıldı
		[ForeignKey("list_id")]
		[InverseProperty("ShoppingListItems")]
		[JsonIgnore]
		public virtual ShoppingList? list { get; set; } // <- burası nullable olmalı
	}
}
