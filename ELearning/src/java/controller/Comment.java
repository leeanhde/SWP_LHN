/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dal.CommentDAO;
import dal.ReplyDAO;
import dal.UserDAO;
import dal.UserReactionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Reply;
import model.UserReaction;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "Comment", urlPatterns = {"/Comment"})
public class Comment extends HttpServlet {

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
            out.println("<title>Servlet Comment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Comment at " + request.getContextPath() + "</h1>");
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

        try {
            String action = request.getParameter("action");
            int myVariable = Integer.parseInt(request.getParameter("dataValue"));

            if ("get".equals(action)) {

                int userId = Integer.parseInt(request.getParameter("userid"));
                System.out.println(userId);

                CommentDAO d = new CommentDAO();
                ArrayList<model.Comment> listComment = new ArrayList<model.Comment>();
                listComment = d.selectCommentByLessonId(myVariable);

                UserReactionDAO userReactionDao = new UserReactionDAO();
                ArrayList<UserReaction> listCommentReaction = new ArrayList<UserReaction>();
                listCommentReaction = userReactionDao.selectCommentIdReaction(myVariable, userId);

                Gson gson = new Gson();
                String listCommentJson = gson.toJson(listComment);
                String listCommentReactionJson = gson.toJson(listCommentReaction);

                // Gửi JSON về cho Ajax
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("[" + listCommentJson + "," + listCommentReactionJson + "]");
            } else if ("deleleComment".equals(action)) {
                int lessonId = Integer.parseInt(request.getParameter("lessonId"));

                CommentDAO commentDao = new CommentDAO();
                int check = commentDao.deleteCommentById(myVariable);
                if (check == 1) {
                    CommentDAO d = new CommentDAO();
                    ArrayList<model.Comment> listComment = new ArrayList<model.Comment>();
                    listComment = d.selectCommentByLessonId(lessonId);
                    String jsonList = new Gson().toJson(listComment);

                    // Gửi JSON về cho Ajax
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(jsonList);
                } else {
                    response.setContentType("text/plain");
                    response.getWriter().write("failed");
                }
            } else if ("getReply".equals(action)) {
                int userId = Integer.parseInt(request.getParameter("userId"));

                System.out.println("commentid" + myVariable);
                System.out.println("userid" + userId);

                ReplyDAO replyDAO = new ReplyDAO();
                ArrayList<Reply> listReply = new ArrayList<Reply>();
                listReply = replyDAO.selectAllReplyByCommentId(myVariable);

                String jsonList = new Gson().toJson(listReply);

                // Gửi JSON về cho Ajax
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonList);

            }
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
