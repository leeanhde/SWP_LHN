/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dal.ChoiceDAO;
import dal.ExamDetailDAO;
import dal.QuizDAO;
import dal.UserChoiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.Quiz;
import org.json.simple.JSONObject;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "GetScore", urlPatterns = {"/GetScore"})
public class GetScore extends HttpServlet {

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
            out.println("<title>Servlet GetScore</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetScore at " + request.getContextPath() + "</h1>");
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

        int examId = Integer.parseInt(request.getParameter("examId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        int timedo = Integer.parseInt(request.getParameter("timedo"));
        int timeExam = Integer.parseInt(request.getParameter("timeExam"));
//            String name = request.getParameter("name");
//            System.out.println(name);
        QuizDAO quizDao = new QuizDAO();
        ArrayList<Quiz> listQuiz = new ArrayList<Quiz>();
        listQuiz = quizDao.selectAllQuizByExamID(examId);
        ArrayList<Integer> listAnswer = new ArrayList<Integer>();

        for (Quiz quiz : listQuiz) {
            int a = Integer.parseInt(request.getParameter(String.valueOf(quiz.getQuizId())));
            listAnswer.add(a);
        }

        System.out.println(listAnswer);
        System.out.println(timedo);

        ChoiceDAO choiceDao = new ChoiceDAO();
        ArrayList<Integer> listRightAnswer = new ArrayList<Integer>();
        listRightAnswer = choiceDao.getListRightAnswerByExamID(examId);

        List<Integer> differentIndexes = new ArrayList<>();
        List<Integer> sameIndexes = new ArrayList<>();

        if (listAnswer.size() == listRightAnswer.size()) {
            for (int i = 0; i < listAnswer.size(); i++) {
                if (!listAnswer.get(i).equals(listRightAnswer.get(i))) {
                    differentIndexes.add(i);
                } else {
                    sameIndexes.add(i);
                }
            }
        }
        int score = (sameIndexes.size() * 100) / listAnswer.size();
        System.out.println(differentIndexes);

        int status = 0;
        if (score >= 80) {
            status = 1;
        }

        long timestamp = System.currentTimeMillis();
        Timestamp timeend = new Timestamp(timestamp);

        long millisecondsToSubtract = (timeExam * 60 - timedo) * 1000;
        long newTimeInMillis = timeend.getTime() - millisecondsToSubtract;

        Timestamp timestart = new Timestamp(newTimeInMillis);

        ExamDetailDAO examDetailDao = new ExamDetailDAO();
        int check = examDetailDao.insertExamDetail(userId, examId, timestart, timeend, status, score);
        int maxExamDetialId = new ExamDetailDAO().selectMaxExamDetail();

        for (int i = 0; i < listAnswer.size(); i++) {
            new UserChoiceDAO().addUserChoice(maxExamDetialId, listAnswer.get(i));
        }

        // int check2 = new UserChoiceDAO().addUserChoice(examId, check);
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("list1", differentIndexes);
        jsonResponse.put("list2", sameIndexes);

        jsonResponse.put("score", score);
        jsonResponse.put("timeend", timeend.toString());

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());

//        String list1Json = new Gson().toJson(differentIndexes);
//        String list2Json = new Gson().toJson(sameIndexes);
//        String combinedJson = "[" + list1Json + "," + list2Json + "]";
//
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//
//        response.getWriter().write(combinedJson);
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
