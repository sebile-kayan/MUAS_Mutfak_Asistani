using Buzdolabibackend.Models;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;

namespace Buzdolabibackend.Services
{
	public class AuthService
	{
		public string ComputeSha256Hash(string password, string salt)
		{
			using var sha256 = SHA256.Create();
			var bytes = Encoding.UTF8.GetBytes(password + salt);
			var hash = sha256.ComputeHash(bytes);
			return Convert.ToBase64String(hash);
		}

		public bool VerifyPassword(string password, string storedHash, string salt)
		{
			var hash = ComputeSha256Hash(password, salt);
			return hash == storedHash;
		}

		public string GenerateJwtToken(User user)
		{
			var claims = new[]
			{
				new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
				new Claim(ClaimTypes.Name, user.Email)
			};

			var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("SuperSecretKey123!"));
			var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

			var token = new JwtSecurityToken(
				issuer: "israfApp",
				audience: "israfUsers",
				claims: claims,
				expires: DateTime.UtcNow.AddDays(7),
				signingCredentials: creds
			);

			return new JwtSecurityTokenHandler().WriteToken(token);
		}
	}
}


