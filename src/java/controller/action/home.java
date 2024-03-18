/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.action;

import dal.AccountDAO;
import dal.ProductsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Category;
import model.Product;
import model.bill;

/**
 *
 * @author Admin
 */
@WebServlet(name="home", urlPatterns={"/home"})
public class home extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet home</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet home at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("mainSuccess", "success");
        session.removeAttribute("introductionSuccess");
        session.removeAttribute("contactSuccess");
        session.removeAttribute("storeSuccess");
        session.removeAttribute("listByPrice");
        session.removeAttribute("listByName");
        session.removeAttribute("listBySort");
        ProductsDAO d = new ProductsDAO();
        AccountDAO a = new AccountDAO();
        List<Category> c = d.getAll();
        List<bill> b = d.getAllBill();
        session.setAttribute("data", c);
        session.setAttribute("bill", b);
        List<Account> ac = a.getAll();
        session.setAttribute("account", ac);
        
        List<Product> list =d.getproductByCid(0);
        session.setAttribute("products", list);
        
        session.setAttribute("role", 2);
        if(session.getAttribute("getRole")!=null){
            if((int)session.getAttribute("getRole")==1)
                session.setAttribute("role", 1);
        }
        request.getRequestDispatcher("home.jsp").forward(request, response);
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        String describe = request.getParameter("describe");
        String image = request.getParameter("image");
        String cid = request.getParameter("cid");
//        List<Product> newList = (List<Product>) session.getAttribute("newList");
        int cid_int, quantity_int;
        float price_float;
        try {
            cid_int = Integer.parseInt(cid);
            quantity_int = Integer.parseInt(quantity);
            price_float = Float.parseFloat(price);
            ProductsDAO db = new ProductsDAO();
            
            Product test = db.getProductById(id);
            
            if(test == null){
                db.addProduct(id, name, quantity_int, price_float, describe, "images/" +image, cid_int);
                List<Category> c = db.getAll();
                session.setAttribute("data", c);
                
//                Product productNew = db.getProductById(id);
                
//                newList.add(productNew);
//                session.setAttribute("newList", newList);
            }else {
                request.setAttribute("duplicateId", "duplicate Id");
                request.getRequestDispatcher("productAdd.jsp").forward(request, response);
            }
            
        } catch (Exception e) {

        }
        
        response.sendRedirect("manage");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
