package com.ipn.mx.controlador;

import com.ipn.mx.modelo.DbConnection;
import com.ipn.mx.modelo.dao.ArticuloDAO;
import com.ipn.mx.modelo.dao.CategoriaDAO;
import com.ipn.mx.modelo.dao.DatosGraficaDAO;
import com.ipn.mx.modelo.dto.DatosGraficaDTO;
import com.ipn.mx.modelo.entidades.Articulo;
import com.ipn.mx.modelo.entidades.Categoria;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;

//Funcionamiento Local
//import jakarta.servlet.RequestDispatcher;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletOutputStream;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//---------------------------------------------------

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ArticuloS", value = "/ArticuloS")
public class ArticuloS extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");
        if (accion.equals("list")) {
            listaArt(request, response);
        } else {
            if (accion.equals("nue")) {
                nueArt(request, response);
            } else {
                if (accion.equals("act")) {
                    actArt(request, response);
                } else {
                    if (accion.equals("del")) {
                        delArt(request, response);
                    } else {
                        if (accion.equals("save")) {
                            saveArt(request, response);
                        } else {
                            if (accion.equals("ver")) {
                                verArt(request, response);
                            } else {
                                if (accion.equals("verReporte")) {
                                    verReporte(request, response);
                                } else {
                                    if (accion.equals("graficar")) {
                                        graficar(request, response);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    private void graficar(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
//        JFreeChart chart = ChartFactory.
//                createPieChart("Articulos por Categoria",getDataGrafica(),true,true, Locale.getDefault());
        JFreeChart chart = ChartFactory.
                createBarChart("Articulos por Categoria",
                        "Categoria"
                        ,"Articulos",
                        getDataGrafica(),
                        PlotOrientation.VERTICAL,true,true,false);
        ChartPanel panel = new ChartPanel(chart);
        String archivo = getServletConfig().getServletContext().getRealPath("/grafica.png");
        ChartUtils.saveChartAsPNG(new File(archivo),chart,800,600);
        RequestDispatcher rD = request.getRequestDispatcher("/articulo/grafica.jsp");
        rD.forward(request,response);
    }

    private DefaultCategoryDataset getDataGrafica() throws SQLException {
        DefaultCategoryDataset pie = new DefaultCategoryDataset();
        DatosGraficaDAO dao = new DatosGraficaDAO();
        List datos = dao.graficar();

        for (Object elemento: datos
             ) {
            DatosGraficaDTO dto = (DatosGraficaDTO) elemento;
            pie.setValue(dto.getCantidad(), dto.getNombre(), dto.getNombre());
        }
        return pie;
    }

    private void verReporte(HttpServletRequest request, HttpServletResponse response) {
        ServletOutputStream sOs = null;
        DbConnection db = DbConnection.getInstance();
        Connection conn = db.getConection();
        try {
            sOs = response.getOutputStream();
            File report;
            byte[] b ;

            report = new File(getServletConfig().getServletContext().getRealPath("reportes/reporteA.jasper"));

            b = JasperRunManager.runReportToPdf(report.getPath(),null,conn);

            response.setContentType("application/pdf");

            response.setContentLength(b.length);
            sOs.write(b,0,b.length);
            sOs.flush();
        } catch (IOException | JRException e) {
            e.printStackTrace();
        }finally {
            try {
                sOs.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void verArt(HttpServletRequest request, HttpServletResponse response) {
    }
//This methos helps us to handle weather is an insertion or an update given an existent record from the form
//    This just happens when we are in the form and we must do a POST request
    private void saveArt(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        ArticuloDAO daoA = new ArticuloDAO();
        Articulo dtoA = new Articulo();
        Categoria dtoC = new Categoria();
        CategoriaDAO daoC = new CategoriaDAO();
        List catList = daoC.readAll();
        request.setAttribute("listaCat",catList);
        String id = request.getParameter("idArt");
        if (request.getAttribute("dtoArt")==null && id.equals("")){
            dtoA.setNomArti(request.getParameter("nomA"));
            dtoA.setDescArti(request.getParameter("desA"));
            dtoA.setExistencia(Integer.parseInt(request.getParameter("exsA")));
            dtoA.setPrecio(Float.parseFloat(request.getParameter("price")));
            dtoA.setStockMaximo(Integer.parseInt(request.getParameter("stcMx")));
            dtoA.setStockMinimo(Integer.parseInt(request.getParameter("stcMn")));
            dtoA.setCategoriaId(Integer.parseInt(request.getParameter("idCat")));
            System.out.println(request.getParameter("idCat"));
            try{
                daoA.create(dtoA);
                listaArt(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else{
            dtoA.setIdArticulo(Integer.parseInt(id));
            dtoA.setNomArti(request.getParameter("nomA"));
            dtoA.setDescArti(request.getParameter("desA"));
            dtoA.setExistencia(Integer.parseInt(request.getParameter("exsA")));
            dtoA.setPrecio(Float.parseFloat(request.getParameter("price")));
            dtoA.setStockMaximo(Integer.parseInt(request.getParameter("stcMx")));
            dtoA.setStockMinimo(Integer.parseInt(request.getParameter("stcMn")));
            dtoA.setCategoriaId(Integer.parseInt(request.getParameter("idCat")));

            daoA.update(dtoA);
            listaArt(request,response);
        }
    }

    private void delArt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        ArticuloDAO daoA = new ArticuloDAO();
        Articulo dtoA = new Articulo();
        String idA = request.getParameter("id");

        if (idA.equals("")){
                String msgError = "No se pudo eliminar dado que no hubo Id valido";
                request.setAttribute("errorMsg",msgError);
                listaArt(request,response);
        }else{
            dtoA.setIdArticulo(Integer.parseInt(idA));
            try {
                daoA.delete(dtoA);
                listaArt(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void actArt(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ArticuloDAO daoA = new ArticuloDAO();
        Articulo dtoA = new Articulo();
        Categoria dtoC = new Categoria();
        CategoriaDAO daoC = new CategoriaDAO();
        List catList = daoC.readAll();
        request.setAttribute("listaCat",catList);
        dtoA.setIdArticulo(Integer.parseInt(request.getParameter("id")));
        try {
            dtoA = daoA.read(dtoA);
            request.setAttribute("dtoA",dtoA);
            RequestDispatcher rD = request.getRequestDispatcher("/articulo/articuloForm.jsp");
            rD.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

//    This methos just redirect us to the Article Form
    private void nueArt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        RequestDispatcher rD = request.getRequestDispatcher("/articulo/articuloForm.jsp");
        Categoria dtoC = new Categoria();
        CategoriaDAO daoC = new CategoriaDAO();
        List catList = daoC.readAll();
        request.setAttribute("listaCat",catList);
        rD.forward(request,response);
    }

    private void listaArt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        ArticuloDAO daoA = new ArticuloDAO();
        Articulo dtoA = new Articulo();
        List list = daoA.readAll();
        request.setAttribute("listaArticulo",list);
        RequestDispatcher rD = request.getRequestDispatcher("/articulo/listaArt.jsp");
        rD.forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
        processRequest(request, response);
    } catch (SQLException e) {
        e.printStackTrace();
        }
    }
}
