<%--
  Created by IntelliJ IDEA.
  User: tonya
  Date: 4/7/2022
  Time: 8:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="style/sass/login.css"/>
    <%@ include file="/header.jsp"%>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container-fluid vh-100 position-relative">
    <div class="row position-relative">
        <div class="col-12 col-md-6 bg-dark vh-100 d-flex flex-column align-items-center justify-content-center position-relative">
            <h1 class="up">Agrega una nueva Categoria</h1>
            <h2 class="text-white">Nunca había sido más sencillo</h2>
            <i class='bx bx-add-to-queue bgS' ></i>
            <svg id="wave3" style="transform:rotate(180deg); transition: 0.3s" viewBox="0 0 1440 430" version="1.1" xmlns="http://www.w3.org/2000/svg"><defs><linearGradient id="sw-gradient-0" x1="0" x2="0" y1="1" y2="0"><stop stop-color="rgba(255, 255, 255, 1)" offset="0%"></stop><stop stop-color="rgba(255, 255, 255, 1)" offset="100%"></stop></linearGradient></defs><path style="transform:translate(0, 0px); opacity:1" fill="url(#sw-gradient-0)" d="M0,129L80,164.8C160,201,320,272,480,250.8C640,229,800,115,960,86C1120,57,1280,115,1440,164.8C1600,215,1760,258,1920,250.8C2080,244,2240,186,2400,157.7C2560,129,2720,129,2880,114.7C3040,100,3200,72,3360,107.5C3520,143,3680,244,3840,265.2C4000,287,4160,229,4320,207.8C4480,186,4640,201,4800,215C4960,229,5120,244,5280,258C5440,272,5600,287,5760,272.3C5920,258,6080,215,6240,186.3C6400,158,6560,143,6720,157.7C6880,172,7040,215,7200,250.8C7360,287,7520,315,7680,286.7C7840,258,8000,172,8160,164.8C8320,158,8480,229,8640,265.2C8800,301,8960,301,9120,250.8C9280,201,9440,100,9600,93.2C9760,86,9920,172,10080,200.7C10240,229,10400,201,10560,207.8C10720,215,10880,258,11040,229.3C11200,201,11360,100,11440,50.2L11520,0L11520,430L11440,430C11360,430,11200,430,11040,430C10880,430,10720,430,10560,430C10400,430,10240,430,10080,430C9920,430,9760,430,9600,430C9440,430,9280,430,9120,430C8960,430,8800,430,8640,430C8480,430,8320,430,8160,430C8000,430,7840,430,7680,430C7520,430,7360,430,7200,430C7040,430,6880,430,6720,430C6560,430,6400,430,6240,430C6080,430,5920,430,5760,430C5600,430,5440,430,5280,430C5120,430,4960,430,4800,430C4640,430,4480,430,4320,430C4160,430,4000,430,3840,430C3680,430,3520,430,3360,430C3200,430,3040,430,2880,430C2720,430,2560,430,2400,430C2240,430,2080,430,1920,430C1760,430,1600,430,1440,430C1280,430,1120,430,960,430C800,430,640,430,480,430C320,430,160,430,80,430L0,430Z"></path></svg>
        </div>
        <div class="col-12 col-md-6 vh-100 bg-dark position-relative">
            <div class="contenedor position-relative">
                <h1 class="text-white fw-bolder">Ingresa la nueva información!</h1>
                <form method="post" action="./CategoriasServlet?accion=save">
                    <div class="circle_container">
                        <div class="circle_img"></div>
                    </div>
                    <div class="row d-flex flex-column flex-sm-row justify-content-center align-items-center">
                        <%--Clave--%>
                        <div class='col col-sm-10 col-md-10 col-lg-10'>
                            <div class='form-floating mb-3 mt-3'>
                                <input class='mb-2  form-control text-center' type='text' name='idCat' id='idCat'
                                       placeholder='Ingresa Cstegoria' maxlength='50' value="${dto.idCategoria}" readonly
                                >
                                <label class='mb-2' for='categoria'>Id Categoria</label>
                            </div>
                        </div>
                        <!--    Nombre del Usuario-->
                        <div class='col col-sm-10 col-md-10 col-lg-10'>
                            <div class='form-floating mb-3 mt-3'>
                                <input class='mb-2  form-control text-center' type='text' name='categoria' id='categoria'
                                       placeholder='Ingresa Cstegoria' maxlength='50' value="${dto.nombreCategoria}"
                                >
                                <label class='mb-2' for='categoria'>Nombre Categoria</label>
                            </div>
                        </div>

                        <!--    Clave-->
                        <div class='col col-sm-10 col-md-10 col-lg-10'>
                            <div class='form-floating mb-3 mt-3'>
                                <input class='mb-2  form-control text-center' type='text' name='desCategoria' id='desCategoria'
                                       placeholder='desCategoria' value="${dto.descripcionCategoria}"
                                >
                                <label class='mb-2' for='desCategoria'>Descripcion</label>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btnp mb-4 mt-4">
                        <p>Confirm</p>
                        <p class="text"><i class="fa-solid fa-circle-check"></i></p>
                    </button>
                </form>
            </div>

            <svg id="wave2" style="transform:rotate(0deg); transition: 0.3s" viewBox="0 0 1440 430" version="1.1" xmlns="http://www.w3.org/2000/svg"><defs><linearGradient id="sw-gradient-0" x1="0" x2="0" y1="1" y2="0"><stop stop-color="rgba(255, 255, 255, 1)" offset="0%"></stop><stop stop-color="rgba(255, 255, 255, 1)" offset="100%"></stop></linearGradient></defs><path style="transform:translate(0, 0px); opacity:1" fill="url(#sw-gradient-0)" d="M0,129L80,164.8C160,201,320,272,480,250.8C640,229,800,115,960,86C1120,57,1280,115,1440,164.8C1600,215,1760,258,1920,250.8C2080,244,2240,186,2400,157.7C2560,129,2720,129,2880,114.7C3040,100,3200,72,3360,107.5C3520,143,3680,244,3840,265.2C4000,287,4160,229,4320,207.8C4480,186,4640,201,4800,215C4960,229,5120,244,5280,258C5440,272,5600,287,5760,272.3C5920,258,6080,215,6240,186.3C6400,158,6560,143,6720,157.7C6880,172,7040,215,7200,250.8C7360,287,7520,315,7680,286.7C7840,258,8000,172,8160,164.8C8320,158,8480,229,8640,265.2C8800,301,8960,301,9120,250.8C9280,201,9440,100,9600,93.2C9760,86,9920,172,10080,200.7C10240,229,10400,201,10560,207.8C10720,215,10880,258,11040,229.3C11200,201,11360,100,11440,50.2L11520,0L11520,430L11440,430C11360,430,11200,430,11040,430C10880,430,10720,430,10560,430C10400,430,10240,430,10080,430C9920,430,9760,430,9600,430C9440,430,9280,430,9120,430C8960,430,8800,430,8640,430C8480,430,8320,430,8160,430C8000,430,7840,430,7680,430C7520,430,7360,430,7200,430C7040,430,6880,430,6720,430C6560,430,6400,430,6240,430C6080,430,5920,430,5760,430C5600,430,5440,430,5280,430C5120,430,4960,430,4800,430C4640,430,4480,430,4320,430C4160,430,4000,430,3840,430C3680,430,3520,430,3360,430C3200,430,3040,430,2880,430C2720,430,2560,430,2400,430C2240,430,2080,430,1920,430C1760,430,1600,430,1440,430C1280,430,1120,430,960,430C800,430,640,430,480,430C320,430,160,430,80,430L0,430Z"></path></svg>        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://unpkg.com/boxicons@2.1.2/dist/boxicons.js"></script>

</body>
</html>
