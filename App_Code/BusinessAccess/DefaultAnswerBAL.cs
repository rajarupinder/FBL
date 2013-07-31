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
/// Summary description for DefaultAnswerBAL
/// </summary>
public class DefaultAnswerBAL
{   
    DefaultAnswerDAL oDefaultAnswerDAL = new DefaultAnswerDAL();

    public DefaultAnswerBAL()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataTable FindDefaultAnswer(DefaultAnswerBO oDefaultAnswerBO)
    {
        try
        {
            return oDefaultAnswerDAL.FindDefaultAnswer(oDefaultAnswerBO);
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
