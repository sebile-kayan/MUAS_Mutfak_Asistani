using Buzdolabibackend.Models;
using Microsoft.EntityFrameworkCore;

namespace Buzdolabibackend.Data
{
	public class AppDbContext : DbContext
	{
		public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }
		public DbSet<User> Users { get; set; }
		public DbSet<Product> Products { get; set; }
		public DbSet<News> News { get; set; }
		public DbSet<UserSettings> UserSettings { get; set; }
		public virtual DbSet<ShoppingList> ShoppingLists { get; set; }
		public virtual DbSet<Notification> Notifications { get; set; }
		public virtual DbSet<ShoppingListItem> ShoppingListItems { get; set; }
		public virtual DbSet<Recipe> Recipes { get; set; }
		public virtual DbSet<ExpiringRecipe> ExpiringRecipes { get; set; }

		protected override void OnModelCreating(ModelBuilder modelBuilder)
		{
			base.OnModelCreating(modelBuilder);

			modelBuilder.Entity<User>(entity =>
			{
				entity.ToTable("Users"); // Tablo adı değişmedi

				entity.HasKey(e => e.Id);

				entity.Property(e => e.Id)
					  .HasColumnName("id") // SQL kolon adı küçük harf
					  .ValueGeneratedOnAdd();

				entity.Property(e => e.Ad)
					  .HasColumnName("ad")
					  .IsRequired();

				entity.Property(e => e.Email)
					  .HasColumnName("email")
					  .IsRequired();

				// Email benzersizlik kısıtlaması
				entity.HasIndex(e => e.Email)
					  .IsUnique()
					  .HasDatabaseName("UQ_Users_Email");

				entity.Property(e => e.PasswordHash)
					  .HasColumnName("password_hash")
					  .IsRequired();

				entity.Property(e => e.Salt)
					  .HasColumnName("salt")
					  .IsRequired();

				entity.Property(e => e.CreatedAt)
					  .HasColumnName("created_at");
			});

			// News konfigürasyonu
			modelBuilder.Entity<News>(entity =>
			{
				entity.ToTable("News");

				entity.HasKey(e => e.NewsId);

				entity.Property(e => e.NewsId)
					  .HasColumnName("newsid")
					  .ValueGeneratedOnAdd();

				entity.Property(e => e.NTitle)
					  .HasColumnName("ntitle")
					  .IsRequired()
					  .HasMaxLength(200);

				entity.Property(e => e.NContent)
					  .HasColumnName("ncontent")
					  .IsRequired();

				entity.Property(e => e.NCreatedAt)
					  .HasColumnName("ncreated_at")
					  .HasColumnType("date")
					  .HasDefaultValueSql("GETDATE()");
			});

			// Products tablosu
			modelBuilder.Entity<Product>().ToTable("Products");
			modelBuilder.Entity<Product>().Property(p => p.ProductsId).HasColumnName("productsid");
			modelBuilder.Entity<Product>().Property(p => p.UserId).HasColumnName("user_id").IsRequired();
			modelBuilder.Entity<Product>().Property(p => p.PName).HasColumnName("pname").IsRequired();
			modelBuilder.Entity<Product>().Property(p => p.PBrand).HasColumnName("pbrand");
			modelBuilder.Entity<Product>().Property(p => p.PBarcode).HasColumnName("pbarcode");
			modelBuilder.Entity<Product>().Property(p => p.PExpireDate).HasColumnName("pexpire_date").IsRequired();
			modelBuilder.Entity<Product>().Property(p => p.PQuantity).HasColumnName("pquantity").HasDefaultValue(0).IsRequired();
			modelBuilder.Entity<Product>().Property(p => p.PUnit).HasColumnName("punit");
			modelBuilder.Entity<Product>().Property(p => p.PCreatedAt).HasColumnName("pcreated_at").HasDefaultValueSql("GETDATE()");
			modelBuilder.Entity<Product>().Property(p => p.Status).HasColumnName("status").HasDefaultValue("mevcut");


			// UserSettings

			modelBuilder.Entity<UserSettings>().ToTable("UserSettings");
			modelBuilder.Entity<UserSettings>()
				.HasKey(us => us.Id);

			modelBuilder.Entity<UserSettings>()
				.HasOne(us => us.User)
				.WithMany()
				.HasForeignKey(us => us.UserId)
				.OnDelete(DeleteBehavior.Cascade);


			//modelBuilder.Entity<Recipe>(entity =>
			//{
			//	entity.HasKey(e => e.id).HasName("PK__Recipes__3213E83F69204BC9");

			//	entity.Property(e => e.created_at).HasDefaultValueSql("(getdate())");

			//	entity.HasOne(d => d.user).WithMany(p => p.Recipes)
			//		.OnDelete(DeleteBehavior.ClientSetNull)
			//		.HasConstraintName("FK_Recipes_Users");
			//});

			//modelBuilder.Entity<ExpiringRecipe>(entity =>
			//{
			//	entity.ToTable("ExpiringRecipes");
			//	entity.HasKey(e => e.Id);
			//	entity.Property(e => e.Ingredients).HasColumnType("nvarchar(max)");
			//});


			//modelBuilder.Entity<ShoppingList>(entity =>
			//{
			//	entity.HasKey(e => e.list_id).HasName("PK__Shopping__7B9EF13533FDDE93");

			//	entity.Property(e => e.created_at).HasDefaultValueSql("(getdate())");

			//	entity.HasOne(d => d.user).WithMany(p => p.ShoppingLists)
			//		.OnDelete(DeleteBehavior.ClientSetNull)
			//		.HasConstraintName("FK_ShoppingLists_Users");
			//});


			//modelBuilder.Entity<ShoppingListItem>(entity =>
			//{
			//	entity.HasKey(e => e.item_id).HasName("PK__Shopping__52020FDDB0063577");

			//	entity.Property(e => e.created_at).HasDefaultValueSql("(getdate())");
			//	entity.Property(e => e.is_checked).HasDefaultValue(false);

			//	entity.HasOne(d => d.list).WithMany(p => p.ShoppingListItems)
			//		.OnDelete(DeleteBehavior.ClientSetNull)
			//		.HasConstraintName("FK_ShoppingListItems_Lists");
			//});


			// Notifications tablosu
			modelBuilder.Entity<Notification>().ToTable("notifications");

			modelBuilder.Entity<Notification>(entity =>
			{
				entity.Property(e => e.Id).HasColumnName("id");
				entity.Property(e => e.UserId).HasColumnName("user_id");
				entity.Property(e => e.Message).HasColumnName("message");
				entity.Property(e => e.IsRead).HasColumnName("is_read");
				entity.Property(e => e.CreatedAt).HasColumnName("created_at");
				entity.Property(e => e.Type).HasColumnName("type");
				entity.Property(e => e.IsGlobal).HasColumnName("is_global");
			});



			//// Tema tablosu
			//modelBuilder.Entity<Tema>(entity =>
			//{
			//	entity.ToTable("Tema");

			//	entity.HasKey(e => e.TemaId);

			//	entity.Property(e => e.TemaId)
			//		  .HasColumnName("tema_id")
			//		  .ValueGeneratedOnAdd();

			//	entity.Property(e => e.UserId)
			//		  .HasColumnName("user_id")
			//		  .IsRequired();

			//	entity.Property(e => e.IsDarkMode)
			//		  .HasColumnName("is_dark_mode")
			//		  .HasDefaultValue(false);

			//	entity.Property(e => e.NotificationsEnabled)
			//		  .HasColumnName("notifications_enabled")
			//		  .HasDefaultValue(true);

			//	entity.Property(e => e.Language)
			//		  .HasColumnName("language")
			//		  .HasMaxLength(10)
			//		  .HasDefaultValue("tr");

			//	entity.Property(e => e.CreatedAt)
			//		  .HasColumnName("created_at")
			//		  .HasDefaultValueSql("GETDATE()");

			//	entity.Property(e => e.UpdatedAt)
			//		  .HasColumnName("updated_at")
			//		  .HasDefaultValueSql("GETDATE()");

			//	// Foreign key relationship
			//	entity.HasOne(e => e.User)
			//		  .WithMany()
			//		  .HasForeignKey(e => e.UserId)
			//		  .OnDelete(DeleteBehavior.Cascade);
			//});

		}
	}
}
