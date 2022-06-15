package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.Articulo;
import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@AllArgsConstructor
public class ArticuloDTO {
    private Articulo entidad;

    public ArticuloDTO(){
        entidad = new Articulo();
    }
}
