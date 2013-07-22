using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Feedback : System.Web.UI.Page
{
    QuestionBO oQuestionBO = new QuestionBO();
    QuestionBAL oQuestionBAL = new QuestionBAL();
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
                if (Page.IsPostBack == false)
                {
                    BindQuestion();
                    BindGrid();            
                }
            }
        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }
    public void BindQuestion()
    {         
        DataTable dt = new DataTable();
        dt = oQuestionBAL.SelectDailyQuestion(Session["userID"].ToString());
        drpQuestion.DataSource = dt;
        drpQuestion.DataSource = dt;
        drpQuestion.DataTextField = "qus";
        drpQuestion.DataValueField = "qusID";
        drpQuestion.DataBind();
        if (dt.Rows.Count == 0)
        {
            btnSubmit.Enabled = false;
        }
        else
        {
            btnSubmit.Enabled = true; 
        }
    }
    public void BindGrid()
    {
        oAnswerBO.userID = long.Parse(Session["userID"].ToString());   
        dt = new DataTable();
        dt = oAnswerBAL.SelectAnswer(oAnswerBO);        
        dgrdQuestion.DataSource = dt;        
        dgrdQuestion.DataBind();    
    } 
    protected void dgrdQuestion_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            dgrdQuestion.PageIndex = e.NewPageIndex;
            BindGrid();
        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }            
    protected void dgrdQuestion_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            oAnswerBO.answerID = long.Parse(((HiddenField)(dgrdQuestion.Rows[e.RowIndex].FindControl("hfAnswerID"))).Value);
            oAnswerBAL.DeleteAnswer(oAnswerBO);
            BindQuestion();
            BindGrid();            
        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }
    protected void dgrdQuestion_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            dgrdQuestion.EditIndex = e.NewEditIndex;
            BindGrid();          
        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }
    protected void dgrdQuestion_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            oAnswerBO.answerID = long.Parse(((HiddenField)(dgrdQuestion.Rows[e.RowIndex].FindControl("hfAnswerID"))).Value);
            oAnswerBO.answer = ((TextBox)(dgrdQuestion.Rows[e.RowIndex].FindControl("txtAnswer"))).Text;
            oAnswerBAL.UpdateAnswer(oAnswerBO);     
            dgrdQuestion.EditIndex = -1;
            BindGrid();
        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }
    protected void dgrdQuestion_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            dgrdQuestion.EditIndex = -1;
            BindGrid();
        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }
    protected void dgrdQuestion_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
           
        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    } 
    public void Clear()
    {
        foreach (Control controls in Form.Controls)
        {
            if (controls is TextBox)
            {
                TextBox txt = (TextBox)controls;
                txt.Text = "";
            }
            if (controls is DropDownList)
            {
                DropDownList drop = (DropDownList)controls;
                drop.ClearSelection();
            }
            if (controls is RadioButtonList)
            {
                RadioButtonList rbtnl = (RadioButtonList)controls;
                rbtnl.ClearSelection();
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            oAnswerBO.answer = txtAnswer.Text;
            oAnswerBO.questionID = long.Parse(drpQuestion.SelectedValue);
            oAnswerBO.userID = long.Parse(Session["userID"].ToString());
            oAnswerBAL.InsertAnswer(oAnswerBO);
            BindQuestion();
            BindGrid();
            txtAnswer.Text = String.Empty;
        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }
}