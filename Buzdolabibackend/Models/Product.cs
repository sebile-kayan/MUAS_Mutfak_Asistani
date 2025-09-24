using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Buzdolabibackend.Models
{
	[Table("Products")]
	public class Product
	{
		[Key]
		[Column("productsid")]
		public int ProductsId { get; set; }

		[Required]
		[Column("user_id")]
		public int UserId { get; set; }

		[Required]
		[MaxLength(150)]
		[Column("pname")]
		public string PName { get; set; }

		[MaxLength(100)]
		[Column("pbrand")]
		public string PBrand { get; set; }

		[MaxLength(100)]
		[Column("pbarcode")]
		public string PBarcode { get; set; }

		[Required]
		[Column("pexpire_date")]
		public DateTime PExpireDate { get; set; }

		[Required]
		[Column("pquantity")]
		public decimal PQuantity { get; set; } = 0;

		[MaxLength(20)]
		[Column("punit")]
		public string PUnit { get; set; }

		[Column("pcreated_at")]
		public DateTime PCreatedAt { get; set; } = DateTime.Now;

		[MaxLength(20)]
		[Column("status", TypeName = "nvarchar(20)")]
		public string Status { get; set; } = "mevcut";
	}
}

