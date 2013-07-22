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
/// Summary description for UserDetailBAL
/// </summary>
public class UserDetailBAL
{   
    UserDetailDAL oUserDetailDAL = new UserDetailDAL();

    public UserDetailBAL()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string InsertUserDetail(UserDetailBO oUserDetailBO)
    {
        try
        {
            return oUserDetailDAL.InsertUserDetail(oUserDetailBO);
        }
        catch
        {
            throw;
        }
        finally
        {

        }
    }
    public string[] LoginValidity(UserDetailBO oUserDetailBO)
    {
        try
        {
            return oUserDetailDAL.LoginValidity(oUserDetailBO);
        }
        catch
        {
            throw;
        }
        finally
        {

        }
    }
    public void UpdateUserDetail(UserDetailBO oUserDetailBO)
    {
        try
        {
            oUserDetailDAL.UpdateUserDetail(oUserDetailBO);
        }
        catch
        {
            throw;
        }
        finally
        {

        }
    }
    public void DeleteUserDetail(UserDetailBO oUserDetailBO)
    {
        try
        {
            oUserDetailDAL.DeleteUserDetail(oUserDetailBO);
        }
        catch
        {
            throw;
        }
        finally
        {

        }
    }
    public DataTable SelectUserDetail()
    {
        try
        {
            return oUserDetailDAL.SelectUserDetail();
        }
        catch
        {
            throw;
        }
        finally
        {

        }
    }
    public DataTable SelectActiveUserDetail()
    {
        try
        {
            return oUserDetailDAL.SelectActiveUserDetail();
        }
        catch
        {
            throw;
        }
        finally
        {

        }
    }
    public DataTable FindUserDetail(UserDetailBO oUserDetailBO)
    {
        try
        {
            return oUserDetailDAL.FindUserDetail(oUserDetailBO);
        }
        catch
        {
            throw;
        }
        finally
        {

        }
    }        
}
