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
    <%@ include file="/header.jsp"%>

    <title>Lista de Artículos</title>
</head>
<body>

<%@ include file="/categoria/navbar.jsp" %>

<div class="container-fluid position-relative p-5">
    <h1 class="text-dark text-center fw-bolder ">Listado de Categorias</h1>
    <table class="table table-striped table-hover">
        <tr class="bg-primary text-center text-white">
            <th>idArticulo</th>
            <th>Nombre Articulo</th>
            <th>Descripcion</th>
            <th>Existencias</th>
            <th>Precio</th>
            <th>Stock Maximo</th>
            <th>Stock Minimo</th>
            <th>idCategoria</th>
            <th>Eliminar</th>
            <th>Actualizar</th>
        </tr>

        <c:forEach items="${listaArticulo}" var="dto">

            <tr class="text-center table-primary">
                <td class="align-middle "><a href="./ArticuloS?accion=ver&id=<c:out value="${dto.entidad.idArticulo}"/>" class="btnP"><c:out value="${dto.entidad.idArticulo}"/></a> </td>
                <td class="align-middle "><c:out value="${dto.entidad.nomArt}"/></td>
                <td class="align-middle "><c:out value="${dto.entidad.descArti}"/></td>
                <td class="align-middle "><c:out value="${dto.entidad.existencia}"/></td>
                <td class="align-middle "><c:out value="${dto.entidad.precio}"/></td>
                <td class="align-middle "><c:out value="${dto.entidad.stockMinimo}"/></td>
                <td class="align-middle "><c:out value="${dto.entidad.stockMaximo}"/></td>
                <td class="align-middle "><c:out value="${dto.entidad.idCategoria}"/></td>
                <td class="align-middle "><a href="./ArticuloS?accion=del&id=<c:out value="${dto.entidad.idArticulo}"/>" class="btn btn-danger p-2 rounded-circle"><i class='bx bxs-trash'></i></a></td>
                <td class="align-middle "><a href="./ArticuloS?accion=act&id=<c:out value="${dto.entidad.idArticulo}"/>" class="btn btn-primary p-2 text-white rounded-circle"><i
                        class='bx bx-edit bx-sm'></i></a></td>
            </tr>
        </c:forEach>

    </table>
    <svg id="wave" style="transform:rotate(180deg); transition: 0.3s" viewBox="0 0 1440 220" version="1.1" xmlns="http://www.w3.org/2000/svg"><defs><linearGradient id="sw-gradient-0" x1="0" x2="0" y1="1" y2="0"><stop stop-color="rgba(250.269, 93.343, 205.306, 1)" offset="0%"></stop><stop stop-color="rgba(236.608, 236.608, 236.608, 1)" offset="100%"></stop></linearGradient></defs><path style="transform:translate(0, 0px); opacity:1" fill="url(#sw-gradient-0)" d="M0,0L80,33C160,66,320,132,480,139.3C640,147,800,95,960,77C1120,59,1280,73,1440,91.7C1600,110,1760,132,1920,135.7C2080,139,2240,125,2400,117.3C2560,110,2720,110,2880,91.7C3040,73,3200,37,3360,29.3C3520,22,3680,44,3840,69.7C4000,95,4160,125,4320,121C4480,117,4640,81,4800,77C4960,73,5120,103,5280,106.3C5440,110,5600,88,5760,73.3C5920,59,6080,51,6240,69.7C6400,88,6560,132,6720,146.7C6880,161,7040,147,7200,150.3C7360,154,7520,176,7680,161.3C7840,147,8000,95,8160,91.7C8320,88,8480,132,8640,143C8800,154,8960,132,9120,132C9280,132,9440,154,9600,150.3C9760,147,9920,117,10080,121C10240,125,10400,161,10560,172.3C10720,183,10880,169,11040,154C11200,139,11360,125,11440,117.3L11520,110L11520,220L11440,220C11360,220,11200,220,11040,220C10880,220,10720,220,10560,220C10400,220,10240,220,10080,220C9920,220,9760,220,9600,220C9440,220,9280,220,9120,220C8960,220,8800,220,8640,220C8480,220,8320,220,8160,220C8000,220,7840,220,7680,220C7520,220,7360,220,7200,220C7040,220,6880,220,6720,220C6560,220,6400,220,6240,220C6080,220,5920,220,5760,220C5600,220,5440,220,5280,220C5120,220,4960,220,4800,220C4640,220,4480,220,4320,220C4160,220,4000,220,3840,220C3680,220,3520,220,3360,220C3200,220,3040,220,2880,220C2720,220,2560,220,2400,220C2240,220,2080,220,1920,220C1760,220,1600,220,1440,220C1280,220,1120,220,960,220C800,220,640,220,480,220C320,220,160,220,80,220L0,220Z"></path><defs><linearGradient id="sw-gradient-1" x1="0" x2="0" y1="1" y2="0"><stop stop-color="rgba(208.841, 251.091, 255, 1)" offset="0%"></stop><stop stop-color="rgba(202.456, 0, 110.158, 1)" offset="100%"></stop></linearGradient></defs><path style="transform:translate(0, 50px); opacity:0.9" fill="url(#sw-gradient-1)" d="M0,198L80,172.3C160,147,320,95,480,84.3C640,73,800,103,960,110C1120,117,1280,103,1440,99C1600,95,1760,103,1920,113.7C2080,125,2240,139,2400,121C2560,103,2720,51,2880,47.7C3040,44,3200,88,3360,88C3520,88,3680,44,3840,51.3C4000,59,4160,117,4320,143C4480,169,4640,161,4800,150.3C4960,139,5120,125,5280,99C5440,73,5600,37,5760,40.3C5920,44,6080,88,6240,121C6400,154,6560,176,6720,154C6880,132,7040,66,7200,55C7360,44,7520,88,7680,121C7840,154,8000,176,8160,176C8320,176,8480,154,8640,132C8800,110,8960,88,9120,80.7C9280,73,9440,81,9600,102.7C9760,125,9920,161,10080,168.7C10240,176,10400,154,10560,154C10720,154,10880,176,11040,187C11200,198,11360,198,11440,198L11520,198L11520,220L11440,220C11360,220,11200,220,11040,220C10880,220,10720,220,10560,220C10400,220,10240,220,10080,220C9920,220,9760,220,9600,220C9440,220,9280,220,9120,220C8960,220,8800,220,8640,220C8480,220,8320,220,8160,220C8000,220,7840,220,7680,220C7520,220,7360,220,7200,220C7040,220,6880,220,6720,220C6560,220,6400,220,6240,220C6080,220,5920,220,5760,220C5600,220,5440,220,5280,220C5120,220,4960,220,4800,220C4640,220,4480,220,4320,220C4160,220,4000,220,3840,220C3680,220,3520,220,3360,220C3200,220,3040,220,2880,220C2720,220,2560,220,2400,220C2240,220,2080,220,1920,220C1760,220,1600,220,1440,220C1280,220,1120,220,960,220C800,220,640,220,480,220C320,220,160,220,80,220L0,220Z"></path></svg>
</div>



<%--Script--%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://unpkg.com/boxicons@2.1.2/dist/boxicons.js"></script>
</body>
</html>
