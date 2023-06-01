using EuphoriaInfotech.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace EuphoriaInfotech.Repository
{
    public class AccountRepo
    {
        private SqlConnection con;   
        private void connection()
        {
            string constr = ConfigurationManager.ConnectionStrings["EuphoriaDB"].ToString();
            con = new SqlConnection(constr);
        }
        public bool UserRegister(UserRegistration userRegistration)
        {
            connection();
            SqlCommand com = new SqlCommand("Sp_UserRegister", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Name", userRegistration.Name);
            com.Parameters.AddWithValue("@Address", userRegistration.Address);
            com.Parameters.AddWithValue("@UserName", userRegistration.UserName);
            com.Parameters.AddWithValue("@Password", userRegistration.Password);
            com.Parameters.AddWithValue("@RoleName", userRegistration.RoleName);
            con.Open();
            int i = com.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool TransactionYear(TransactionYearMaster transactionYearMaster)
        {
            connection();
            SqlCommand com = new SqlCommand("TransactionYearName", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@TransactionYearName",transactionYearMaster.TransactionYearName);
            com.Parameters.AddWithValue("@FromMonth",  transactionYearMaster.FromMonth);
            com.Parameters.AddWithValue("@ToMonth", transactionYearMaster.ToMonth);
            con.Open();
            int i = com.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public List<UserRegistration> GetAllData()
        {
            connection();
            List<UserRegistration>users = new List<UserRegistration>();


            SqlCommand com = new SqlCommand("Sp_GetAllData", con);
            com.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();

            con.Open();
            da.Fill(dt);
            con.Close();
            foreach (DataRow dr in dt.Rows)
            {

                users.Add(

                    new UserRegistration
                    {

                        Id = Convert.ToInt32(dr["Id"]),
                        Name = Convert.ToString(dr["Name"]),
                        UserName = Convert.ToString(dr["UserName"]),
                        Password = Convert.ToString(dr["Password"]),
                        //RoleName = Convert.(dr["RoleName"]),
                        Address = Convert.ToString(dr["Address"])

                    }
                    );
            }

            return users;
        }
    }
}