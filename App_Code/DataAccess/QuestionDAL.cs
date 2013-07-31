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
/// Summary description for QuestionDAL
/// </summary>
public class QuestionDAL
{    
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FBL"].ConnectionString);
    SqlCommand cmd;    
    SqlDataReader drd;
    SqlDataAdapter dad;    
    DataSet dst;
    DataTable dt;
    string query;

    public QuestionDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string InsertQuestion(QuestionBO oQuestionBO, DefaultAnswerBO oDefaultAnswerBO)
    {
        try
        {
            cmd = new SqlCommand("InsertQuestion", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.Parameters.AddWithValue("@question", oQuestionBO.question);
            cmd.Parameters.AddWithValue("@QTypeID", oQuestionBO.QTypeID);
            cmd.Parameters.AddWithValue("@answer", oDefaultAnswerBO.answer);
            cmd.Parameters.AddWithValue("@QRID", oQuestionBO.QRID);
            cmd.Parameters.AddWithValue("@status", oQuestionBO.status);            
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
    public void UpdateQuestion(QuestionBO oQuestionBO)
    {
        try
        {
            query = "UPDATE Question set QRID=@QRID, status=@status WHERE questionID=@questionID";
            cmd = new SqlCommand(query, con);            
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.Parameters.AddWithValue("@questionID", oQuestionBO.questionID);            
            cmd.Parameters.AddWithValue("@QRID", oQuestionBO.QRID);
            cmd.Parameters.AddWithValue("@status", oQuestionBO.status);           
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
    public void DeleteQuestion(QuestionBO oQuestionBO)
    {
        try
        {
            query = "DELETE FROM Question WHERE questionID=@questionID";
            cmd = new SqlCommand(query, con);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.Parameters.AddWithValue("@questionID", oQuestionBO.questionID);            
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
    public DataTable SelectQuestion()
    {
        try
        {
            query = @"SELECT *, ISNULL(Stuff((SELECT ',' + answer 
                        FROM DefaultAnswer DA
                        LEFT JOIN Question Q
                        ON DA.questionID = Q.questionID
                        WHERE Question.questionID = DA.questionID 
                        FOR XML PATH('')),1,1,''), '') defaultAnswers
		                FROM Question
                        INNER JOIN QuestionRepitation
                        ON Question.QRID = QuestionRepitation.QRID												
                        ORDER BY questionID DESC";
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
    public DataTable FindQuestion(QuestionBO oQuestionBO)
    {
        try
        {
            query = @"SELECT *, ISNULL(Stuff((SELECT ',' + answer 
                        FROM DefaultAnswer DA
                        LEFT JOIN Question Q
                        ON DA.questionID = Q.questionID
                        WHERE Question.questionID = DA.questionID 
                        FOR XML PATH('')),1,1,''), '') defaultAnswers
		                FROM Question
                        INNER JOIN QuestionRepitation
                        ON Question.QRID = QuestionRepitation.QRID
                        WHERE question LIKE '%' + @question +'%'
                        ORDER BY questionID DESC";
            dad = new SqlDataAdapter(query, con);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            dad.SelectCommand.Parameters.AddWithValue("@question", oQuestionBO.question);
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
    public DataTable SelectDailyQuestion(string userID)
    {
        try
        {
            dad = new SqlDataAdapter("DailyQuestion", con);
            dad.SelectCommand.CommandType = CommandType.StoredProcedure;            
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            dad.SelectCommand.Parameters.AddWithValue("@userID", userID);
            SqlParameter message = dad.SelectCommand.Parameters.Add("@message", SqlDbType.VarChar, 500);
            message.Direction = ParameterDirection.Output;
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
