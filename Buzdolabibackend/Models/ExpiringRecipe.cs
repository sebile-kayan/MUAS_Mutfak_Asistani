using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json;

namespace Buzdolabibackend.Models
{
	public class ExpiringRecipe
	{
		[Key]
		public int Id { get; set; }

		[StringLength(200)]
		public string Title { get; set; } = null!;

		public string Instructions { get; set; } = null!;

		[Column(TypeName = "nvarchar(max)")]
		public string Ingredients { get; set; } = "[]"; // JSON array string

		[NotMapped]
		public List<string> IngredientsList
		{
			get => string.IsNullOrWhiteSpace(Ingredients)
				? new List<string>()
				: JsonSerializer.Deserialize<List<string>>(Ingredients)!;

			set => Ingredients = JsonSerializer.Serialize(value ?? new List<string>());
		}
	}
}
