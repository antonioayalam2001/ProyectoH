package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.ArticuloDTO;
import com.ipn.mx.modelo.entidades.Categoria;
import com.ipn.mx.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//package com.ipn.mx.modelo.dao;
//
//import com.ipn.mx.modelo.DbConnection;
//import com.ipn.mx.modelo.dto.ArticuloDTO;
//
//import java.sql.CallableStatement;
//import java.sql.Connection;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
public class ArticuloDAO {

    public ArticuloDAO() {
    }

    public static void main(String[] args) {
        ArticuloDAO dao = new ArticuloDAO();
        Categoria categoria = new Categoria();
//        categoria.setIdCategoria(2);
//        categoria.setNombreCategoria("Bajo en ");
//        categoria.setDescripcionCategoria("Hola  todos  estan");
//        dao.create(categoria);

        List resultados;
        resultados = dao.readAll();
        System.out.println(resultados.get(2).toString());
        System.out.println(dao.readAll());
        categoria = (Categoria) resultados.get(2);
        System.out.println("Hola" + categoria.getDescripcionCategoria().toString());

    }

    public void create(Categoria a) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        try {
            transaction.begin();
            session.persist(a);
            transaction.commit();
        } catch (HibernateException hy) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
    }

    public void update(Categoria a) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        try {
            transaction.begin();
            session.saveOrUpdate(a);
            transaction.commit();
        } catch (HibernateException hy) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
    }

    public void delete(Categoria a) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        try {
            transaction.begin();
            session.remove(a);
            transaction.commit();
        } catch (HibernateException hy) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
    }
    public Categoria read(Categoria a, int id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        try {
            transaction.begin();
//            session.persist(a);
            a = session.find( Categoria.class ,id);
            transaction.commit();

            if (a!=null){
                return a;
            }
        } catch (HibernateException hy) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
        return null;
    }

    private List readAll(){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        List resultados = new ArrayList<>();
        transaction.begin();
        Query query = session.createQuery(" FROM  Categoria ",Categoria.class);
        resultados = query.getResultList();
        transaction.commit();
        return resultados;
    }


}
