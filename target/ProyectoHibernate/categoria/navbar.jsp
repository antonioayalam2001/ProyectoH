<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Escuela Web</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="./index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./CategoriasServlet?accion=nuevo">Add Category</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./CategoriasServlet?accion=listaDeCategorias">Full Category List</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./CategoriasServlet?accion=verReporte">Watch Report</a>
                </li>
<%--                Article Section--%>
                <li class="nav-item">
                    <a class="nav-link" href="./ArticuloS?accion=list">List Articles</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./ArticuloS?accion=nue">Add Article</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./ArticuloS?accion=graficar">Grphic Article</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./ArticuloS?accion=verReporte">Generate Report</a>
                </li>
            </ul>
        </div>
    </div>
</nav>