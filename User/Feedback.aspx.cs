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
                    BindGrid(); ; ;      
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
        ListItem lst = new ListItem(); 
        lst.Value = "0";
        lst.Text = "--select--";
        drpQuestion.Items.Insert(0, lst);

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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            DefaultAnswerBO oDefaultAnswerBO = new DefaultAnswerBO();
            DefaultAnswerBAL oDefaultAnswerBAL = new DefaultAnswerBAL();  
            oDefaultAnswerBO.questionID = long.Parse(drpQuestion.SelectedValue);
            DataTable dt = new DataTable(); 
            dt = oDefaultAnswerBAL.FindDefaultAnswer(oDefaultAnswerBO);

            if (dt.Rows.Count != 0)
            {
                int QTypeId = int.Parse(dt.Rows[0]["QTypeId"].ToString());

                if (QTypeId == 1)
                {
                    oAnswerBO.answer = txtComment.Text;
                }
                else if (QTypeId == 2)
                {
                    string answer = string.Empty;

                    foreach (ListItem listItem in chkMultipleAnswer.Items)
                    {
                        if (listItem.Selected)
                        {
                            answer += listItem.Text + ",";
                        }
                    }
                    if (answer.Length != 0)
                        oAnswerBO.answer = answer.Substring(0, answer.Length - 1);
                    else
                        oAnswerBO.answer = string.Empty;
                }
                else if (QTypeId == 3)
                {
                    string answer = string.Empty;

                    foreach (ListItem listItem in rbtnlOnlyOneAnswer.Items)
                    {
                        if (listItem.Selected)
                        {
                            answer += listItem.Text + ",";
                        }
                    }
                    if (answer.Length != 0)
                        oAnswerBO.answer = answer.Substring(0, answer.Length - 1);
                    else
                        oAnswerBO.answer = string.Empty;
                }
            }
            oAnswerBO.questionID = long.Parse(drpQuestion.SelectedValue);
            oAnswerBO.userID = long.Parse(Session["userID"].ToString());
            oAnswerBAL.InsertAnswer(oAnswerBO);
            BindQuestion();
            BindGrid();
            Clear();
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;
            Panel5.Visible = false;
        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }
    public void Clear()
    {
        txtComment.Text = string.Empty; 
    }
    protected void drpQuestion_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (int.Parse(drpQuestion.SelectedValue) != 0)
            {
                DefaultAnswerBO oDefaultAnswerBO = new DefaultAnswerBO();
                DefaultAnswerBAL oDefaultAnswerBAL = new DefaultAnswerBAL();
                oDefaultAnswerBO.questionID = long.Parse(drpQuestion.SelectedValue);
                DataTable dt = new DataTable();
                dt = oDefaultAnswerBAL.FindDefaultAnswer(oDefaultAnswerBO);

                if (dt.Rows.Count != 0)
                {
                    int QTypeId = int.Parse(dt.Rows[0]["QTypeId"].ToString());
                    string defaultAnswers = dt.Rows[0]["defaultAnswers"].ToString();
                    string control = dt.Rows[0]["control"].ToString();

                    if (QTypeId == 1)
                    {
                        txtComment.Text = string.Empty;

                        Panel1.Visible = true;
                        Panel2.Visible = false;
                        Panel3.Visible = false;
                        Panel4.Visible = false;
                        Panel5.Visible = false;

                        txtComment.Text = defaultAnswers;
                    }
                    else if (QTypeId == 2)
                    {
                        chkMultipleAnswer.Items.Clear();

                        Panel1.Visible = false;
                        Panel2.Visible = true;
                        Panel3.Visible = false;
                        Panel4.Visible = false;
                        Panel5.Visible = false;

                        string[] str = defaultAnswers.Split(',');
                        for (int i = 0; i < str.Length; i++)
                        {
                            ListItem lst = new ListItem();
                            lst.Value = i.ToString();
                            lst.Text = str[i].ToString();
                            chkMultipleAnswer.Items.Add(lst);
                        }
                    }
                    else if (QTypeId == 3)
                    {
                        rbtnlOnlyOneAnswer.Items.Clear();

                        Panel1.Visible = false;
                        Panel2.Visible = false;
                        Panel3.Visible = true;
                        Panel4.Visible = false;
                        Panel5.Visible = false;

                        string[] str = defaultAnswers.Split(',');
                        for (int i = 0; i < str.Length; i++)
                        {
                            ListItem lst = new ListItem();
                            lst.Value = i.ToString();
                            lst.Text = str[i].ToString();
                            rbtnlOnlyOneAnswer.Items.Add(lst);
                        }
                    }
                    else if (QTypeId == 4)
                    {
                        Panel1.Visible = false;
                        Panel2.Visible = false;
                        Panel3.Visible = false;
                        Panel4.Visible = true;
                        Panel5.Visible = false;

                    }
                }
            }
        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }
}