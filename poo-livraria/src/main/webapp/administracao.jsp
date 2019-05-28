<%@page contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="utilidades/cabecalho.jsp">
  <jsp:param name="paginaAtual" value="${'administracao'}"/>
  <jsp:param name="usuarioSessao" value="${usuarioSessao}"/>
</jsp:include>

<!-- Não mudar ACIMA -->
    <!-- Adicionando JQuery -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous">
                
    </script>
        <!-- Adicionando Javascript -->
    <script type="text/javascript" >

        $(document).ready(function() {

            function limpa_formulário_cep() {
                // Limpa valores do formulário de cep.

                $("#cidade").val("");
                $("#estado").val("");
            }
            
            //Quando o campo cep perde o foco.
            $("#cep").blur(function() {

                //Nova variável "cep" somente com dígitos.
                var cep = $(this).val().replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if(validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.


                        $("#cidade").val("...");
                        $("#estado").val("...");

                        //Consulta o webservice viacep.com.br/
                        $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

                            if (!("erro" in dados)) {
                                //Atualiza os campos com os valores da consulta.
                                $("#cidade").val(dados.localidade);
                                $("#estado").val(dados.uf);
                            } //end if.
                            else {
                                //CEP pesquisado não foi encontrado.
                                limpa_formulário_cep();
                                alert("CEP não encontrado.");
                            }
                        });
                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            });
        });

    </script>

<!-- Cadastro de filiais -->
<section class="">
  <div class="container">

    <!-- Formuário de cadastro -->
    <div class="row justify-content-center">
      <div class="col-xl-8 col-lg-9">
        <h1 class="text-center">Cadastro de filial</h1>

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

          <c:if test="${administracao.idFilial == null}">
            <c:url value="/administracao" var="registerUrl" />
          </c:if>
          <c:if test="${administracao.idFilial != null}">
            <c:url value="/administracao/editar" var="registerUrl" />
          </c:if>

          <form action="${registerUrl}" method="post">
            <c:if test="${administracao.idFilial ne null}">
              <div class="form-group">
                <label for="idFilial">ID:</label>
                <input type="text" class="form-control" id="idFilial" name="idFilial" value="${administracao.idFilial}" placeholder="0000" readonly>
              </div>
            </c:if>
            <div class="form-group">
              <label for="nomeFilial">*Nome:</label>
              <input type="text" class="form-control" id="nomeFilial" name="nomeFilial" value="${administracao.nomeFilial}" required="true" placeholder="Ex: Matriz">
            </div>
            <div class="form-group">
              <label for="ano">*CNPJ</label>
              <input type="text" class="form-control" id="cnpj" name="cnpj" value="${administracao.cnpj}" required="true" placeholder="Ex: 27.209.673/0001-02" onkeyup="FormataCnpj(this,event)" onblur="if(!validarCNPJ(this.value)){alert('CNPJ Informado é inválido'); this.value='';}" maxlength="18">
            </div>
            <div class="form-group">
              <label for="placa">*CEP:</label>
              <input type="text" class="form-control" name="cep" id="cep" value="${administracao.cep}" aria-describedby="input-group-example" required="true" placeholder="Ex: 04679-320" maxlength="9">
            </div> 
            <div class="form-group">
              <label for="modelo">*Estado</label>
              <input type="text" class="form-control" id="estado" name="estado" value="${administracao.estado}" required="true" placeholder="Ex: São Paulo">
            </div>
            <div class="form-group">
              <label for="marca">*Cidade</label>
              <input type="text" class="form-control" id="cidade" name="cidade" value="${administracao.cidade}" required="true" placeholder="Ex: São Paulo">
            </div>

            <c:if test="${administracao.idFilial ne null}">
              <div class="form-group mt-5">
                <button class="btn-block btn btn-primary-2" value="Update" type="submit">Editar</button>
              </div>
            </c:if>
            <c:if test="${administracao.idFilial eq null}">
              <div class="form-group mt-5">
                <button class="btn-block btn btn-primary" value="Save" type="submit">Salvar</button>
              </div>
            </c:if>
          </form>
        </div>
      </div>

    </div>
  </div>
</section>

<!-- Lista de Filiais -->
<section class="bg-primary-alt">
  <div class="container">

    <!-- Formuário de pesquisa -->
    <div class="row justify-content-center mb-5">
      <div class="col-xl-8 col-lg-9 text-center">
        <h1>Lista de filiais</h1>

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

    <!-- Tabela de Filiaiss -->
    <div class="row justify-content-center table-responsive">
      <div class="col">
        <table class="table table-hover" id="table-cadastro-filial">
          <thead>
            <tr>
              <th scope="col">ID</th>
              <th scope="col">Filial</th>
              <th scope="col">CNPJ</th>
              <th scope="col">Estado</th>
              <th scope="col">Cidade</th>
              <th scope="col">Cep</th>
            </tr>
          </thead>
          <tbody id="tb-lista">
            <c:forEach items="${administracaos}" var="administracao">
              <tr>
                <th scope="row">${administracao.idFilial}</th>
                <td>${administracao.nomeFilial}</td>
                <td>${administracao.cnpj}</td>
                <td>${administracao.estado}</td>
                <td>${administracao.cidade}</td>
                <td>${administracao.cep}</td>
                <td>
                  <a href="${pageContext.request.contextPath}/administracao/editar?idFilial=${administracao.idFilial}" class="mr-2">
                    <svg class="icon bg-primary" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <title>Icon For Edit</title>
                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                    <rect opacity="0" x="0" y="0" width="24" height="24"></rect>
                    <path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "></path>
                    <rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"></rect>
                    </g>
                    </svg>
                  </a>
                  <a href="${pageContext.request.contextPath}/administracao/desativar?idFilial=${administracao.idFilial}" onclick="return confirm('Tem certeza que deseja desativar este filial?');" class="">
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

<script>
    function FormataCnpj(campo, teclapres)
			{
				var tecla = teclapres.keyCode;
				var vr = new String(campo.value);
				vr = vr.replace(".", "");
				vr = vr.replace("/", "");
				vr = vr.replace("-", "");
				tam = vr.length + 1;
				if (tecla != 14)
				{
					if (tam == 3)
						campo.value = vr.substr(0, 2) + '.';
					if (tam == 6)
						campo.value = vr.substr(0, 2) + '.' + vr.substr(2, 5) + '.';
					if (tam == 10)
						campo.value = vr.substr(0, 2) + '.' + vr.substr(2, 3) + '.' + vr.substr(6, 3) + '/';
					if (tam == 15)
						campo.value = vr.substr(0, 2) + '.' + vr.substr(2, 3) + '.' + vr.substr(6, 3) + '/' + vr.substr(9, 4) + '-' + vr.substr(13, 2);
				}
			}



function validarCNPJ(cnpj) {
 
    cnpj = cnpj.replace(/[^\d]+/g,'');
 
    if(cnpj == '') return false;
     
    if (cnpj.length != 14)
        return false;
 
    // Elimina CNPJs invalidos conhecidos
    if (cnpj == "00000000000000" || 
        cnpj == "11111111111111" || 
        cnpj == "22222222222222" || 
        cnpj == "33333333333333" || 
        cnpj == "44444444444444" || 
        cnpj == "55555555555555" || 
        cnpj == "66666666666666" || 
        cnpj == "77777777777777" || 
        cnpj == "88888888888888" || 
        cnpj == "99999999999999")
        return false;
         
    // Valida DVs
    tamanho = cnpj.length - 2
    numeros = cnpj.substring(0,tamanho);
    digitos = cnpj.substring(tamanho);
    soma = 0;
    pos = tamanho - 7;
    for (i = tamanho; i >= 1; i--) {
      soma += numeros.charAt(tamanho - i) * pos--;
      if (pos < 2)
            pos = 9;
    }
    resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
    if (resultado != digitos.charAt(0))
        return false;
         
    tamanho = tamanho + 1;
    numeros = cnpj.substring(0,tamanho);
    soma = 0;
    pos = tamanho - 7;
    for (i = tamanho; i >= 1; i--) {
      soma += numeros.charAt(tamanho - i) * pos--;
      if (pos < 2)
            pos = 9;
    }
    resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
    if (resultado != digitos.charAt(1))
          return false;
           
    return true;
    
}
</script>





<!-- Não mudar ABAIXO -->

<jsp:include page="utilidades/rodape.jsp" />