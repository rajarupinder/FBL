﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["userID"] == null)
            {
                Response.Redirect("Default.aspx", false);
            }
            else
            {
                if (Page.IsPostBack == false)
                {                    
                    
                }
            }

        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }
    protected void btnSendEmail_Click(object sender, EventArgs e)
    {
        Mail oMail = new Mail();
        oMail.Send();
    }
}