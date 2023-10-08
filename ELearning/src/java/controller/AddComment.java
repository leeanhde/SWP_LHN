/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dal.CommentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AddComment", urlPatterns = {"/AddComment"})
public class AddComment extends HttpServlet {

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
            out.println("<title>Servlet AddComment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddComment at " + request.getContextPath() + "</h1>");
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
            String commenttext = request.getParameter("comment");
            int userid = Integer.parseInt(request.getParameter("userid"));
            int lessonid = Integer.parseInt(request.getParameter("lessonid"));
            long timestamp = System.currentTimeMillis();
            Timestamp timestampObj = new Timestamp(timestamp);

            System.out.println(timestampObj);
            System.out.println(commenttext);
            System.out.println(userid);
            System.out.println(lessonid);
            // public Comment(, Lesson lessonId, User userId, String content, int like, int disLike, boolean isReply, String image, boolean status, Timestamp commentDate) {

            CommentDAO commentDao = new CommentDAO();
            int check = commentDao.insertComment(lessonid, userid, commenttext, timestampObj);
            String jsonList = null;
            if (check == 0) {
                jsonList = new Gson().toJson("false");
            } else {

                CommentDAO commnetDao = new CommentDAO();
                ArrayList<model.Comment> listComment = new ArrayList<model.Comment>();
                listComment = commnetDao.selectCommentByLessonId(lessonid);
                jsonList = new Gson().toJson(listComment);
            }

            // Gửi JSON về cho Ajax
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonList);

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
