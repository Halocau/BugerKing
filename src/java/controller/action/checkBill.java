/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.action;

import dal.ProductsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Product;
import model.bill;

/**
 *
 * @author Admin
 */
@WebServlet(name="checkBill", urlPatterns={"/checkBill"})
public class checkBill extends HttpServlet {
   
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
            out.println("<title>Servlet checkBill</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet checkBill at " + request.getContextPath () + "</h1>");
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
        String username = request.getParameter("user");
        String pid = request.getParameter("pid");
        String quantity = request.getParameter("quantity");
        String sumprice = request.getParameter("sumprice");
        ProductsDAO p = new ProductsDAO();
        
        int quantity_int;
        float sumprice_float;
        try {
            sumprice_float = Float.parseFloat(sumprice);
            Product x = p.getProductById(pid);
            quantity_int = Integer.parseInt(quantity);
            
            p.updateQuantityOfProductById(x.getQuantity() - quantity_int, pid);
            
            p.deleteBill(username, quantity_int, pid);
            
            List<bill> b = p.getAllBill();
            session.setAttribute("bill", b);
            
            float test = 0;
            if(session.getAttribute("money")!=null){
                test = (float) session.getAttribute("money");
            }
            session.setAttribute("money", test + sumprice_float);
            
        } catch (Exception e) {
        }
        
        response.sendRedirect("manage");
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
        processRequest(request, response);
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
