package com.ipn.mx.modelo.entidades;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
public class Articulo {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "idArticulo")
    private int idArticulo;
    @Basic
    @Column(name = "nomArti")
    private String nomArti;
    @Basic
    @Column(name = "descArti")
    private String descArti;
    @Basic
    @Column(name = "existencia")
    private int existencia;
    @Basic
    @Column(name = "stockMinimo")
    private int stockMinimo;
    @Basic
    @Column(name = "stockMaximo")
    private int stockMaximo;
    @Basic
    @Column(name = "precio")
    private float precio;
    @Basic
    @Column(name = "categoriaId")
    private int categoriaId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Articulo articulo = (Articulo) o;

        if (idArticulo != articulo.idArticulo) return false;
        if (existencia != articulo.existencia) return false;
        if (stockMinimo != articulo.stockMinimo) return false;
        if (stockMaximo != articulo.stockMaximo) return false;
        if (Float.compare(articulo.precio, precio) != 0) return false;
        if (categoriaId != articulo.categoriaId) return false;
        if (nomArti != null ? !nomArti.equals(articulo.nomArti) : articulo.nomArti != null) return false;
        if (descArti != null ? !descArti.equals(articulo.descArti) : articulo.descArti != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idArticulo;
        result = 31 * result + (nomArti != null ? nomArti.hashCode() : 0);
        result = 31 * result + (descArti != null ? descArti.hashCode() : 0);
        result = 31 * result + existencia;
        result = 31 * result + stockMinimo;
        result = 31 * result + stockMaximo;
        result = 31 * result + (precio != +0.0f ? Float.floatToIntBits(precio) : 0);
        result = 31 * result + categoriaId;
        return result;
    }
}
