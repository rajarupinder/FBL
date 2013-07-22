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
/// Summary description for AnswerDAL
/// </summary>
public class AnswerDAL
{    
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FBL"].ConnectionString);
    SqlCommand cmd;    
    SqlDataReader drd;
    SqlDataAdapter dad;    
    DataSet dst;
    DataTable dt;
    string query;

    public AnswerDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string InsertAnswer(AnswerBO oAnswerBO)
    {
        try
        {
            cmd = new SqlCommand("InsertAnswer", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.Parameters.AddWithValue("@answer", oAnswerBO.answer);
            cmd.Parameters.AddWithValue("@questionID", oAnswerBO.questionID);
            cmd.Parameters.AddWithValue("@userID", oAnswerBO.userID);            
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
    public void UpdateAnswer(AnswerBO oAnswerBO)
    {
        try
        {
            query = "UPDATE Answer set answer=@answer, date=GETDATE() WHERE answerID=@answerID";
            cmd = new SqlCommand(query, con);            
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.Parameters.AddWithValue("@answer", oAnswerBO.answer);
            cmd.Parameters.AddWithValue("@answerID", oAnswerBO.answerID);            
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
    public void DeleteAnswer(AnswerBO oAnswerBO)
    {
        try
        {
            query = "DELETE FROM Answer WHERE answerID=@answerID";
            cmd = new SqlCommand(query, con);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }            
            cmd.Parameters.AddWithValue("@answerID", oAnswerBO.answerID);         
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
    public DataTable SelectAnswer(AnswerBO oAnswerBO)
    {
        try
        {
            query = @"SELECT answerID, question, answer FROM Answer 
                        INNER JOIN Question
                        ON Answer.questionID = Question.questionID
                        WHERE userID = @userID
                        ORDER BY answerID";
            dad = new SqlDataAdapter(query, con);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            dad.SelectCommand.Parameters.AddWithValue("@userID", oAnswerBO.userID);         
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
    public DataTable FindAnswer(AnswerBO oAnswerBO)
    {
        try
        {
            query = @"SELECT question, answer FROM Answer 
                        INNER JOIN Question
                        ON Answer.questionID = Question.questionID
                        INNER JOIN UserDetail
                        ON Answer.userID = UserDetail.userID
                        WHERE DATEADD(D, 0, DATEDIFF(D, 0, date)) = DATEADD(D, 0, DATEDIFF(D, 0, @date))
                        AND Answer.userID = @userID
                        ORDER BY answerID";
            dad = new SqlDataAdapter(query, con);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            dad.SelectCommand.Parameters.AddWithValue("@userID", oAnswerBO.userID);
            dad.SelectCommand.Parameters.AddWithValue("@date", oAnswerBO.date);
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
