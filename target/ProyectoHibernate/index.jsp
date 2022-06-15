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
Escuela Web    </h1>
    <p class="p-4 position-relative ">
        ontrary to popular belief, Lorem Ipsum is not simply random text. It has
        roots in a piece of classical Latin literature from 45 BC, making it
        over 2000 years old. Richard McClintock, a Latin professor at
        Hampden-Sydney College in Virginia, looked up one of the more obscure
        Latin words, consectetur, from a Lorem Ipsum passage, and going through
        the cites of the word in classical literature, discovered the
        undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33
        of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by
        Cicero, written in 45 BC. This book is a treatise on the theory of
        ethics, very popular during the Renaissance. The first line of Lorem
        Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section
        1.10.32.
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
                                Some quick example text to build on the card title and make up
                                the bulk of the card's content.
                            </p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-12  col-md-4">
                    <div class="card">
                        <i class='bx bxl-deezer' ></i>
                        <div class="card-body d-flex flex-column align-items-center">
                            <h5 class="card-title">Graficas</h5>
                            <p class="card-text">
                                Some quick example text to build on the card title and make up
                                the bulk of the card's content.
                            </p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mt-3 mt-md-0">
                    <div class="card justify-content-center align-items-center">
                        <i class='bx bx-trash' ></i>
                        <div class="card-body d-flex flex-column align-items-center">
                            <h5 class="card-title">Eliminar</h5>
                            <p class="card-text">
                                Some quick example text to build on the card title and make up
                                the bulk of the card's content.
                            </p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mt-3 mt-md-2 align-self-center">
                    <div class="card">
                        <i class='bx bx-add-to-queue' ></i>
                        <div class="card-body d-flex flex-column align-items-center">
                            <h5 class="card-title">Agregar</h5>
                            <p class="card-text">
                                Some quick example text to build on the card title and make up
                                the bulk of the card's content.
                            </p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
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