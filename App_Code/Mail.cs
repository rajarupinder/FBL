using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Data.SqlClient;
using System.Text;

/// <summary>
/// Summary description for clsScheduleMail
/// </summary>
public class Mail
{
    UserDetailBAL oUserDetailBAL = new UserDetailBAL();     

    public Mail()
	{

	}
    public void Send()
    {
        DataTable dt = new DataTable();
        dt = oUserDetailBAL.SelectActiveUserDetail();

        int RowCount = dt.Rows.Count;

        for (int i = 0; i < RowCount; i++)
        {
            SendScheduleMail
                (
                    dt.Rows[i]["name"].ToString(), 
                    dt.Rows[i]["email"].ToString(), 
                    dt.Rows[i]["username"].ToString(),
                    dt.Rows[i]["password"].ToString()
                );
            SendScheduleSMS
                (
                    dt.Rows[i]["mobileNo"].ToString(),
                    dt.Rows[i]["username"].ToString(),
                    dt.Rows[i]["password"].ToString()
                );
        }       
    }
    public void SendScheduleMail(string name, string email, string username, string password)
    {
        try
        {
            MailMessage message = new MailMessage();
            SmtpClient smtp = new SmtpClient();
            message.From = new MailAddress("yourfriends@venturepact.com", "FBL");
            message.To.Add(new MailAddress(email));
            message.IsBodyHtml = true;
            message.Subject = "FBL Updates";
            message.Body = @"<b>Hello " + name + ",</b><br /><br />" +
                                "Please click on the below link<br />" +
                                "http://gpsworld.us/FBL/Default.aspx?uid=" + Convert.ToBase64String(Encoding.Unicode.GetBytes(username)) + "&pid=" + Convert.ToBase64String(Encoding.Unicode.GetBytes(password));

            message.Priority = MailPriority.High;
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.Credentials = new System.Net.NetworkCredential("raja.rupinder@venturepact.com", "17585@LPU");
            smtp.Send(message);
        }
        catch
        {

        }
    }

    public void SendScheduleSMS(string mobileNo, string username, string password)
    {
        string sUserID = "raja.17585";
        string sPwd = "413059";
        string sNumber = mobileNo;
        string sSID = "WebSMS";
        string sMessage = "FBL Update. http://gpsworld.us/FBL/Default.aspx?uid=" + Convert.ToBase64String(Encoding.Unicode.GetBytes(username)) + "&pid=" + Convert.ToBase64String(Encoding.Unicode.GetBytes(password));
        string sURL = "http://smslane.com/vendorsms/pushsms.aspx?user="+ sUserID + "&password=" + sPwd + "&msisdn=" + sNumber + "&sid=" + sSID + "&msg=" + sMessage + "&mt=0&fl=0";
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(sURL);
        request.MaximumAutomaticRedirections = 4;
        request.Credentials = CredentialCache.DefaultCredentials;
        try
        {
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream receiveStream = response.GetResponseStream();
            StreamReader readStream = new StreamReader(receiveStream, Encoding.UTF8);
            string sResponse = readStream.ReadToEnd();
            response.Close();
            readStream.Close();
        }
        catch
        {

        }
    }    
}
