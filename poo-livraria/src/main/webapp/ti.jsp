<%@page contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="utilidades/cabecalho.jsp">
  <jsp:param name="paginaAtual" value="${'ti'}"/>
  <jsp:param name="usuarioSessao" value="${usuarioSessao}"/>
</jsp:include>

<!-- Não mudar ACIMA -->

</style>

<!-- Cadastro de produtos -->
<section class="">
  <div class="container">

    <!-- Formuário de cadastro -->
    <div class="row justify-content-center">
      <div class="col-xl-8 col-lg-9">
        <h1 class="text-center">Cadastro de usuário</h1>
        
        <c:if test="${sucesso != null}">
          <c:if test="${sucesso == true}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
          </c:if>
          <c:if test="${sucesso == false}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
          </c:if>
              ${mensagem}
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
        </c:if>
        
        <c:if test="${ti.id == null}">
          <c:url value="/ti" var="registerUrl" />
        </c:if>
        <c:if test="${ti.id != null}">
          <c:url value="/ti/editar" var="registerUrl" />
        </c:if>
        
        <form action="${registerUrl}" method="post">
          <c:if test="${ti.id ne null}">
            <div class="form-group">
              <label for="idUsuario">ID:</label>
              <input type="text" class="form-control" id="idUsuario" name="idUsuario" value="${ti.id}" placeholder="0000" readonly>
            </div>
          </c:if>
          <div class="form-group">
            <label for="nome">*Nome:</label>
            <input type="text" class="form-control" id="nome" name="nome" value="${ti.nome}" required="true" placeholder="Ex: Mariana da Cruz">
          </div>
          <div class="form-group">
            <label for="email">*E-mail:</label>
            <input type="text" class="form-control" id="email" name="email" value="${ti.email}" required="true" placeholder="Ex: mariana@gmail.com">
          </div>
           <div class="form-group">
            <label for="senha">*Senha:</label>
            <input type="text" class="form-control" id="senha" name="senha" placeholder="Ex: 123">
          </div>
          <div class="form-group mb-0">
            <label for="departamento">*Departamento:</label>
          </div>
          <div class="form-group">
            <select name="idDepartamento" class="custom-select">
              <c:forEach items="${departamentos}" var="departamento">
                <option value="${departamento.idDepartamento}" <c:if test="${ti.idDepartamento == departamento.idDepartamento}">selected</c:if> >${departamento.nomeDepartamento}</option> 
              </c:forEach>
            </select>
            <svg class="icon" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M14.4444 8.41358C14.7776 8.2281 15.1875 8.46907 15.1875 8.85048V15.1495C15.1875 15.5309 14.7776 15.7719 14.4444 15.5864L8.78505 12.4369C8.44258 12.2463 8.44258 11.7537 8.78505 11.5631L14.4444 8.41358Z" fill="#212529"></path>
            </svg>
          </div>
          <div class="form-group mb-0">
            <label for="idFilial">*Filial:</label>
          </div>
          <div class="form-group">
            <select name="idFilial" class="custom-select">
              <c:forEach items="${filiais}" var="filial">
                <option value="${filial.idFilial}" <c:if test="${ti.idFilial == filial.idFilial}">selected</c:if> >${filial.nomeFilial}</option> 
              </c:forEach>
            </select>
            <svg class="icon" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M14.4444 8.41358C14.7776 8.2281 15.1875 8.46907 15.1875 8.85048V15.1495C15.1875 15.5309 14.7776 15.7719 14.4444 15.5864L8.78505 12.4369C8.44258 12.2463 8.44258 11.7537 8.78505 11.5631L14.4444 8.41358Z" fill="#212529"></path>
            </svg>
          </div>
          <c:if test="${ti.id ne null}">
            <div class="form-group mt-5">
              <button class="btn-block btn btn-primary-2" value="Update" type="submit">Editar</button>
            </div>
          </c:if>
          <c:if test="${ti.id eq null}">
            <div class="form-group mt-5">
              <button class="btn-block btn btn-primary" value="Save" type="submit">Salvar</button>
            </div>
          </c:if>
        </form>
      </div>
    </div>

  </div>
</section>

<!-- Lista de produtos -->
<section class="bg-primary-alt">
  <div class="container">

    <!-- Formuário de pesquisa -->
    <div class="row justify-content-center mb-5">
      <div class="col-xl-8 col-lg-9 text-center">
        <h1>Lista de usuários</h1>

          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text" id="basic-addon-1">
                <svg class="icon" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                  <title>Pesquisa</title>
                  <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                    <rect opacity="0" x="0" y="0" width="24" height="24"></rect>
                    <path d="M14.2928932,16.7071068 C13.9023689,16.3165825 13.9023689,15.6834175 14.2928932,15.2928932 C14.6834175,14.9023689 15.3165825,14.9023689 15.7071068,15.2928932 L19.7071068,19.2928932 C20.0976311,19.6834175 20.0976311,20.3165825 19.7071068,20.7071068 C19.3165825,21.0976311 18.6834175,21.0976311 18.2928932,20.7071068 L14.2928932,16.7071068 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
                    <path d="M11,16 C13.7614237,16 16,13.7614237 16,11 C16,8.23857625 13.7614237,6 11,6 C8.23857625,6 6,8.23857625 6,11 C6,13.7614237 8.23857625,16 11,16 Z M11,18 C7.13400675,18 4,14.8659932 4,11 C4,7.13400675 7.13400675,4 11,4 C14.8659932,4 18,7.13400675 18,11 C18,14.8659932 14.8659932,18 11,18 Z" fill="#000000" fill-rule="nonzero"></path>
                  </g>
                </svg>
              </span>
            </div>
            <input type="search" class="form-control form-control-lg" placeholder="Digite a sua pesquisa" id="pesquisa-input" >
          </div>

      </div>
    </div>

    <!-- Tabela de produtos -->
    <div class="row justify-content-center table-responsive">
      <div class="col">
        <table class="table table-hover" id="table-cadastro-usuario">
          <thead>
            <tr>
              <th scope="col">ID</th>
              <th scope="col">Nome</th>
              <th scope="col">E-mail</th>       
              <th scope="col">Departamento</th>
              <th scope="col">Filial</th>
            </tr>
          </thead>
          <tbody id="tb-lista">
            <c:forEach items="${tis}" var="ti">
              <tr>
                <th scope="row">${ti.id}</th>
                <td>${ti.nome}</td>
                <td>${ti.email}</td>
                <td>${ti.nomeDepartamento}</td>        
                <td>${ti.nomeFilial}</td>
                <td>
                  <a href="${pageContext.request.contextPath}/ti/editar?idUsuario=${ti.id}" class="mr-2">
                    <svg class="icon bg-primary" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                      <title>Icon For Edit</title>
                      <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                        <rect opacity="0" x="0" y="0" width="24" height="24"></rect>
                        <path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "></path>
                        <rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"></rect>
                      </g>
                    </svg>
                  </a>
                  <a href="${pageContext.request.contextPath}/ti/desativar?idUsuario=${ti.id}" onclick="return confirm('Tem certeza que deseja desativar este usuário?');" class="">
                    <svg class="icon bg-primary-2" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                      <title>Icon For Trash</title>
                      <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                        <rect opacity="0" x="0" y="0" width="24" height="24"></rect>
                        <path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#000000" fill-rule="nonzero"></path>
                        <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"></path>
                      </g>
                    </svg>
                  </a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>

  </div>
</section>

<!-- Não mudar ABAIXO -->

<jsp:include page="utilidades/rodape.jsp" />
