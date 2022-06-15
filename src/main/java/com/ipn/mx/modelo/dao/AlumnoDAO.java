package com.ipn.mx.modelo.dao;



import com.ipn.mx.modelo.DbConnection;
import com.ipn.mx.modelo.entidades.Articulo;
import com.ipn.mx.modelo.entidades.Categoria;
import com.ipn.mx.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AlumnoDAO {
//    private static final String SQL_INSERT = "insert into Alumno(nombreAlumno,paternoAlumno,maternoAlumno,emailAlumno,idCarrera) " +
//            " values(?, ?,?,?,?)";
//    private static final String SQL_UPDATE = "update  Alumno set nombreAlumno = ?, maternoAlumno = ? ,paternoAlumno = ? , emailAlumno =? ,idCarrera=?" +
//            "  where idAlumno=?";
//    private static final String SQL_Delete = "Delete from  Alumno " +
//            "  where idAlumno=?";
//    private static final String SQL_SELECT = "Select *from Alumno where idAlumno = ?";
//    private static final String SQL_SELECTALL = "Select *from Alumno";
//    //    Since we are using the Singleton mode we cannot do this anymore
//    private DbConnection conexion = DbConnection.instancia();
//    With singleton we have to declare like this:
    private DbConnection database = DbConnection.getInstance();
    Connection conexion = database.getConection();


    public AlumnoDAO() {
    }

    public void create(Categoria a) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        try{
            transaction.begin();
//            session.persist(a);
            session.saveOrUpdate(a);
//            session.remove(a);
            transaction.commit();
        }catch (HibernateException hy){
            if (transaction!=null && transaction.isActive()){
                transaction.rollback();
            }

        }
    }

    public static void main(String[] args) throws SQLException {
        AlumnoDAO dao = new AlumnoDAO();
        Categoria categoria = new Categoria();
            categoria.setIdCategoria(2);
            categoria.setNombreCategoria("Bajo en hjhhhhh saturadas");
            categoria.setDescripcionCategoria("Hola a todos como estan");
            dao.create(categoria);
    }
}
