/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.LogIn;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author Account
 */
@WebServlet(name = "checkLogin", urlPatterns = {"/checkLogin"})
public class checkLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet checkLogin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet checkLogin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String email = request.getParameter("email");
        String confirmPass = request.getParameter("confirmPass");

        AccountDAO ad = new AccountDAO();
        if (ad.checkUserName(user) != null) {
            request.setAttribute("duplicateUser", "duplicate user name");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            if (name.matches("^[a-zA-Z]+(?: [a-zA-Z]+)*$")) {
                if (user.matches("^[a-zA-Z0-9]*$")) {
                    if (!email.equalsIgnoreCase("anhtdhe172879@fpt.edu.vn")) {
                        if (pass.equals(confirmPass)) {
                            ad.addUser(name, user, pass, email);
                            request.setAttribute("successfully", "Registered successfully");
                            request.getRequestDispatcher("register.jsp").forward(request, response);
                        } else {
                            request.setAttribute("passwordNotMatch", "passwords do not match");
                            request.getRequestDispatcher("register.jsp").forward(request, response);
                        }
                    } else {
                        request.setAttribute("emailFail", "Please re-enter your email");
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("usernameFail", "Username contains only letters and numbers");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("nameFail", "Name contains only letters");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
