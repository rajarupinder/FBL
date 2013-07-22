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
/// Summary description for QuestionBAL
/// </summary>
public class QuestionBAL
{   
    QuestionDAL oQuestionDAL = new QuestionDAL();

    public QuestionBAL()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string InsertQuestion(QuestionBO oQuestionBO)
    {
        try
        {
            return oQuestionDAL.InsertQuestion(oQuestionBO);
        }
        catch
        {
            throw;
        }
        finally
        {

        }
    }
    public void UpdateQuestion(QuestionBO oQuestionBO)
    {
        try
        {
            oQuestionDAL.UpdateQuestion(oQuestionBO);
        }
        catch
        {
            throw;
        }
        finally
        {

        }
    }
    public void DeleteQuestion(QuestionBO oQuestionBO)
    {
        try
        {
            oQuestionDAL.DeleteQuestion(oQuestionBO);
        }
        catch
        {
            throw;
        }
        finally
        {

        }
    }
    public DataTable SelectQuestion()
    {
        try
        {
            return oQuestionDAL.SelectQuestion();
        }
        catch
        {
            throw;
        }
        finally
        {

        }
    }        
    public DataTable FindQuestion(QuestionBO oQuestionBO)
    {
        try
        {
            return oQuestionDAL.FindQuestion(oQuestionBO);
        }
        catch
        {
            throw;
        }
        finally
        {

        }
    }
    public DataTable SelectDailyQuestion(string userID)
    {
        try
        {
            return oQuestionDAL.SelectDailyQuestion(userID);
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
