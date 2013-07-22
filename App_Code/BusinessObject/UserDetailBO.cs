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

/// <summary>
/// Summary description for UserDetailBO
/// </summary>
public class UserDetailBO
{
    public long userID
    {
        get;
        set;
    }
    public long employeeID
    {
        get;
        set;
    }
    public string name
    {
        get;
        set;
    }
    public string designation
    {
        get;
        set;
    }
    public string email
    {
        get;
        set;
    }
    public string mobileNo
    {
        get;
        set;
    }
    public string username
    {
        get;
        set;
    }
    public string password
    {
        get;
        set;
    }
    public bool isAdmin
    {
        get;
        set;
    }
    public bool status
    {
        get;
        set;
    }
}
