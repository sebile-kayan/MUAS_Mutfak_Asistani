using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Buzdolabibackend.Migrations
{
	public partial class AddProductIdToNotifications : Migration
	{
		protected override void Up(MigrationBuilder migrationBuilder)
		{
			migrationBuilder.AddColumn<int>(
				name: "ProductId",
				table: "notifications",
				type: "int",
				nullable: true);
		}

		protected override void Down(MigrationBuilder migrationBuilder)
		{
			migrationBuilder.DropColumn(
				name: "ProductId",
				table: "notifications");
		}
	}
}
