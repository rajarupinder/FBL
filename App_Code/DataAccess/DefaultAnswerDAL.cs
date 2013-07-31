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
/// Summary description for DefaultAnswerDAL
/// </summary>
public class DefaultAnswerDAL
{    
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FBL"].ConnectionString);
    SqlCommand cmd;    
    SqlDataReader drd;
    SqlDataAdapter dad;    
    DataSet dst;
    DataTable dt;
    string query;

    public DefaultAnswerDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}    
    public DataTable FindDefaultAnswer(DefaultAnswerBO oDefaultAnswerBO)
    {
        try
        {
            query = @"SELECT QuestionType.QTypeID, ISNULL(Stuff((SELECT ',' + answer 
                        FROM DefaultAnswer DA
                        LEFT JOIN Question Q
                        ON DA.questionID = Q.questionID
                        WHERE Question.questionID = DA.questionID 
                        FOR XML PATH('')),1,1,''), '') defaultAnswers, control
		                FROM Question
                        INNER JOIN QuestionType
                        ON Question.QTypeID = QuestionType.QTypeID
                        WHERE Question.questionID = @questionID									
                        ORDER BY questionID";
            dad = new SqlDataAdapter(query, con);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            dt = new DataTable();
            dad.SelectCommand.Parameters.AddWithValue("@questionID", oDefaultAnswerBO.questionID);      
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
