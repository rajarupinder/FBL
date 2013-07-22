using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_UserDetail : System.Web.UI.Page
{
    QRBAL oQRBAL = new QRBAL();
    UserDetailBO oUserDetailBO = new UserDetailBO();
    UserDetailBAL oUserDetailBAL = new UserDetailBAL();
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
                    BindGrid();                
                }
            }

        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }    
    public void BindGrid()
    {
        dt = new DataTable();
        dt = oUserDetailBAL.SelectUserDetail();
        dgrdUserDetail.DataSource = dt;        
        dgrdUserDetail.DataBind();  
    } 
    protected void dgrdUserDetail_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            dgrdUserDetail.PageIndex = e.NewPageIndex;
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
            oUserDetailBO.employeeID = long.Parse(txtEmployeeID.Text);
            oUserDetailBO.name = txtName.Text;
            oUserDetailBO.designation = txtDesignation.Text;
            oUserDetailBO.email = txtEmail.Text;   
            oUserDetailBO.mobileNo = txtMobile.Text;
            oUserDetailBO.username = txtUsername.Text;
            oUserDetailBO.password = txtPassword.Text;
            oUserDetailBO.isAdmin = bool.Parse(rbtnlIsAdmin.SelectedItem.Text);
            oUserDetailBO.status = bool.Parse(rbtnlStatus.SelectedItem.Text);
            ((Label)(Master.FindControl("lblMessage"))).Text = oUserDetailBAL.InsertUserDetail(oUserDetailBO);
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
            oUserDetailBO.name = txtSearchBox.Text;

            DataTable dt = new DataTable();
            dt = oUserDetailBAL.FindUserDetail(oUserDetailBO);
            dgrdUserDetail.DataSource = dt;
            dgrdUserDetail.DataBind();
        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }
    protected void dgrdUserDetail_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            oUserDetailBO.userID = int.Parse(((Label)dgrdUserDetail.Rows[e.RowIndex].FindControl("lblID")).Text);
            oUserDetailBAL.DeleteUserDetail(oUserDetailBO);
            BindGrid();
        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }
    protected void dgrdUserDetail_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {         
            dgrdUserDetail.EditIndex = e.NewEditIndex;
            BindGrid();          
        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }
    protected void dgrdUserDetail_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            oUserDetailBO.userID = long.Parse(((Label)dgrdUserDetail.Rows[e.RowIndex].FindControl("lblID")).Text);
            oUserDetailBO.status = bool.Parse(((RadioButtonList)dgrdUserDetail.Rows[e.RowIndex].FindControl("rbtnlStatus")).SelectedItem.Text);
            oUserDetailBAL.UpdateUserDetail(oUserDetailBO);
            dgrdUserDetail.EditIndex = -1;
            BindGrid();
        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }
    protected void dgrdUserDetail_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            dgrdUserDetail.EditIndex = -1;
            BindGrid();
        }
        catch (Exception ex)
        {
            ((Label)(Master.FindControl("lblMessage"))).Text = ex.Message.ToString();
        }
    }
    protected void dgrdUserDetail_RowDataBound(object sender, GridViewRowEventArgs e)
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