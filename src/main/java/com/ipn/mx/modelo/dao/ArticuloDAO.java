package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.entidades.Articulo;
import com.ipn.mx.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class ArticuloDAO {

    public ArticuloDAO() {
    }

    public static void main(String[] args) {
        ArticuloDAO dao = new ArticuloDAO();
        Articulo articulo = new Articulo();
//        Articulo.setIdArticulo(2);
//        Articulo.setNombreArticulo("Bajo en ");
//        Articulo.setDescripcionArticulo("Hola  todos  estan");
//        dao.create(Articulo);

        List resultados;
        resultados = dao.readAll();
        System.out.println(resultados.get(2).toString());
        System.out.println(dao.readAll());
        articulo = (Articulo) resultados.get(2);
        System.out.println("Hola" + articulo.getDescArti().toString());

    }

    public void create(Articulo a) {
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

    public void update(Articulo a) {
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

    public void delete(Articulo a) {
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
    public Articulo read(Articulo a) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        try {
            transaction.begin();
            a = session.find(Articulo.class,a.getIdArticulo());
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

    public List readAll(){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        List resultados = new ArrayList<>();
        transaction.begin();
        Query query = session.createQuery(" FROM  Articulo ",Articulo.class);
        resultados = query.getResultList();
        transaction.commit();
        return resultados;
    }
}
