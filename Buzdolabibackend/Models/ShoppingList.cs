using Buzdolabibackend.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace Buzdolabibackend.Models
{
	public partial class ShoppingList
	{
		[Key]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public int list_id { get; set; }  // Liste ID

		public int user_id { get; set; }  // Kullanıcı ID

		[StringLength(200)]
		public string? list_name { get; set; }  // Liste adı

		public DateOnly? created_at { get; set; }

		// İlişkili ürünler
		[InverseProperty("list")]
		public virtual ICollection<ShoppingListItem> ShoppingListItems { get; set; } = new List<ShoppingListItem>();
	}
}
