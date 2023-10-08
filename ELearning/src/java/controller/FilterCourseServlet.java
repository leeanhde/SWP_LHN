    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.CourseDAO;
import dal.EnrollDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collectors;
import model.Category;
import model.Course;

/**
 *
 * @author NhatAnh
 */
@WebServlet(name = "FilterCourseServlet", urlPatterns = {"/FilterCourseServlet"})
public class FilterCourseServlet extends HttpServlet {

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
            out.println("<title>Servlet FilterCourseServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterCourseServlet at " + request.getContextPath() + "</h1>");
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
        ArrayList<Course> listCourse = new ArrayList<Course>();
        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> listCategory = new ArrayList<Category>();
        CourseDAO dao = new CourseDAO();
        listCategory = categoryDAO.selectAll();
        String[] catMsg = new String[20];
        for (Category category : listCategory) {
            String str = "categoryID" + category.getCategoryId();
            catMsg[category.getCategoryId()] = request.getParameter(str);
        }

        for (Category category : listCategory) {
            if (catMsg[category.getCategoryId()] != null) {
                dao = new CourseDAO();
                removeListByCourseID(listCourse, dao.selectByCategoryID(category.getCategoryId()));
                dao = new CourseDAO();
                listCourse.addAll(dao.selectByCategoryID(category.getCategoryId()));

            }
        }
//        dao = new CourseDAO();
//            catMsg[0] = request.getParameter("categoryID0");
//            if (catMsg[0] != null) {
//                dao = new CourseDAO();
//                removeListByCourseID(listCourse, dao.selectByCategoryID(0));
//                dao = new CourseDAO();
//                listCourse.addAll(dao.selectByCategoryID(0));
//            }
        System.out.println(catMsg[0] + " " + catMsg[1] + " " + catMsg[2] + " " + catMsg[3] + " " + catMsg[5]);
        String duration1 = request.getParameter("duration1");
        String duration2 = request.getParameter("duration2");
        String duration3 = request.getParameter("duration3");
        String duration4 = request.getParameter("duration4");
        System.out.println(duration1 + " " + duration2 + " " + duration3 + " " + duration4);

        if (duration1 != null) {
            removeListByCourseID(listCourse, dao.selectByDuration(0, 2));
            dao = new CourseDAO();
            listCourse.addAll(dao.selectByDuration(0, 2));
        }
        if (duration2 != null) {
            dao = new CourseDAO();
            removeListByCourseID(listCourse, dao.selectByDuration(2.1, 5));
            dao = new CourseDAO();
            listCourse.addAll(dao.selectByDuration(2.1, 5));
        }
        if (duration3 != null) {
            dao = new CourseDAO();
            removeListByCourseID(listCourse, dao.selectByDuration(5.1, 8));
            dao = new CourseDAO();
            listCourse.addAll(dao.selectByDuration(5.1, 8));
        }
        if (duration4 != null) {
            dao = new CourseDAO();
            removeListByCourseID(listCourse, dao.selectByDuration(8.1, 100));
            dao = new CourseDAO();
            listCourse.addAll(dao.selectByDuration(8.1, 100));
        }

        if (listCourse.size() == 0) {
            dao = new CourseDAO();
            listCourse = dao.selectAll();
        }
        /* Sort */
        int sort = Integer.parseInt(request.getParameter("sort-by"));
        switch (sort) {
            case 1:
            Collections.sort(listCourse, new Comparator<Course>() {
                public int compare(Course o2, Course o1) {
                    return o1.getPublish().compareTo(o2.getPublish());
                }
            });
            case 2:
            Collections.sort(listCourse, new Comparator<Course>() {
                EnrollDAO e1 = new EnrollDAO();
                EnrollDAO e2 = new EnrollDAO();
                public int compare(Course o2, Course o1) {
                    return (""+e1.totalParticipationInCourse(o1.getCourseId())).compareTo(""+e2.totalParticipationInCourse(o2.getCourseId()));
                }
            });
            break;
        }
        Set <Course> setCourse = listCourse.stream().collect(Collectors.toCollection(() -> new TreeSet<>(Comparator.comparing(Course::getCourseId))));
        ArrayList<Course> listCourseFilter = new ArrayList<Course>();
        listCourseFilter.addAll(setCourse);
        request.setAttribute("listCourseFilter", listCourseFilter);
        request.getRequestDispatcher("homepage/courses.jsp").forward(request, response);
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

    public ArrayList<Course> removeListByCourseID(ArrayList<Course> listA, ArrayList<Course> listB) {
        boolean remove = false;
        for (int i = 0; i < listA.size(); i++) {
            for (int j = 0; j < listB.size(); j++) {
                if (listA.get(i).getCourseId() == listB.get(j).getCourseId()) {
                    listA.remove(i);
                }
            }
        }
        return listA;
    }

}
