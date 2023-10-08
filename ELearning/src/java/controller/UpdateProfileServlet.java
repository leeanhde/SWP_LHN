/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class UpdateProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProfileServlet at " + request.getContextPath() + "</h1>");
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

        //String aid_raw = request.getParameter("aid");
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("acc");

            AccountDAO profileDao = new AccountDAO();
            User users = profileDao.getAccountById(user.getUserId());
            //User user = profileDao.getAccountById(aid);
//            request.setAttribute("account", user);
//            request.setAttribute("passAcc", user.getPassword());
            System.out.println("PassAcc" + users.getPassword());
            request.setAttribute("up", users);
            request.setAttribute("passAcc", users.getPassword());

            request.getRequestDispatcher("userProfile/ProfileUser.jsp").forward(request, response);

        } catch (Exception e) {
        }
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
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String aid_raw = request.getParameter("aid");
        String gender = request.getParameter("gender");
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String repass = request.getParameter("repass");
        String button = request.getParameter("update");
        System.out.println("button" + button);

        User us = new User();
        AccountDAO profileDao = new AccountDAO();

        try {
            us.setFullName(name);
            if (gender.equals("Male")) {
                us.setGender(true);
            }
            if (gender.equals("Female")) {
                us.setGender(false);
            }

            us.setPhone(mobile);
            us.setAddress(address);
            us.setEmail(email);

            int aid = Integer.parseInt(aid_raw);
            if (button.equals("profile")) {
                profileDao.updateProfile(us, aid_raw);
                request.setAttribute("updateSuccess", true);
            }
            if (button.equals("pass")) {
                profileDao.changePassword(newpass, aid);
                request.setAttribute("updateSuccess", true);
            }
            System.out.println(oldpass);
//            int aid = Integer.parseInt(aid_raw);
//
//            if (button.equals("profile")) {
//                us.setFullName(name);
//               // us.setDateOfBirth(dateOfBirth);
//                us.setPhone(mobile);
//                us.setAddress(address);
//                us.setEmail(email);
//                us.setUserId(aid);
//                int checkUpdate = profileDao.updateProfile(us);
//                if (checkUpdate != 0) {
//                    doGet(request, response);
//                } else {
//                    System.out.println("error server");
//                }
//            }
//            if (button.equals("password")) {
//                int checkChangePass = profileDao.changePassword(newpass, aid);
//                if (checkChangePass != 0) {
//                    doGet(request, response);
//                } else {
//                    System.out.println("error server");
//                }
//            }
            doGet(request, response);

            System.out.println(button);
        } catch (Exception e) {
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
