<%--
  Created by IntelliJ IDEA.
  User: tonyayala
  Date: 22/04/22
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <%@ include file="/header.jsp"%>
    <link rel="stylesheet" href="style/sass/login.css"/>

</head>
<body>

<%@ include file="/categoria/navbar.jsp" %>
<div class="container-fluid d-flex justify-content-center align-items-center flex-column">
    <h1>Formulario de Articulos</h1>
${dtoA}
    <form method="post" action="./ArticuloS?accion=save" class="d-flex flex-column align-items-center justify-content-center" >
        <section class="row justify-content-center">
            <!--                <%--idArti--%>-->
            <div class='col-12  col-md-12 col-lg-5'>
                <div class='form-floating mb-3 mt-3'>
                    <input  class='mb-2  form-control text-center' type='text' name='idArt' id='idArt'
                           placeholder='Id Articulo' maxlength='50' value="${dtoA.entidad.idArticulo}" readonly>
                    <label class='mb-2' for='idArt'>Id Articulo</label>
                </div>
            </div>
            <!--    NomArti-->
            <div class='col-12  col-md-4 col-lg-5'>
                <div class='form-floating mb-3 mt-3'>
                    <input required class='mb-2  form-control text-center' type='text' name='nomA' id='nomA'
                           placeholder='Ingresa Descripción' maxlength='50' value="${dtoA.entidad.nomArt}"
                    >
                    <label class='mb-2' for='nomA'>Nombre del Ariculo</label>
                </div>
            </div>
            <!--    Des Arti-->
            <div class='col-12  col-md-8 col-lg-5'>
                <div class='form-floating mb-3 mt-3'>
                    <input required class='mb-2  form-control text-center' type='text' name='desA' id='desA'
                           placeholder='Ingresa Descripción' maxlength='50' value="${dtoA.entidad.descArti}"
                    >
                    <label class='mb-2' for='desA'>Descripcion Articulo</label>
                </div>
            </div>
            <!--    Des Arti-->
            <div class='col-12 col-md-4 col-lg-5'>
                <div class='form-floating mb-3 mt-3'>
                    <input required class='mb-2  form-control text-center' type='text' name='exsA' id='exsA'
                           placeholder='Existencias' maxlength='50' value="${dtoA.entidad.existencia}"
                    >
                    <label class='mb-2' for='exsA'>Existencias del Articulo</label>
                </div>
            </div>
            <!--    Des Arti-->
            <div class='col-12 col-md-4 col-lg-5'>
                <div class='form-floating mb-3 mt-3'>
                    <input required class='mb-2  form-control text-center' type='text' name='price' id='price'
                           placeholder='Precio' maxlength='50' value="${dtoA.entidad.precio}"
                    >
                    <label class='mb-2' for='price'>Precio</label>
                </div>
            </div>
            <!--    Des Arti-->
            <div class='col-12 col-md-4 col-lg-5'>
                <div class='form-floating mb-3 mt-3'>
                    <input required class='mb-2  form-control text-center' type='text' name='stcMx' id='stcMx'
                           placeholder='Stock Maximo' maxlength='50' value="${dtoA.entidad.stockMaximo}"
                    >
                    <label class='mb-2' for='stcMx'>stock Maximo</label>
                </div>
            </div>
            <!--    Des Arti-->
            <div class='col-12 col-md-6 col-lg-5'>
                <div class='form-floating mb-3 mt-3'>
                    <input required class='mb-2  form-control text-center' type='text' name='stcMn' id='stcMn'
                           placeholder='Stock Minimo' maxlength='50' value="${dtoA.entidad.stockMinimo}"
                    >
                    <label class='mb-2' for='stcMn'>stock Minimo</label>
                </div>
            </div>
            <!--    Des Arti-->
            <div class='col-12 col-md-6 col-lg-5'>
                <div class='form-floating mb-3 mt-3'>
                    <select name="idCat" id="idCat" class="form-select">
                        <c:forEach items="${listaCat}" var="dto">
                            <option value="${dto.entidad.idCategoria}"/>${dto.entidad.idCategoria} -> ${dto.entidad.nombreCategoria}</option>
                        </c:forEach>
                    </select>
                    <label class='mb-2' for='idCat'>Id Categoria</label>
                </div>
            </div>
        </section>
        <button type="submit" class="col-6 mb-4 mt-4 d-block btnp">
            <p>Confirm</p>
            <p class="text"><i class="fa-solid fa-circle-check"></i></p>
        </button>
    </form>

</div>


<%--Script--%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://unpkg.com/boxicons@2.1.2/dist/boxicons.js"></script>
</body>
</html>
