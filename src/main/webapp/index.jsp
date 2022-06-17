<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <%@ include file="/header.jsp"%>
</head>
<body>
<%@ include file="/categoria/navbar.jsp" %>
<div
        class="container-fluid vh-100 d-flex flex-column justify-content-center justify-content-md-center"
        id="hero"
>
    <h1 class="text-center mb-4 position-relative">
Proyecto Realizado con la implementación de Hibernate    </h1>
    <p class="p-4 position-relative ">
        Hibernate es una herramienta de mapeo objeto-relacional (ORM) bajo licencia GNU LGPL para Java, que facilita el mapeo de atributos en una base de datos
        tradicional, y el modelo de objetos de un aplicación mediante archivos declarativos o anotaciones en los
        beans de las entidades que permiten establecer estas relaciones. Todo lo dicho, que suena a vendedor de seguros, se resume en que agiliza la relación entre la aplicación y
        nuestra base de datos SQL, de un modo que optimiza nuestro flujo de trabajo evitando caer en código repetitivo.
        Imagina un programa sencillo. Necesitas un método que permita dar de alta, baja, o modificar los datos de usuarios. Estos datos se almacenan en una base de datos, y cada
        objeto tiene diferentes clases. Para cada objeto debemos crear una clase que al menos permita crear, insertar, eliminar, consultar o modificar la información contenida en sus
        atributos. Esto, con excepción de alguna consulta un poco especial, es siempre lo mismo (SELECT, UPDATE, CREATE, FROM, WHERE, GROUP BY, ORDER BY y etc). Y no sé tú, pero no me
        gusta desperdiciar mi café en esas tareas cuando debo preocuparme de las consultas especiales que es donde suele estar el tomate.
    </p>
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
        <path fill="#fffbfd" fill-opacity="1"
              d="M0,320L60,309.3C120,299,240,277,360,250.7C480,224,600,192,720,202.7C840,213,960,267,1080,256C1200,245,1320,171,1380,133.3L1440,96L1440,320L1380,320C1320,320,1200,320,1080,320C960,320,840,320,720,320C600,320,480,320,360,320C240,320,120,320,60,320L0,320Z"></path>
    </svg>
</div>

<div class="container-fluid">
    <div class="floater">
        <div class="item">
            <div class="row justify-content-center">
                <div class="col-12  col-md-4">
                    <div class="card">
                        <i class='bx bx-list-ol'></i>
                        <div class="card-body d-flex flex-column align-items-center">
                            <h5 class="card-title">Listar</h5>
                            <p class="card-text">
                                Observa la lista de categorias que hay disponibles
                            </p>
                            <a href="./CategoriasServlet?accion=listaDeCategorias" class="btn btn-primary">Ctaegorias</a>
                        </div>
                    </div>
                </div>
                <div class="col-12  col-md-4">
                    <div class="card">
                        <i class='bx bxl-deezer' ></i>
                        <div class="card-body d-flex flex-column align-items-center">
                            <h5 class="card-title">Graficas</h5>
                            <p class="card-text">
                                Da un vistazo a las graficas que podemos proporcionar
                            </p>
                            <a href="./ArticuloS?accion=graficar" class="btn btn-primary">Graficar</a>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mt-3 mt-md-0">
                    <div class="card justify-content-center align-items-center">
                        <i class='bx bx-trash' ></i>
                        <div class="card-body d-flex flex-column align-items-center">
                            <h5 class="card-title">Agrega</h5>
                            <p class="card-text">
                                Agrega un nuevo artículo a la lista
                            </p>
                            <a href="./ArticuloS?accion=nue" class="btn btn-primary">Agrega Articulo</a>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mt-3 mt-md-2 align-self-center">
                    <div class="card">
                        <i class='bx bx-add-to-queue' ></i>
                        <div class="card-body d-flex flex-column align-items-center">
                            <h5 class="card-title">Agregar Categoria</h5>
                            <p class="card-text">
                                Agrega una categoria nueva
                            </p>
                            <a href="#" class="btn btn-primary">Agregar Categoria</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://unpkg.com/boxicons@2.1.2/dist/boxicons.js"></script>
</body>
</html>