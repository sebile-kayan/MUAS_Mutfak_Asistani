namespace Buzdolabibackend.DTOs
{
	public class ProductEkleDto
	{
		public int UserId { get; set; }          // Giriş yapan kullanıcı
		public string PName { get; set; }        // Ürün adı (Food API’den)
		public string PBarcode { get; set; }     // Barkod
		public DateTime PExpireDate { get; set; } // SKT (kullanıcı girer)
		public decimal PQuantity { get; set; } = 0; // Opsiyonel
		public string PUnit { get; set; }        // Opsiyonel
		public string PBrand { get; set; }       // Opsiyonel
	}
}
