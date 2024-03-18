/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;
import model.bill;

/**
 *
 * @author Admin
 */
public class ProductsDAO extends DBContext {

    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Categories";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("id"),
                        rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Category getCategoryById(int id) {
        String sql = "select * from Categories where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt("id"), rs.getString("name"));
                return c;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getproductByCid(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = """
                     SELECT [id]
                           ,[name]
                           ,[quantity]
                           ,[price]
                           ,[describe]
                           ,[image]
                           ,[cid]  
                       FROM [dbo].[Products]
                       where 1=1""";
        if (cid != 0) {
            sql = sql + "and cid = " + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);

            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Product> getproductByCid2(String id, int cid) {
        List<Product> list = new ArrayList<>();
        String sql = """
                     SELECT [id]
                           ,[name]
                           ,[quantity]
                           ,[price]
                           ,[describe]
                           ,[image]
                           ,[cid]
                       FROM [dbo].[Products]
                       where 1=1 and id != ? and cid = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.setInt(2, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);

            }
        } catch (SQLException e) {

        }
        return list;
    }

    public void addProduct(String id, String name, int quantity, double price, String describe, String image, int cid) {
        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([id]\n"
                + "           ,[name]\n"
                + "           ,[quantity]\n"
                + "           ,[price]\n"
                + "           ,[describe]\n"
                + "           ,[image]\n"
                + "           ,[cid])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.setString(2, name);
            st.setInt(3, quantity);
            st.setDouble(4, price);
            st.setString(5, describe);
            st.setString(6, image);
            st.setInt(7, cid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteProductById(String id) {
        String sql = "DELETE FROM [dbo].[Products]\n"
                + "      WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);

            st.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public Product getProductById(String id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[describe]\n"
                + "      ,[image]\n"
                + "      ,[cid]\n"
                + "  FROM [dbo].[Products]\n"
                + "  where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateProductById(String name, int quantity, double price, String describe, String image, int cid, String id) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [name] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[describe] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[cid] = ?\n"
                + " WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, quantity);
            st.setDouble(3, price);
            st.setString(4, describe);
            st.setString(5, image);
            st.setInt(6, cid);
            st.setString(7, id);

            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateQuantityOfProductById(int quantity, String id) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [quantity] = ?\n"
                + " WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setString(2, id);

            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Product> searchProductByPrice(float price) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where price > ? and price < 500";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setFloat(1, price);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);

                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> searchProductByName(String name) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where name like ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1,"%" + name + "%");

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);

                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    //đây là 1 hàm tự tạo để search theo giá
    public List<Product> searchProductBySort(int idx) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products";

        switch (idx) {
            case 1:
                sql += " ORDER BY [name] ASC";
                break;
            case 2:
                sql += " ORDER BY [price] DESC";
                break;
            case 3:
                sql += " ORDER BY [price] ASC";
                break;
            default:
                break;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Product> searchProductByPrice(int idx) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products";
        switch (idx) {
            case 1:
                sql += " where price > 0 and price < 100";
                break;
            case 2:
                sql += " where price >= 100 and price < 200";
                break;
            case 3:
                sql += " where price >= 200";
                break;
            default:
                break;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<bill> getAllBill() {
        List<bill> list = new ArrayList<>();
        String sql = "select * from bill";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                bill b = new bill();
                b.setName(rs.getString("name"));
                b.setUsername(rs.getString("username"));
                b.setPhone(rs.getString("phone"));
                b.setEmail(rs.getString("email"));
                b.setAddress(rs.getString("address"));
                b.setQuantity(rs.getInt("quantity"));
                b.setSumprice(rs.getFloat("sumprice"));
                Product p = getProductById(rs.getString("pid"));
                b.setProduct(p);

                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void addBill(String name, String username, String phone, String email, String address, int quantity, float sumprice, String pid) {
        String sql = "INSERT INTO [dbo].[bill]\n"
                + "           ([name]\n"
                + "           ,[username]\n"
                + "           ,[phone]\n"
                + "           ,[email]\n"
                + "           ,[address]\n"
                + "           ,[quantity]\n"
                + "           ,[sumprice]\n"
                + "           ,[pid])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, username);
            st.setString(3, phone);
            st.setString(4, email);
            st.setString(5, address);
            st.setInt(6, quantity);
            st.setFloat(7, sumprice);
            st.setString(8, pid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void deleteBill(String username, int quantity, String pid) {
        String sql = "delete bill where username = ? and quantity = ? and pid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setInt(2, quantity);
            st.setString(3, pid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
}
