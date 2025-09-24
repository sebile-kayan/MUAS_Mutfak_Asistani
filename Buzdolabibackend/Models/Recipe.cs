using Buzdolabibackend.Models;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

public partial class Recipe
{
    [Key]
    public int id { get; set; }

    public int user_id { get; set; }

    [StringLength(200)]
    public string title { get; set; } = null!;

    public string instructions { get; set; } = null!;

    // Burayı değiştiriyoruz
    public DateTime? created_at { get; set; } = DateTime.UtcNow;

    [ForeignKey("user_id")]
    public virtual User user { get; set; } = null!;
}
