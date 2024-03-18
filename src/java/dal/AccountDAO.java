/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Account;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountDAO extends DBContext {

    public List<Account> getAll(){
        String sql = "select * from Account where role != 1";
        List<Account> list = new ArrayList<>();
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Account ad = new Account(rs.getString("name"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("email"),
                        rs.getInt("role"));
                
                list.add(ad);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public Account check(String userName, String passWord) {
        String sql = """
                     SELECT [name]
                           ,[Username]
                           ,[Password]
                           ,[email]
                           ,[role]
                       FROM [dbo].[Account]
                       where Username = ? and Password = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, passWord);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Account ad = new Account(rs.getString("name"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("email"),
                        rs.getInt("role"));

                return ad;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public Account checkUserName(String user) {
        String sql = """
                     SELECT  [name]
                            ,[Username]
                            ,[Password]
                            ,[email]
                            ,[role]
                       FROM [dbo].[Account]
                       where Username = ?""";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Account ad = new Account(rs.getString("name"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("email"),
                        rs.getInt("role"));
                return ad;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void addUser(String name, String user, String pass, String email) {
        String sql = """
                     INSERT INTO [dbo].[Account]
                                ([name]
                                ,[Username]
                                ,[Password]
                                ,[email]
                                ,[role])
                          VALUES
                                (?,?,?,?,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, user);
            st.setString(3, pass);
            st.setString(4, email);
            st.setInt(5, 2);
            st.executeUpdate();

        } catch (SQLException e) {

        }
    }
    public void deleteUser(String user) {
        String sql = "delete Account where Username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.executeUpdate();

        } catch (SQLException e) {

        }
    }

    public Account getAccountByUser(String user) {
        String sql = "SELECT [name]\n"
                + "      ,[Username]\n"
                + "      ,[Password]\n"
                + "      ,[email]\n"
                + "      ,[role]\n"
                + "  FROM [dbo].[Account]\n"
                + "  where Username = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Account ac = new Account(rs.getString("name"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("email"),
                        rs.getInt("role"));

                return ac;
            }
        } catch (Exception e) {
        }
        return null;
    }
    //
public List<Account> findallaccount(){
    List<Account> list = new ArrayList<>();
        String sql = "SELECT [name]\n"
                + "      ,[Username]\n"
                + "      ,[Password]\n"
                + "      ,[email]\n"
                + "      ,[role]\n"
                + "  FROM [dbo].[Account]\n"
                ;

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Account ac = new Account(rs.getString("name"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("email"),
                        rs.getInt("role"));
                list.add(ac);
                
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
    public void updateUser(String name, String user, String pass, String email) {
        String sql = """
                     UPDATE [dbo].[Account]
                                   SET [name] = ?
                                      ,[Password] = ?
                                      ,[email] = ?
                                      ,[role] = ?
                                 WHERE Username = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, pass);
            st.setString(3, email);
            st.setInt(4, 2);
            st.setString(5, user);
            st.executeUpdate();

        } catch (SQLException e) {

        }
    }
    
    public void updateUser2(String pass, int role, String user) {
        String sql = """
                     UPDATE [dbo].[Account]
                                   SET [Password] = ?
                                      ,[role] = ?
                                 WHERE Username = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setInt(2, role);
            st.setString(3, user);
            st.executeUpdate();

        } catch (SQLException e) {

        }
    }
    public static void main(String[] args) {
        for (Account acc : new AccountDAO().findallaccount()) {
            System.out.println(acc);
        }
    }
}
