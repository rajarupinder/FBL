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
/// Summary description for AnswerBO
/// </summary>
public class AnswerBO
{
    public long answerID
    {
        get;
        set;
    }
    public string answer
    {
        get;
        set;
    }
    public long questionID
    {
        get;
        set;
    }
    public long userID
    {
        get;
        set;
    }
    public DateTime date
    {
        get;
        set;
    }   
}
