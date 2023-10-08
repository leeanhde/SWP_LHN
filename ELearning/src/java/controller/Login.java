/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.User;

/**
 *
 * @author Thanh
 */
public class Login extends HttpServlet {

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
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
        Cookie c[] = request.getCookies();
        String email = "";
        String pass = "";
        String check = null;
        for (int i = 0; i < c.length; i++) {
            if (c[i].getName().equals("checked") && c[i].getValue().equals("checked")) {
                for (int j = 0; j < c.length; j++) {
                    if (c[j].getName().equals("email")) {
                        email = c[j].getValue();
                    }
                }
                for (int j = 0; j < c.length; j++) {
                    if (c[j].getName().equals("pass")) {
                        pass = c[j].getValue();
                    }
                }
                check = c[i].getValue();
                break;
            }
        }
        HttpSession session = request.getSession();
        String msg1 = (String) session.getAttribute("msg1");
        request.setAttribute("msg1", msg1);
        session.removeAttribute("msg1");
        request.setAttribute("email", email);
        request.setAttribute("pass", pass);
        request.setAttribute("check", check);
        //processRequest(request, response);
        //request.setAttribute("failed", "");
        request.getRequestDispatcher("/login/Signin.jsp").forward(request, response);

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
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(600);

        String email = request.getParameter("username");
        String password = request.getParameter("password");
        String checked[] = request.getParameterValues("check");
        String c = "checked";
        if (checked == null) {
            c = "notchecked";
        }
        UserDAO ud = new UserDAO();
        User u = ud.getUserBYEmail(email);
        Cookie cuser = new Cookie("email", email);
        Cookie puser = new Cookie("pass", password);
        Cookie ruser = new Cookie("checked", c);
        ruser.setMaxAge(60 * 60 * 24 * 7);
        response.addCookie(ruser);
        if (u == null) {
            url += "/login/Signin.jsp";
            String failed = "account is not registered!!! ";
            request.setAttribute("failed", failed);
            request.setAttribute("email", email);
            cuser.setMaxAge(0);
            puser.setMaxAge(0);
            //request.getRequestDispatcher(url).forward(request, response);
            request.getRequestDispatcher("/login/Signin.jsp").forward(request, response);
        } else {
            if (!u.getPassword().equals(password)) {
                url += "/login/Signin.jsp";
                String failed = "password incorrect!";
                request.setAttribute("failed", failed);
                request.setAttribute("email", email);

                cuser.setMaxAge(0);
                puser.setMaxAge(0);
                //request.getRequestDispatcher(url).forward(request, response);
                request.getRequestDispatcher("/login/Signin.jsp").forward(request, response);
            } else {
                session.setAttribute("acc", u);
                if (!c.equals("notchecked")) {
                    cuser.setMaxAge(60 * 60 * 24 * 7);
                    puser.setMaxAge(60 * 60 * 24 * 7);
                    response.addCookie(cuser);
                    response.addCookie(puser);
                } else {
                    cuser.setMaxAge(0);
                    puser.setMaxAge(0);
                }
                if (u.getRoleid().getRoleId() == 0) {
                    session.setAttribute("acc", u);
                    url += "/homepage/index.jsp";
                } else if (u.getRoleid().getRoleId() == 1) {
                    session.setAttribute("acc", u);
                    url += "/homepage/index.jsp";
                } else if (u.getRoleid().getRoleId() == 2) {
                    session.setAttribute("acc", u);
                    url += "/homepage/index.jsp";
                } else {
                    session.setAttribute("admin", u);
                    url += "/admin/index.jsp";
                }

                response.sendRedirect(url);
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
