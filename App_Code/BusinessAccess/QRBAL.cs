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
/// Summary description for QRBAL
/// </summary>
public class QRBAL
{
    QRDAL oQRDAL = new QRDAL();

    public QRBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable SelectQR()
    {
        try
        {
            return oQRDAL.SelectQR();
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
