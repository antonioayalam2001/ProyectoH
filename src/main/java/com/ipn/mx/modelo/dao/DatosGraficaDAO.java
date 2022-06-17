package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.DbConnection;
import com.ipn.mx.modelo.dto.DatosGraficaDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DatosGraficaDAO {
    private static final String SQL_GRAFICAR = "select \"categoria\".\"nombrecategoria\", count(\"articulo\".\"idarticulo\") as Cantidad from \"categoria\" inner join \"articulo\" on  \"categoria\"" +
            ".\"idcategoria\"=\"articulo\".\"categoriaid\" group by \"categoria\"\n" +
            ".\"idcategoria\"";
    DbConnection db = DbConnection.getInstance();
    Connection connection;

    public List graficar() throws SQLException {
        connection = db.getConection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List lista = null;

        try {
            ps = connection.prepareStatement(SQL_GRAFICAR);
            rs = ps.executeQuery();
            lista = obtenerResultados(rs);
            if (!lista.isEmpty()){
                return lista;
            }else{
                return  null;
            }
        }finally {
            if (connection!=null)connection.close();
        }
    }


    private List obtenerResultados(ResultSet rs) throws SQLException {
        List resultados = new ArrayList<>();
        while (rs.next()){
            DatosGraficaDTO dto = new DatosGraficaDTO();
            dto.setNombre(rs.getString(1));
            dto.setCantidad(rs.getInt(2));
            resultados.add(dto);
        }
        return resultados;
    }

    public static void main(String[] args) throws SQLException {
        DatosGraficaDTO dto = new DatosGraficaDTO();
        DatosGraficaDAO dao = new DatosGraficaDAO();
        List lista;
        lista = dao.graficar();
        for (Object dtoE: lista) {
            DatosGraficaDTO elemento = (DatosGraficaDTO) dtoE;
            System.out.println(elemento.getNombre());
            System.out.println(elemento.getCantidad());
        }
    }

}
