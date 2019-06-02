<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <title>TADES Ltda.</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A corporate Bootstrap theme by Medium Rare">
    <link href="https://brubsduarte.github.io/assets/css/loaders/loader-typing.css" rel="stylesheet" type="text/css" media="all" />
    <link href="https://brubsduarte.github.io/assets/css/theme-event.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="preload" as="font" href="https://brubsduarte.github.io/assets/fonts/Inter-UI-upright.var.woff2" type="font/woff2" crossorigin="anonymous">
    <link rel="preload" as="font" href="https://brubsduarte.github.io/assets/fonts/Inter-UI.var.woff2" type="font/woff2" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
  </head>
  <style>
      .bg-primary-2 {
        background-color: #373b44f7 !important;
      }
      
      .nav-link.btn-light .icon * {
        fill: #0089ff;
      }
      
      .form-group label {
        color: #000000;
      }
      
      .form-control {
    display: block;
    width: 100%;
    height: calc(2.375rem + 2px);
    padding: 0.4375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #212529;
    border-radius: 0.3125rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    }
    
    .input-group{
        color: #495057;
    }
    
    .input-group-text {
    display: flex;
    align-items: center;
    padding: 0.4375rem 0.75rem;
    margin-bottom: 0;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #000000;
    text-align: center;
    white-space: nowrap;
    background-color: #ffffff00;
    border: 1px solid #020122;
    border-radius: 0.3125rem;
}

.bg-primary-alt {
    background: #02012226;
}
  </style>
  <body>

    <section class="bg-primary-2 text-light pt-4 pb-0">
      <div class="container pb-3">

        <div class="row mb-3">
          <div class="col-4">
            <p>${usuarioSessao.getNome()}</p>
          </div>
          <div class="col-4 text-center">
            <a href="${pageContext.request.contextPath}/bemvindo">
              <img src="https://i.pinimg.com/originals/07/e2/73/07e273c2fa86e514327bd2f7f5b08309.png" style="height: 150px; width: auto;" class="mb-">
            </a>
          </div>
          <div class="col-4">
            <ul class="nav justify-content-end text-light">
              <li class="nav-item mx-1">
                <a class="nav-link btn btn-light text-light p-0" href="${pageContext.request.contextPath}/sair">Sair</a>
              </li> 
            </ul>
          </div>
        </div>
        
        <div class="row justify-content-center text-center">
          
        </div>

        <div class="row justify-content-center">
          <div class="col">
            <ul class="nav justify-content-center text-light">
              <c:if test="${usuarioSessao.acessaProduto()}">
                <li class="nav-item mx-1">
                <c:if test="${param.paginaAtual == 'produto'}">
                  <a class="nav-link btn active btn-primary">
                </c:if>
                <c:if test="${param.paginaAtual != 'produto'}">
                  <a class="nav-link btn btn-light text-light" href="${pageContext.request.contextPath}/produto">
                </c:if>
                  <svg class="icon bg-primary" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <title>Produto</title>
                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                      <rect opacity="0" x="0" y="0" width="24" height="24"></rect>
                      <polygon fill="#000000" opacity="0.3" transform="translate(8.885842, 16.114158) rotate(-315.000000) translate(-8.885842, -16.114158) " points="6.89784488 10.6187476 6.76452164 19.4882481 8.88584198 21.6095684 11.0071623 19.4882481 9.59294876 18.0740345 10.9659914 16.7009919 9.55177787 15.2867783 11.0071623 13.8313939 10.8837471 10.6187476"></polygon>
                      <path d="M15.9852814,14.9852814 C12.6715729,14.9852814 9.98528137,12.2989899 9.98528137,8.98528137 C9.98528137,5.67157288 12.6715729,2.98528137 15.9852814,2.98528137 C19.2989899,2.98528137 21.9852814,5.67157288 21.9852814,8.98528137 C21.9852814,12.2989899 19.2989899,14.9852814 15.9852814,14.9852814 Z M16.1776695,9.07106781 C17.0060967,9.07106781 17.6776695,8.39949494 17.6776695,7.57106781 C17.6776695,6.74264069 17.0060967,6.07106781 16.1776695,6.07106781 C15.3492424,6.07106781 14.6776695,6.74264069 14.6776695,7.57106781 C14.6776695,8.39949494 15.3492424,9.07106781 16.1776695,9.07106781 Z" fill="#000000" transform="translate(15.985281, 8.985281) rotate(-315.000000) translate(-15.985281, -8.985281) "></path>
                    </g>
                  </svg>
                  Produto</a>
              </li>
              </c:if>
              <c:if test="${usuarioSessao.acessaCliente()}">
                <li class="nav-item mx-1">
                <c:if test="${param.paginaAtual == 'cliente'}">
                  <a class="nav-link btn active btn-primary">
                </c:if>
                <c:if test="${param.paginaAtual != 'cliente'}">
                  <a class="nav-link btn btn-light text-light" href="${pageContext.request.contextPath}/cliente">
                </c:if>
                  <svg class="icon bg-primary" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <title>Cliente</title>
                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                      <polygon points="0 0 24 0 24 24 0 24" opacity="0"></polygon>
                      <path d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
                      <path d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z" fill="#000000" fill-rule="nonzero"></path>
                    </g>
                  </svg>
                  Cliente</a>
              </li>
              </c:if>
              <c:if test="${usuarioSessao.acessaAluguel()}">
                <li class="nav-item mx-1">
                <c:if test="${param.paginaAtual == 'aluguel'}">
                  <a class="nav-link btn active btn-primary">
                </c:if>
                <c:if test="${param.paginaAtual != 'aluguel'}">
                  <a class="nav-link btn btn-light text-light" href="${pageContext.request.contextPath}/aluguel">
                </c:if>
                  <svg class="icon bg-primary" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <title>Aluguel</title>
                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                      <rect opacity="0" x="0" y="0" width="24" height="24"></rect>
                      <path d="M18.1446364,11.84388 L17.4471627,16.0287218 C17.4463569,16.0335568 17.4455155,16.0383857 17.4446387,16.0432083 C17.345843,16.5865846 16.8252597,16.9469884 16.2818833,16.8481927 L4.91303792,14.7811299 C4.53842737,14.7130189 4.23500006,14.4380834 4.13039941,14.0719812 L2.30560137,7.68518803 C2.28007524,7.59584656 2.26712532,7.50338343 2.26712532,7.4104669 C2.26712532,6.85818215 2.71484057,6.4104669 3.26712532,6.4104669 L16.9929851,6.4104669 L17.606173,3.78251876 C17.7307772,3.24850086 18.2068633,2.87071314 18.7552257,2.87071314 L20.8200821,2.87071314 C21.4717328,2.87071314 22,3.39898039 22,4.05063106 C22,4.70228173 21.4717328,5.23054898 20.8200821,5.23054898 L19.6915238,5.23054898 L18.1446364,11.84388 Z" fill="#000000" opacity="0.3"></path>
                      <path d="M6.5,21 C5.67157288,21 5,20.3284271 5,19.5 C5,18.6715729 5.67157288,18 6.5,18 C7.32842712,18 8,18.6715729 8,19.5 C8,20.3284271 7.32842712,21 6.5,21 Z M15.5,21 C14.6715729,21 14,20.3284271 14,19.5 C14,18.6715729 14.6715729,18 15.5,18 C16.3284271,18 17,18.6715729 17,19.5 C17,20.3284271 16.3284271,21 15.5,21 Z" fill="#000000"></path>
                    </g>
                  </svg>
                  Aluguel</a>
              </li>
              </c:if>
              <c:if test="${usuarioSessao.acessaDevolucao()}">
                <li class="nav-item mx-1">
                <c:if test="${param.paginaAtual == 'devolucao'}">
                  <a class="nav-link btn active btn-primary">
                </c:if>
                <c:if test="${param.paginaAtual != 'devolucao'}">
                  <a class="nav-link btn btn-light text-light" href="${pageContext.request.contextPath}/devolucao">
                </c:if>
                  <svg class="icon bg-primary" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <title>Aluguel</title>
                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                      <rect opacity="0" x="0" y="0" width="24" height="24"></rect>
                      <path d="M18.1446364,11.84388 L17.4471627,16.0287218 C17.4463569,16.0335568 17.4455155,16.0383857 17.4446387,16.0432083 C17.345843,16.5865846 16.8252597,16.9469884 16.2818833,16.8481927 L4.91303792,14.7811299 C4.53842737,14.7130189 4.23500006,14.4380834 4.13039941,14.0719812 L2.30560137,7.68518803 C2.28007524,7.59584656 2.26712532,7.50338343 2.26712532,7.4104669 C2.26712532,6.85818215 2.71484057,6.4104669 3.26712532,6.4104669 L16.9929851,6.4104669 L17.606173,3.78251876 C17.7307772,3.24850086 18.2068633,2.87071314 18.7552257,2.87071314 L20.8200821,2.87071314 C21.4717328,2.87071314 22,3.39898039 22,4.05063106 C22,4.70228173 21.4717328,5.23054898 20.8200821,5.23054898 L19.6915238,5.23054898 L18.1446364,11.84388 Z" fill="#000000" opacity="0.3"></path>
                      <path d="M6.5,21 C5.67157288,21 5,20.3284271 5,19.5 C5,18.6715729 5.67157288,18 6.5,18 C7.32842712,18 8,18.6715729 8,19.5 C8,20.3284271 7.32842712,21 6.5,21 Z M15.5,21 C14.6715729,21 14,20.3284271 14,19.5 C14,18.6715729 14.6715729,18 15.5,18 C16.3284271,18 17,18.6715729 17,19.5 C17,20.3284271 16.3284271,21 15.5,21 Z" fill="#000000"></path>
                    </g>
                  </svg>
                  Devolução</a>
              </li>
              </c:if>
              <c:if test="${usuarioSessao.acessaTi()}">
                <li class="nav-item mx-1">
                <c:if test="${param.paginaAtual == 'ti'}">
                  <a class="nav-link btn active btn-primary">
                </c:if>
                <c:if test="${param.paginaAtual != 'ti'}">
                  <a class="nav-link btn btn-light text-light" href="${pageContext.request.contextPath}/ti">
                </c:if>
                  <svg class="icon bg-primary" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <title>TI</title>
                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                      <polygon points="0 0 24 0 24 24 0 24" opacity="0"></polygon>
                      <path d="M18,14 C16.3431458,14 15,12.6568542 15,11 C15,9.34314575 16.3431458,8 18,8 C19.6568542,8 21,9.34314575 21,11 C21,12.6568542 19.6568542,14 18,14 Z M9,11 C6.790861,11 5,9.209139 5,7 C5,4.790861 6.790861,3 9,3 C11.209139,3 13,4.790861 13,7 C13,9.209139 11.209139,11 9,11 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
                      <path d="M17.6011961,15.0006174 C21.0077043,15.0378534 23.7891749,16.7601418 23.9984937,20.4 C24.0069246,20.5466056 23.9984937,21 23.4559499,21 L19.6,21 C19.6,18.7490654 18.8562935,16.6718327 17.6011961,15.0006174 Z M0.00065168429,20.1992055 C0.388258525,15.4265159 4.26191235,13 8.98334134,13 C13.7712164,13 17.7048837,15.2931929 17.9979143,20.2 C18.0095879,20.3954741 17.9979143,21 17.2466999,21 C13.541124,21 8.03472472,21 0.727502227,21 C0.476712155,21 -0.0204617505,20.45918 0.00065168429,20.1992055 Z" fill="#000000" fill-rule="nonzero"></path>
                    </g>
                  </svg>
                  TI</a>
              </li>
              </c:if>
              <c:if test="${usuarioSessao.acessaAdministracao()}">
                <li class="nav-item mx-1">
                <c:if test="${param.paginaAtual == 'administracao'}">
                  <a class="nav-link btn active btn-primary">
                </c:if>
                <c:if test="${param.paginaAtual != 'administracao'}">
                  <a class="nav-link btn btn-light text-light" href="${pageContext.request.contextPath}/administracao">
                </c:if>
                  <svg class="icon bg-primary" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <title>Administração</title>
                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                      <rect opacity="0" x="0" y="0" width="24" height="24"></rect>
                      <path d="M13.5,21 L13.5,18 C13.5,17.4477153 13.0522847,17 12.5,17 L11.5,17 C10.9477153,17 10.5,17.4477153 10.5,18 L10.5,21 L5,21 L5,4 C5,2.8954305 5.8954305,2 7,2 L17,2 C18.1045695,2 19,2.8954305 19,4 L19,21 L13.5,21 Z M9,4 C8.44771525,4 8,4.44771525 8,5 L8,6 C8,6.55228475 8.44771525,7 9,7 L10,7 C10.5522847,7 11,6.55228475 11,6 L11,5 C11,4.44771525 10.5522847,4 10,4 L9,4 Z M14,4 C13.4477153,4 13,4.44771525 13,5 L13,6 C13,6.55228475 13.4477153,7 14,7 L15,7 C15.5522847,7 16,6.55228475 16,6 L16,5 C16,4.44771525 15.5522847,4 15,4 L14,4 Z M9,8 C8.44771525,8 8,8.44771525 8,9 L8,10 C8,10.5522847 8.44771525,11 9,11 L10,11 C10.5522847,11 11,10.5522847 11,10 L11,9 C11,8.44771525 10.5522847,8 10,8 L9,8 Z M9,12 C8.44771525,12 8,12.4477153 8,13 L8,14 C8,14.5522847 8.44771525,15 9,15 L10,15 C10.5522847,15 11,14.5522847 11,14 L11,13 C11,12.4477153 10.5522847,12 10,12 L9,12 Z M14,12 C13.4477153,12 13,12.4477153 13,13 L13,14 C13,14.5522847 13.4477153,15 14,15 L15,15 C15.5522847,15 16,14.5522847 16,14 L16,13 C16,12.4477153 15.5522847,12 15,12 L14,12 Z" fill="#000000"></path>
                      <rect fill="#FFFFFF" x="13" y="8" width="3" height="3" rx="1"></rect>
                      <path d="M4,21 L20,21 C20.5522847,21 21,21.4477153 21,22 L21,22.4 C21,22.7313708 20.7313708,23 20.4,23 L3.6,23 C3.26862915,23 3,22.7313708 3,22.4 L3,22 C3,21.4477153 3.44771525,21 4,21 Z" fill="#000000" opacity="0.3"></path>
                    </g>
                  </svg>
                  Administração</a>
              </li>
              </c:if>
            </ul>
          </div>
        </div>
      </div>

      <div class="divider">
        <svg class="bg-white" width="100%" height="100%" version="1.1" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveAspectRatio="none">
          <path fill="#ffffff" d="M0,-2.13162821e-14 C16.6666667,66.6666667 33.3333333,100 50,100 C66.6666667,100 83.3333333,66.6666667 100,-2.13162821e-14 L100,100 L0,100 L0,-2.13162821e-14 Z"></path>
          <path fill="#ffffff" d="M0,2.13162821e-14 C11.1107835,33.3333333 19.4438711,50 24.9992629,50 C33.3328419,50 41.666421,5.09814413e-13 50,5.09814413e-13 C58.333579,5.09814413e-13 66.6671581,50 75.0007371,50 C80.5561289,50 88.8892165,33.3333333 100,2.13162821e-14 L100,100 L0,100 L0,2.13162821e-14 Z" fill-opacity="0.1"></path>
          <path fill="#ffffff" d="M0,2.13162821e-14 C44.4442806,66.6666667 69.4442806,100 75,100 C80.5553918,100 88.8887251,66.6666667 100,2.13162821e-14 L100,100 L0,100 L0,2.13162821e-14 Z" fill-opacity="0.1"></path>
          <path fill="#ffffff" d="M0,-2.13162821e-14 C44.4442806,66.6666667 69.4442806,100 75,100 C80.5553918,100 88.8887251,66.6666667 100,-2.13162821e-14 L100,100 L0,100 L0,-2.13162821e-14 Z" fill-opacity="0.1" transform="translate(50.000000, 50.000000) scale(-1, 1) translate(-50.000000, -50.000000) "></path>
        </svg>
      </div>
    </section>