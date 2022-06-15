package com.ipn.mx.modelo.dto;

import java.io.Serializable;

public class DatosGraficaDTO implements Serializable {
    private int cantidad;
    private String nombre;

    public DatosGraficaDTO() {
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
