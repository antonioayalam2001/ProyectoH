package com.ipn.mx.controlador;

import com.ipn.mx.modelo.DbConnection;
import com.ipn.mx.modelo.dao.CategoriaDAO;
import com.ipn.mx.modelo.entidades.Categoria;


//Funcionamiento Local
//import jakarta.servlet.RequestDispatcher;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletOutputStream;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//---------------------------------------------------

//Funcionamiento en Heroku
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//---------------------------------------------


import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CategoriasServlet", value = "/CategoriasServlet")
public class CategoriasServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");
        if (accion.equals("listaDeCategorias")) {
            listadoCategorias(request, response);
        } else {
            if (accion.equals("nuevo")) {
                nuevaCategoria(request, response);
            } else {
                if (accion.equals("actualizar")) {
                    actualizarCategoria(request, response);
                } else {
                    if (accion.equals("eliminar")) {
                        eliminarCategoria(request, response);
                    } else {
                        if (accion.equals("save")) {
                            guardarCategoria(request, response);
                        } else {
                            if (accion.equals("ver")) {
                                verCategoria(request, response);
                            } else {
                                if (accion.equals("verReporte")) {
                                    verReporte(request, response);
                                } else {
                                    if (accion.equals("graficar")) {
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    private void verReporte(HttpServletRequest request, HttpServletResponse response) {
        ServletOutputStream sOs = null;
        DbConnection db = DbConnection.getInstance();
        Connection conn = db.getConection();
        try {
            sOs = response.getOutputStream();
            File report;
            byte[] b;

            report = new File(getServletConfig().getServletContext().getRealPath("reportes/reporteC.jasper"));

            b = JasperRunManager.runReportToPdf(report.getPath(), null, conn);

            response.setContentType("application/pdf");

            response.setContentLength(b.length);
            sOs.write(b, 0, b.length);
            sOs.flush();
        } catch (IOException | JRException e) {
            e.printStackTrace();
        } finally {
            try {
                sOs.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void verCategoria(HttpServletRequest request, HttpServletResponse response) {
    }

    private void actualizarCategoria(HttpServletRequest request, HttpServletResponse response) {
        CategoriaDAO dao = new CategoriaDAO();
        Categoria dto = new Categoria();
        dto.setIdCategoria(Integer.parseInt(request.getParameter("id")));
        try {
            dto = dao.read(dto);
            request.setAttribute("dto", dto);
            RequestDispatcher rd = request.getRequestDispatcher("/categoria/categoriaForm.jsp");
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
        }
    }

    private void nuevaCategoria(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher rD = request.getRequestDispatcher("/categoria/categoriaForm.jsp");
        try {
            rD.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void eliminarCategoria(HttpServletRequest request, HttpServletResponse response) {
        System.out.println(request.getParameter("id"));
        CategoriaDAO dao = new CategoriaDAO();
        Categoria categoria = new Categoria();
        categoria.setIdCategoria(Integer.parseInt(request.getParameter("id")));
        categoria = dao.read(categoria);
        dao.delete(categoria);
        try {
            listadoCategorias(request, response);
        } catch (SQLException | ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void guardarCategoria(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        CategoriaDAO dao = new CategoriaDAO();
        Categoria categoria = new Categoria();
        String id = request.getParameter("idCat");

        if (request.getAttribute("dto") == null && id.equals("")) {
            categoria.setNombreCategoria(request.getParameter("categoria"));
            categoria.setDescripcionCategoria(request.getParameter("desCategoria"));
            try {
                dao.create(categoria);
                listadoCategorias(request, response);
            } catch (SQLException ex) {
            }
        } else {
            categoria.setIdCategoria(Integer.parseInt(id));
            categoria.setNombreCategoria(request.getParameter("categoria"));
            categoria.setDescripcionCategoria(request.getParameter("desCategoria"));
            dao.update(categoria);
            listadoCategorias(request, response);
        }

    }

    private void listadoCategorias(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        CategoriaDAO daoC = new CategoriaDAO();
        List list = daoC.readAll();
        String[] frases = {"Hola", "Prueba"};
        int x = 10;
        request.setAttribute("listado", list);
        request.setAttribute("frases", frases);
        request.setAttribute("numero", x);
        RequestDispatcher rD = request.getRequestDispatcher("/categoria/listaDeCategorias.jsp");
        rD.forward(request, response);

    }
}

