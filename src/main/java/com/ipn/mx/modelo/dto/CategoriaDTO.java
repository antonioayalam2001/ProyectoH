package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.Categoria;
import lombok.AllArgsConstructor;
import lombok.Data;


import java.io.Serializable;

@Data
@AllArgsConstructor
public class CategoriaDTO implements Serializable {
    private Categoria entidad;

    public CategoriaDTO() {
        entidad = new Categoria();
    }
}
