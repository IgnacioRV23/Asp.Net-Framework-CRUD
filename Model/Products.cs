using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Asp.Net_Framework_CRUD.Model
{
    public class Products
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

        public DataTable GetRows()
        {
            DataTable Products = new DataTable();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open(); // Opens a connection to the database

                    // Creates a SqlCommand to execute the stored procedure "Products_GetRows"
                    SqlCommand sqlComm = new SqlCommand("Products_GetRows", conn);

                    // Specifies that the command is a stored procedure
                    sqlComm.CommandType = CommandType.StoredProcedure; 

                    // Fills the DataTable 'Products' with the result set of the stored procedure
                    SqlDataAdapter adapter = new SqlDataAdapter(sqlComm);
                    adapter.Fill(Products);

                    // Closes the database connection
                    conn.Close(); 
                }
            }
            catch { }

            return Products;
        }






    }
}