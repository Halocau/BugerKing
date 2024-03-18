/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.LinkedHashMap;
import java.util.List;
import model.Account;

/**
 *
 * @author Admin
 */
public class AccountDAO2 extends GenericDAO<Account> {

    @Override
    public List<Account> findAll() {
        return queryGenericDAO();
    }

    @Override
    public int insert(Account t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

 
    public List<Account> check(String user, String pass) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Account]\n"
                + "  WHERE [Username] = ? AND [Password] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("user", user);
        parameterMap.put("pass", pass);
        List<Account> list = queryGenericDAO(sql);
        return list;
    }
       public static void main(String[] args) {
           System.out.println(new AccountDAO2().check("1","1"));
    }

}
