namespace Buzdolabibackend.DTOs
{
	//BU CLASS PROFİL SAYFASINDA ŞİFREYİ DEĞİŞTİRMEK İÇİNDİR.
	public class ChangePasswordDto
	{
		public string OldPassword { get; set; }
		public string NewPassword { get; set; }
	}
}
