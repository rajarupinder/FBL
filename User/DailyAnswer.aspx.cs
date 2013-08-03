using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_DailyAnswer : System.Web.UI.Page
{
    UserDetailBAL oUserDetailBAL = new UserDetailBAL();     
    AnswerBO oAnswerBO = new AnswerBO(); 
    AnswerBAL oAnswerBAL = new AnswerBAL();
    DataTable dt;

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
                Calendar1.SelectionChanged += new EventHandler(this.Selection_Change);

                if (Page.IsPostBack == false)
                {
                    DataTable dt = new DataTable();
                    dt = oUserDetailBAL.SelectUserDetail();
                    dgrdEmployee.DataSource = dt;
                    dgrdEmployee.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }
    void Selection_Change(Object sender, EventArgs e)
    {
        // Clear the current text.
        ((Label)(Master.FindControl("lblMessage"))).Text = String.Empty;

        // Iterate through the SelectedDates collection and display the
        // dates selected in the Calendar control.
        DataTable dt = new DataTable();
        dt = oUserDetailBAL.SelectUserDetail();        
        dgrdEmployee.DataSource = dt;
        dgrdEmployee.DataBind();
    }        
    protected void dgrdEmployee_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                GridView gv = (GridView)e.Row.FindControl("dgrdDailyAnswer");
                foreach (DateTime day in Calendar1.SelectedDates)
                {
                    HiddenField hdf = (HiddenField)e.Row.FindControl("hfUserID");
                    oAnswerBO.userID = long.Parse(hdf.Value);
                    oAnswerBO.date = DateTime.Parse(day.Date.ToShortDateString());
                    dt = new DataTable();
                    dt = oAnswerBAL.FindAnswer(oAnswerBO);
                    gv.DataSource = dt;
                    gv.DataBind();
                }
            }         
        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }       
    }
}