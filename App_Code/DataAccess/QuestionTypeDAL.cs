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
/// Summary description for QuestionTypeDAL
/// </summary>
public class QuestionTypeDAL
{
    
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FBL"].ConnectionString);
    SqlCommand cmd;    
    SqlDataReader drd;
    SqlDataAdapter dad;    
    DataSet dst;
    DataTable dt;
    string query;

    public QuestionTypeDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable SelectQuestionType()
    {
        try
        {
            query = "SELECT * FROM QuestionType ORDER BY type";
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
}
