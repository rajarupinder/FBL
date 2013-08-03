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
/// Summary description for QRDAL
/// </summary>
public class QRDAL
{
    
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FBL"].ConnectionString);
    SqlCommand cmd;    
    SqlDataReader drd;
    SqlDataAdapter dad;    
    DataSet dst;
    DataTable dt;
    string query;

    public QRDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}    
    public DataTable SelectQR()
    {
        try
        {
            query = "SELECT * FROM QuestionRepitation ORDER BY days";
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
