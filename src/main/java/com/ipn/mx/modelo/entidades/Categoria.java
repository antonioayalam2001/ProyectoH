package com.ipn.mx.modelo.entidades;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Categoria {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "idCategoria")
    private int idCategoria;
    @Basic
    @Column(name = "nombreCategoria")
    private String nombreCategoria;
    @Basic
    @Column(name = "descripcionCategoria")
    private String descripcionCategoria;


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Categoria categoria = (Categoria) o;

        if (idCategoria != categoria.idCategoria) return false;
        if (nombreCategoria != null ? !nombreCategoria.equals(categoria.nombreCategoria) : categoria.nombreCategoria != null) return false;
        if (descripcionCategoria != null ? !descripcionCategoria.equals(categoria.descripcionCategoria) : categoria.descripcionCategoria != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idCategoria;
        result = 31 * result + (nombreCategoria != null ? nombreCategoria.hashCode() : 0);
        result = 31 * result + (descripcionCategoria != null ? descripcionCategoria.hashCode() : 0);
        return result;
    }
}
