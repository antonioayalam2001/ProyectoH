package com.ipn.mx.modelo;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
    //    Variables to use for the DB connection
    private FileInputStream fis;
    private String user;
    private String password;
    private String url;
    private String driverBD;
    //
//    Static variable so every time this one changes the status it reflects in the whole project
    private static Connection conexion;
    private static DbConnection inst;

    //    Constructor, need to be private so this one cannot be invoked automatically
    private DbConnection() {
    }

    public static DbConnection getInstance() {
        if (inst == null) {
            return inst = new DbConnection();
        } else {
            return inst;
        }
    }

    public Connection stablish() {
        if (conexion == null) {
            return conexion = getConection();
        } else {
            return conexion;
        }
    }


    public Connection getConection() {
//        POSTGRES
        user = "rnlitnpeqtvviu";
        password = "9660ab63275cd7e475d05c489c9b0e7994ce621f9f06682eabecaf4e8a450db0";
        url = "jdbc:postgresql://ec2-3-230-122-20.compute-1.amazonaws.com:5432/da9c5ng80r81ft";
        driverBD = "org.postgresql.Driver";
//        MYSQL
//        user = "root";
//        password = "Jillvalentine1";
//        url = "jdbc:mysql://localhost:3306/escuelaweb";
//        driverBD = "com.mysql.cj.jdbc.Driver";
        try {
            Class.forName(driverBD);
            conexion = DriverManager.getConnection(url, user, password);
            System.out.println("Successful Connection to the DataBase System");
            return conexion;

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Error while logging ");
            return null;
        }
    }

    public void closeConnection() {
        try {
            conexion.close();
            System.out.println("Connection Closed");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Connection conect;
        DbConnection db = DbConnection.getInstance();
        conect = db.getConection();
    }
}

