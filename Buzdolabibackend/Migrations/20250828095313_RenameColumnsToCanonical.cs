////using System;
////using Microsoft.EntityFrameworkCore.Migrations;

////#nullable disable

////namespace Buzdolabibackend.Migrations
////{
////    /// <inheritdoc />
////    public partial class RenameColumnsToCanonical : Migration
////    {
////        /// <inheritdoc />
////        protected override void Up(MigrationBuilder migrationBuilder)
////        {
////            migrationBuilder.CreateTable(
////                name: "Users",
////                columns: table => new
////                {
////                    Id = table.Column<int>(type: "int", nullable: false)
////                        .Annotation("SqlServer:Identity", "1, 1"),
////                    Ad = table.Column<string>(type: "nvarchar(max)", nullable: false),
////                    Email = table.Column<string>(type: "nvarchar(max)", nullable: false),
////                    PasswordHash = table.Column<string>(type: "nvarchar(max)", nullable: false),
////                    Salt = table.Column<string>(type: "nvarchar(max)", nullable: false),
////                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
////                },
////                constraints: table =>
////                {
////                    table.PrimaryKey("PK_Users", x => x.Id);
////                });
////        }

////        /// <inheritdoc />
////        protected override void Down(MigrationBuilder migrationBuilder)
////        {
////            migrationBuilder.DropTable(
////                name: "Users");
////        }
////    }
////}
//using Microsoft.EntityFrameworkCore.Migrations;

//#nullable disable

//namespace Buzdolabibackend.Migrations
//{
//	public partial class RenameColumnsToCanonical : Migration
//	{
//		protected override void Up(MigrationBuilder migrationBuilder)
//		{
//			migrationBuilder.RenameColumn("id", "Users", "Id");
//			migrationBuilder.RenameColumn("ad", "Users", "Ad");
//			migrationBuilder.RenameColumn("email", "Users", "Email");
//			migrationBuilder.RenameColumn("password_hash", "Users", "PasswordHash");
//			migrationBuilder.RenameColumn("salt", "Users", "Salt");
//			migrationBuilder.RenameColumn("created_at", "Users", "CreatedAt");
//		}

//		protected override void Down(MigrationBuilder migrationBuilder)
//		{
//			migrationBuilder.RenameColumn("Id", "Users", "id");
//			migrationBuilder.RenameColumn("Ad", "Users", "ad");
//			migrationBuilder.RenameColumn("Email", "Users", "email");
//			migrationBuilder.RenameColumn("PasswordHash", "Users", "password_hash");
//			migrationBuilder.RenameColumn("Salt", "Users", "salt");
//			migrationBuilder.RenameColumn("CreatedAt", "Users", "created_at");
//		}
//	}
//}
