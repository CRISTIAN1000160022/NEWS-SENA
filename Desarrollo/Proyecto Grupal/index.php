<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>NEWS SENA</title>

  <!-- Font Awesome Icons -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>

  <!-- Plugin CSS -->
  <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

  <!-- Theme CSS - Includes Bootstrap -->
  <link href="css/creative.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="http://www.sena.edu.co/es-co/Paginas/default.aspx">♦News Sena♦</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto my-2 my-lg-0">
           <li class="nav-item">
       <!-- Button trigger modal -->
<button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">
Iniciar Sesión
</button>

          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#about">Sobre</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#services">Servicios</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#contact">Contacto</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Iniciar Sesión</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="pdo(LOGIN)/crud.php" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Tipo de documento:</label>
    <select name="tipo" class="form-control">
      <option>Seleccione tipo de documento</option>
      <option value="CC">Cedula de Cuidadania</option>
      <option value="CE">Cedula de Extranjeria</option>
      <option value="TI">Tarjeta de Identidad</option>
    </select>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Número de documento:</label>
    <input type="text" class="form-control" name="documento" placeholder="Ingrese su documento">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Contraseña:</label>
    <input type="password" class="form-control" name="password" id="Password" placeholder="Ingrese su contraseña">
  </div>
  <div class="form-group form-check">
    <a href="recuperarcontraseña.php">Recuperar contraseña</a>
  </div>
  <input type="submit" name="ingresar" class="btn btn-success" value="Ingresar">
</form>
      </div>
      <div class="modal-footer">
        <?php 
            if (isset($_GET['mensaje'])==true) 
            {
             echo "Tipo de documento, documento y/o contraseña incorrecta";
            }
         ?>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

  <!-- Masthead -->
  <header class="masthead">
    <div class="container h-100">
      <div class="row h-100 align-items-center justify-content-center text-center">
        <div class="col-lg-10 align-self-end">
          <h1 class="text-uppercase text-white font-weight-bold">☻Trabajando para tus novedades☻</h1>
          <hr class="divider my-4">
        </div>
        <div class="col-lg-8 align-self-baseline">
          <p class="text-white-75 font-weight-light mb-5">Este portal web te ayudara a encontrar </p>
          <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">Saber más</a>
        </div>
      </div>
    </div>
  </header>

  <!-- About Section -->
  <section class="page-section bg-primary" id="about">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 text-center">
          <h2 class="text-white mt-0">¿Qué es News Sena?</h2>
          <hr class="divider light my-4">
          <p class="text-white-50 mb-4">
News Sena...
<br> 
Es un sistema de gestion de retiros voluntarios enfocados hacia el SENA CEET para facilitar el proceso de retiros voluntarios, el cual, su objetivo es brindar un programa o un sistema de información más completo y diseñado para el apoyo de coordinación, instructores y aprendices.</p>
          <a class="btn btn-light btn-xl js-scroll-trigger" href="#services">Servicios</a>
        </div>
      </div>
    </div>
  </section>

  <!-- Services Section -->
  <section class="page-section" id="services">
    <div class="container">
      <h2 class="text-center mt-0">En tus servicios</h2>
      <hr class="divider my-4">
      <div class="row">
        <div class="col-lg-3 col-md-6 text-center">
          <div class="mt-5">
            <i class="fas fa-4x fa-gem text-primary mb-4"></i>
            <h3 class="h4 mb-2">Registrar retiros voluntarios</h3>
            <p class="text-muted mb-0">Como coordinador puedes registrar un retiro voluntario a cualquier aprendiz.</p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 text-center">
          <div class="mt-5">
            <i class="fas fa-4x fa-laptop-code text-primary mb-4"></i>
            <h3 class="h4 mb-2">Consultar</h3>
            <p class="text-muted mb-0">Como coordinador,aprendiz e instructor puedes consultar sí un aprendiz posee una determinada novedad o retiro voluntario.</p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 text-center">
          <div class="mt-5">
            <i class="fas fa-4x fa-globe text-primary mb-4"></i>
            <h3 class="h4 mb-2">Portal web</h3>
            <p class="text-muted mb-0">Usa nuestro portal web para consultar tus retiros voluntarios y resgistarlos(en caso de coordinación).</p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 text-center">
          <div class="mt-5">
            <i class="fas fa-4x fa-heart text-primary mb-4"></i>
            <h3 class="h4 mb-2">Calificanos</h3>
            <p class="text-muted mb-0">Después de usar nuestro portal web, puedes calificarnos y agregar las sugerencias.</p>
          </div>
        </div>
      </div>
    </div>
  </section>
<!-- Contact Section -->
  <section class="page-section" id="contact">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 text-center">
          <h2 class="mt-0">Mantegase en contacto</h2>
          <hr class="divider my-4">
          <p class="text-muted mb-5">¿Tienes algún incoveniente con el programa? ¡Llámenos o envíenos un correo electrónico y nos pondremos en contacto con usted lo antes posible!</p>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-4 ml-auto text-center mb-5 mb-lg-0">
          <i class="fas fa-phone fa-3x mb-3 text-muted"></i>
          <div>+57 314 429 1961</div>
        </div>
        <div class="col-lg-4 mr-auto text-center">
          <i class="fas fa-envelope fa-3x mb-3 text-muted"></i>
          <!-- Make sure to change the email address in anchor text AND the link below! -->
          <a class="d-block" href="mailto:contact@yourwebsite.com">cajimenez220@misena.edu.co</a>
        </div>
      </div>
    </div>
  </section>
  <!-- Footer -->
  <footer class="bg-light py-5">
    <div class="container">
      <div class="small text-center text-muted">2019-News Sena- Bogotá D.C</div>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="js/creative.min.js"></script>
</body>
</html>
