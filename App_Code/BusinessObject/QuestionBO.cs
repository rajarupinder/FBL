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
/// Summary description for QuestionBO
/// </summary>
public class QuestionBO
{
    public long questionID
    {
        get;
        set;
    }
    public string question
    {
        get;
        set;
    }
    public DateTime postDate
    {
        get;
        set;
    }
    public int QTypeID
    {
        get;
        set;
    }
    public int QRID
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
