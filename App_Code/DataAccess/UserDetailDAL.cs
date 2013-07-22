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
using System.Data.SqlClient;

/// <summary>
/// Summary description for UserDetailDAL
/// </summary>
public class UserDetailDAL
{
    
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FBL"].ConnectionString);
    SqlCommand cmd;    
    SqlDataReader drd;
    SqlDataAdapter dad;    
    DataSet dst;
    DataTable dt;
    string query;

    public UserDetailDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string InsertUserDetail(UserDetailBO oUserDetailBO)
    {
        try
        {
            cmd = new SqlCommand("InsertUserDetail", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.Parameters.AddWithValue("@employeeID", oUserDetailBO.employeeID);
            cmd.Parameters.AddWithValue("@name", oUserDetailBO.name);
            cmd.Parameters.AddWithValue("@designation", oUserDetailBO.designation);
            cmd.Parameters.AddWithValue("@email", oUserDetailBO.email);
            cmd.Parameters.AddWithValue("@mobileNo", oUserDetailBO.mobileNo);
            cmd.Parameters.AddWithValue("@username", oUserDetailBO.username);
            cmd.Parameters.AddWithValue("@password", oUserDetailBO.password);
            cmd.Parameters.AddWithValue("@isAdmin", oUserDetailBO.isAdmin);
            cmd.Parameters.AddWithValue("@status", oUserDetailBO.status);
            SqlParameter message = cmd.Parameters.Add("@message", SqlDbType.VarChar, 500);
            message.Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            return message.Value.ToString();
        }
        catch
        {
            throw;
        }
        finally
        {
            con.Close();
        }
    }
    public string[] LoginValidity(UserDetailBO oUserDetailBO)
    {
        try
        {
            cmd = new SqlCommand("LoginValidity", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.Parameters.AddWithValue("@username", oUserDetailBO.username);
            cmd.Parameters.AddWithValue("@password", oUserDetailBO.password);
            SqlParameter userID = cmd.Parameters.Add("@userID", SqlDbType.VarChar, 500);
            userID.Direction = ParameterDirection.Output;
            SqlParameter isAdmin = cmd.Parameters.Add("@isAdmin", SqlDbType.VarChar, 500);
            isAdmin.Direction = ParameterDirection.Output;
            SqlParameter message = cmd.Parameters.Add("@message", SqlDbType.VarChar, 500);
            message.Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            string[] outParm = new string[3];
            outParm[0] = userID.Value.ToString();
            outParm[1] = isAdmin.Value.ToString();
            outParm[2] = message.Value.ToString();
            return outParm;
        }
        catch
        {
            throw;
        }
        finally
        {
            con.Close();
        }
    }
    public void UpdateUserDetail(UserDetailBO oUserDetailBO)
    {
        try
        {
            query = "UPDATE UserDetail set status=@status WHERE userID=@userID";
            cmd = new SqlCommand(query, con);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.Parameters.AddWithValue("@userID", oUserDetailBO.userID);
            cmd.Parameters.AddWithValue("@status", oUserDetailBO.status);
            cmd.ExecuteNonQuery();
        }
        catch
        {
            throw;
        }
        finally
        {
            con.Close();
        }
    }
    public void DeleteUserDetail(UserDetailBO oUserDetailBO)
    {
        try
        {
            query = "DELETE FROM UserDetail WHERE userID=@UserID";
            cmd = new SqlCommand(query, con);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.Parameters.AddWithValue("@UserID", oUserDetailBO.userID);
            cmd.ExecuteNonQuery();
        }
        catch
        {
            throw;
        }
        finally
        {
            con.Close();
        }
    }    
    public DataTable SelectUserDetail()
    {
        try
        {
            query = @"SELECT * FROM UserDetail
                        ORDER BY name DESC";
            dad = new SqlDataAdapter(query, con);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            dt = new DataTable();
            dad.Fill(dt);
            return dt;
        }
        catch
        {
            throw;
        }
        finally
        {
            con.Close();
        }
    }
    public DataTable SelectActiveUserDetail()
    {
        try
        {
            query = @"SELECT * FROM UserDetail
                        WHERE status = 1
                        ORDER BY name DESC";
            dad = new SqlDataAdapter(query, con);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            dt = new DataTable();
            dad.Fill(dt);
            return dt;
        }
        catch
        {
            throw;
        }
        finally
        {
            con.Close();
        }
    }
    public DataTable FindUserDetail(UserDetailBO oUserDetailBO)
    {
        try
        {
            query = @"SELECT * FROM UserDetail                         
                        WHERE name LIKE '%' + @name +'%'
                        ORDER BY name DESC";
            dad = new SqlDataAdapter(query, con);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            dad.SelectCommand.Parameters.AddWithValue("@name", oUserDetailBO.name);
            dt = new DataTable();
            dad.Fill(dt);
            return dt;
        }
        catch
        {
            throw;
        }
        finally
        {
            con.Close();
        }
    }    
}
