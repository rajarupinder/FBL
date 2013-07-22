using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class _Default : System.Web.UI.Page
{    
    UserDetailBAL oUserDetailBAL = new UserDetailBAL();
    UserDetailBO oUserDetailBO = new UserDetailBO();

    protected void Page_Load(object sender, EventArgs e)
    {               
        if (Request.QueryString["uid"] != null)
        {
            try
            {                
                oUserDetailBO.username = Encoding.Unicode.GetString(Convert.FromBase64String(Request.QueryString["uid"].ToString()));
                oUserDetailBO.password = Encoding.Unicode.GetString(Convert.FromBase64String(Request.QueryString["pid"].ToString()));
                string[] str = oUserDetailBAL.LoginValidity(oUserDetailBO);

                if (str[1].ToString() == "1")
                {
                    Session["userID"] = str[0];
                    Response.Redirect("Admin/Feedback.aspx", false);
                }
                else if (str[1].ToString() == "0")
                {
                    Session["userID"] = str[0];
                    Response.Redirect("User/Feedback.aspx", false);
                }
                else
                {
                    Response.Redirect("Default.aspx", false);
                }
            }
            catch
            {
                Response.Redirect("Default.aspx", false);
            }
        }
        else
        {
            if (Page.IsPostBack == false)
            {
                Session["userID"] = null;
                Session["username"] = null;
                Session.Abandon();
            }
        }     
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            oUserDetailBO.username = txtUsername.Text;
            oUserDetailBO.password = txtPassword.Text;

            string[] str = oUserDetailBAL.LoginValidity(oUserDetailBO);

            if (str[1].ToString() == "1")
            {
                Session["userID"] = str[0];
                Session["username"] = txtUsername.Text;
                Response.Redirect("Admin/Default.aspx", false);
            }
            else if (str[1].ToString() == "0")
            {
                Session["userID"] = str[0];
                Session["username"] = txtUsername.Text;
                Response.Redirect("User/Default.aspx", false);
            }
            else
            {
                lblMessage.Text = str[2];
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message.ToString();
        }
    }
}