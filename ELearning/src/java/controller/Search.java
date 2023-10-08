/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dal.SearchDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Course;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "Search", urlPatterns = {"/Search"})
public class Search extends HttpServlet {

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
            out.println("<title>Servlet Search</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Search at " + request.getContextPath() + "</h1>");
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
        String searchTerm = request.getParameter("term");
        System.out.println(searchTerm);
        List<Course> searchResults = performSearch(searchTerm);
        System.out.println(searchResults.size());

        // Chuyển danh sách kết quả thành JSON
        Gson gson = new Gson();
        String jsonResults = gson.toJson(searchResults);

        // Trả kết quả JSON về trang JSP
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(jsonResults);
    }

    private List<Course> performSearch(String searchTerm) {
        List<Course> results = new ArrayList<Course>();

        if (searchTerm.trim().length() == 1) {
            SearchDAO dao = new SearchDAO();
            System.out.println(dao);
            results = dao.searchOneCharacterFirst(searchTerm);
            System.out.println(results);
        } else {

            String[] words = searchTerm.split("\\s+");
            int wordCount = words.length;
            if (wordCount > 1) {
                SearchDAO dao2 = new SearchDAO();
                System.out.println(dao2);

                results = dao2.searchTwoWord(searchTerm);
                System.out.println(results);

            } else {
                SearchDAO dao3 = new SearchDAO();
                System.out.println(dao3);

                results = dao3.searchCharacters(searchTerm);
                System.out.println(results);

            }
        }
        return results;

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
