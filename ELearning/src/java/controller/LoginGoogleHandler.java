/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import util.GoogleUtils;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.UserGoogle;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "LoginGoogleHandler", urlPatterns = {"/LoginGoogleHandler"})
public class LoginGoogleHandler extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public LoginGoogleHandler() {
        super();
    }

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
        String code = request.getParameter("code");
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginGoogleHandler</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginGoogleHandler at " + request.getContextPath() + "</h1>");
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

        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            UserGoogle userGoogle = GoogleUtils.getUserInfo(accessToken);
            //request.setAttribute("id", googlePojo.getId());
            //request.setAttribute("name", googlePojo.getName());
            //request.setAttribute("email", googlePojo.getEmail());

            String email = userGoogle.getEmail();

            User user = new User();
            UserDAO dao = new UserDAO();
            user = dao.getUserByEmail(email);
            url += "/homepage/index.jsp";
            HttpSession session = request.getSession();

            if (user == null) {
                UserDAO dao2 = new UserDAO();
                dao2.insertUserByGoogle(userGoogle.getName(), email, userGoogle.getPicture());
                User user_new = new User();
                UserDAO dao3 = new UserDAO();

                user_new = dao3.getUserByEmail(email);
                session.setAttribute("acc", user_new);
                session.setAttribute("loginGG", "new");
            } else {
                session.setAttribute("acc", user);
            }

            response.sendRedirect(url);

            //RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
            //dis.forward(request, response);
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
        int userId = Integer.parseInt(request.getParameter("userId"));
        String password = request.getParameter("password");

//        System.out.println("userId" + userId);
//        System.out.println("password" + password);

        UserDAO userDao = new UserDAO();
        int check = userDao.setPasswordForGoogleAccount(userId, password);
        if (check == 1) {
            HttpSession session = request.getSession();
            session.removeAttribute("loginGG"); // Xóa biến session cần xóa

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("true");
        } else {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("false");
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
