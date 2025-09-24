using Buzdolabibackend.Models;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

public class UserSettings
{
    public int Id { get; set; }
    public int UserId { get; set; }
    public bool IsDarkMode { get; set; } = false;
    public bool NotificationsEnabled { get; set; } = true;

    [ForeignKey("UserId")]
    [JsonIgnore] // <-- ekle
    public User? User { get; set; }
}
