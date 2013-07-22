using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Question : System.Web.UI.Page
{
    QRBAL oQRBAL = new QRBAL();
    QuestionBO oQuestionBO = new QuestionBO();
    QuestionBAL oQuestionBAL = new QuestionBAL();
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
                    BindQR();                
                    BindGrid();                
                }
            }

        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }
    public void BindQR()
    {
        DataTable dt = new DataTable();
        dt = oQRBAL.SelectQR();
        drpQR.DataSource = dt;
        drpQR.DataTextField = "days";
        drpQR.DataValueField = "QRID";
        drpQR.DataBind();     
    }
    public void BindGrid()
    {
        dt = new DataTable();
        dt = oQuestionBAL.SelectQuestion();
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
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            oQuestionBO.question = txtQuestion.Text;
            oQuestionBO.QRID = int.Parse(drpQR.SelectedValue);
            oQuestionBO.status = bool.Parse(rbtnlStatus.SelectedItem.Text);
            ((Label)(Master.FindControl("lblMessage"))).Text = oQuestionBAL.InsertQuestion(oQuestionBO);
            BindGrid();
            Clear();
        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            oQuestionBO.question = txtSearchBox.Text;

            DataTable dt = new DataTable();
            dt = oQuestionBAL.FindQuestion(oQuestionBO);
            dgrdQuestion.DataSource = dt;
            dgrdQuestion.DataBind();
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
            oQuestionBO.questionID = int.Parse(((Label)dgrdQuestion.Rows[e.RowIndex].FindControl("lblID")).Text);
            oQuestionBAL.DeleteQuestion(oQuestionBO);
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
            DataTable dt = new DataTable();
            dt = oQRBAL.SelectQR();
            ((DropDownList)dgrdQuestion.Rows[e.NewEditIndex].FindControl("drpQR")).DataSource = dt;
            ((DropDownList)dgrdQuestion.Rows[e.NewEditIndex].FindControl("drpQR")).DataTextField = "days";
            ((DropDownList)dgrdQuestion.Rows[e.NewEditIndex].FindControl("drpQR")).DataValueField = "QRID";
            ((DropDownList)dgrdQuestion.Rows[e.NewEditIndex].FindControl("drpQR")).DataBind();               
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
            oQuestionBO.questionID = long.Parse(((Label)dgrdQuestion.Rows[e.RowIndex].FindControl("lblID")).Text);
            oQuestionBO.QRID = int.Parse(((DropDownList)dgrdQuestion.Rows[e.RowIndex].FindControl("drpQR")).SelectedValue);
            oQuestionBO.status = bool.Parse(((RadioButtonList)dgrdQuestion.Rows[e.RowIndex].FindControl("rbtnlStatus")).SelectedItem.Text);
            oQuestionBAL.UpdateQuestion(oQuestionBO);
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
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    bool status = bool.Parse(((HiddenField)e.Row.FindControl("hfStatus")).Value);
                    RadioButtonList rbtnl = (RadioButtonList)e.Row.FindControl("rbtnlStatus");

                    if (status == true)
                    {
                        rbtnl.Items[0].Selected = true;
                    }
                    else
                    {
                        rbtnl.Items[1].Selected = true;
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