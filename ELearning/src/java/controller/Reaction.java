/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CommentDAO;
import dal.UserReactionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "Reaction", urlPatterns = {"/Reaction"})
public class Reaction extends HttpServlet {

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
            out.println("<title>Servlet Reaction</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Reaction at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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

        String action = request.getParameter("action");
        int commentId = Integer.parseInt(request.getParameter("dataValue"));
        CommentDAO commentDao = new CommentDAO();
        System.out.println(action);
        System.out.println(commentId);

        int userId = 0;

        if ("addlike".equals(action)) {
            commentDao.addLikeByCommentId(commentId);
            if (new UserReactionDAO().checkUserReation(userId, commentId)) {
                new UserReactionDAO().AddLikeUserReaction(userId, commentId);
            } else {
                new UserReactionDAO().AddNewLikeUserReaction(userId, commentId);
            }
        } else if ("sublike".equals(action)) {
            commentDao.subLikeByCommentId(commentId);
            new UserReactionDAO().SubLikeUserReaction(userId, commentId);
        } else if ("subdislike".equals(action)) {
            commentDao.subDisLikeByCommentId(commentId);
            new UserReactionDAO().SubDisLikeUserReaction(userId, commentId);

        } else if ("sublikeandaddislike".equals(action)) {
            commentDao.subLikeByCommentId(commentId);
            CommentDAO commentDao2 = new CommentDAO();
            commentDao2.addDisLikeByCommentId(commentId);
            new UserReactionDAO().SubLikeUserReaction(userId, commentId);
            new UserReactionDAO().AddDisLikeUserReaction(userId, commentId);

        } else if ("adddislike".equals(action)) {
            commentDao.addDisLikeByCommentId(commentId);
            if (new UserReactionDAO().checkUserReation(userId, commentId)) {
                new UserReactionDAO().AddDisLikeUserReaction(userId, commentId);
            } else {
                new UserReactionDAO().AddNewDisLikeUserReaction(userId, commentId);
            }
        } else if ("subdislikeaddlike".equals(action)) {
            commentDao.subDisLikeByCommentId(commentId);
            CommentDAO commentDao3 = new CommentDAO();
            commentDao3.addLikeByCommentId(commentId);
            new UserReactionDAO().SubDisLikeUserReaction(userId, commentId);
            new UserReactionDAO().AddLikeUserReaction(userId, commentId);
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
