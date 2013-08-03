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
/// Summary description for AnswerBAL
/// </summary>
public class AnswerBAL
{   
    AnswerDAL oAnswerDAL = new AnswerDAL();

    public AnswerBAL()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string InsertAnswer(AnswerBO oAnswerBO)
    {
        try
        {
            return oAnswerDAL.InsertAnswer(oAnswerBO);
        }
        catch
        {
            throw;
        }
        finally
        {

        }
    }
    public void UpdateAnswer(AnswerBO oAnswerBO)
    {
        try
        {
            oAnswerDAL.UpdateAnswer(oAnswerBO);
        }
        catch
        {
            throw;
        }
        finally
        {

        }
    }
    public void DeleteAnswer(AnswerBO oAnswerBO)
    {
        try
        {
            oAnswerDAL.DeleteAnswer(oAnswerBO);
        }
        catch
        {
            throw;
        }
        finally
        {

        }
    }
    public DataTable SelectAnswer(AnswerBO oAnswerBO)
    {
        try
        {
            return oAnswerDAL.SelectAnswer(oAnswerBO);
        }
        catch
        {
            throw;
        }
        finally
        {

        }
    }
    public DataTable FindAnswer(AnswerBO oAnswerBO)
    {
        try
        {
            return oAnswerDAL.FindAnswer(oAnswerBO);
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
