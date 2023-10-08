/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author SANG
 */
public class Register extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        String msgverify = (String) session.getAttribute("msg1");
        session.removeAttribute("msg1");
        request.setAttribute("msgverify", msgverify);
        //String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        request.getRequestDispatcher("/Register/register.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String birthdate = request.getParameter("birthdate");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");
        String re_password = request.getParameter("re_password");
        String Phone = request.getParameter("Phone");
        String Address = request.getParameter("Address");
        String msg;
        int checkfailed = 0;  //test verify input
        UserDAO ud = new UserDAO();
        if (!password.equals(re_password)) {
            msg = "Re-Password not like pasword";
            checkfailed = 1;
        } else if (validatePhone(Phone) != null) {
            msg = validatePhone(Phone);
            checkfailed = 1;
        } else if (validatePass(password) != null) {
            msg = validatePass(password);
            checkfailed = 1;
        } else {
            boolean check = ud.RegisterUser(fname, lname, email, birthdate, gender, password, Phone, Address);
            if (check) {
                msg = "CHECK MAIL PLEASE";
                checkfailed = 0;
            } else {
                msg = "Email has been registered";
                checkfailed = 1;
            }
        }
        url += "/Register/index.jsp";
        request.setAttribute("msg", msg);
        request.setAttribute("checkfailed", checkfailed);
        if (checkfailed == 1) {
            request.setAttribute("fname", fname);
            request.setAttribute("lname", lname);
            request.setAttribute("email", email);
            request.setAttribute("birthdate", birthdate);
            request.setAttribute("gender", gender);
            request.setAttribute("password", password);
            request.setAttribute("re_password", re_password);
            request.setAttribute("Phone", Phone);
            request.setAttribute("Address", Address);
            
        }
        request.getRequestDispatcher("/Register/register.jsp").forward(request, response);
    }

    public String validatePhone(String p) {
        if (p == null ) {
            return "Phone not empty ";
        }else if(p.length()!=10){
             return "Phone must 10 numbers and correct format";
        }
        return null;
    }

    public String validatePass(String p) {
        if (p == null || !p.matches("^[a-zA-Z0-9]{6,16}$")) {
            return "Password must be between 6 and 16 characters";
        }
        return null;
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
