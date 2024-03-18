/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.shopping;

import dal.ProductsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name="bill", urlPatterns={"/bill"})
public class bill extends HttpServlet {
   
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
            out.println("<title>Servlet bill</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet bill at " + request.getContextPath () + "</h1>");
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
        String id = request.getParameter("id");
        
        ProductsDAO db = new ProductsDAO();
        
        if(session.getAttribute("success")!=null){
            Product x = db.getProductById(id);
            
            session.setAttribute("pid", x);
            request.getRequestDispatcher("shopping1.jsp").forward(request, response);
        }else{
            response.sendRedirect("login.jsp");
        }
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
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String quantity = request.getParameter("quantity");
        
        String Pid = request.getParameter("Pid");
        String Pquantity = request.getParameter("Pquantity");
        
        String username = request.getParameter("username");
        ProductsDAO db = new ProductsDAO();
        
        int quantity_int, Pquantity_int;
        try {
            quantity_int = Integer.parseInt(quantity);
            Pquantity_int = Integer.parseInt(Pquantity);
            
            if(Pquantity_int < quantity_int){
                request.setAttribute("quantityFail", "Sản phẩm hiện chỉ còn "+ Pquantity_int + " sản phẩm");
                request.getRequestDispatcher("shopping1.jsp").forward(request, response);
            }
            else{
                Product x = db.getProductById(Pid);
                
                db.addBill(name, username, phone, email, address, quantity_int, (float)(quantity_int * x.getPrice()), Pid);
                
                session.setAttribute("storeSuccess", "success");
                response.sendRedirect("home.jsp");
            }
            
        } catch (Exception e) {
        }
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
