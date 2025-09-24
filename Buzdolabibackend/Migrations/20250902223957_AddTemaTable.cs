using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Buzdolabibackend.Migrations
{
    /// <inheritdoc />
    public partial class AddTemaTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Tema",
                columns: table => new
                {
                    tema_id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    user_id = table.Column<int>(type: "int", nullable: false),
                    is_dark_mode = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    notifications_enabled = table.Column<bool>(type: "bit", nullable: false, defaultValue: true),
                    language = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false, defaultValue: "tr"),
                    created_at = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "GETDATE()"),
                    updated_at = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "GETDATE()")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Tema", x => x.tema_id);
                    table.ForeignKey(
                        name: "FK_Tema_Users_user_id",
                        column: x => x.user_id,
                        principalTable: "Users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Tema_user_id",
                table: "Tema",
                column: "user_id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Tema");
        }
    }
}
