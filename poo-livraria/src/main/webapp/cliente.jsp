<%@page contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="utilidades/cabecalho.jsp">
  <jsp:param name="paginaAtual" value="${'cliente'}"/>
  <jsp:param name="usuarioSessao" value="${usuarioSessao}"/>
</jsp:include>

<!-- Não mudar ACIMA -->

<!-- Cadastro de clientes -->
<!-- Cadastro de produtos -->
<section class="">
  <div class="container">

    <!-- Formuário de cadastro -->
    <div class="row justify-content-center">
      <div class="col-xl-8 col-lg-9">
        <h1 class="text-center">Cadastro de cliente</h1>
        
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
        
        <c:if test="${cliente.id == null}">
          <c:url value="/cliente" var="registerUrl" />
        </c:if>
        <c:if test="${cliente.id != null}">
          <c:url value="/cliente/editar" var="registerUrl" />
        </c:if>
        
        <form action="${registerUrl}" method="post">
          <c:if test="${cliente.id ne null}">
            <div class="form-group">
              <label for="idCliente">ID:</label>
              <input type="text" class="form-control" id="idCliente" name="idCliente" value="${cliente.id}" placeholder="0000" readonly>
            </div>
          </c:if>
          <div class="form-group">
            <label for="nomeCliente">*Nome:</label>
            <input type="text" class="form-control" id="nomeCliente" name="nomeCliente" value="${cliente.nome}" required="true" placeholder="Ex: Paola Bracho" maxlength="50">
          </div>
          <div class="form-group">
            <label for="cpf">*CPF:</label>
            <input type="text" class="form-control" id="cpf" name="cpf" value="${cliente.cpf}" required="true" placeholder="Ex: 419759388xx" maxlength="14" onBlur="javascript:validaCPF(this);" onkeyup="maskIt(this,event,'###.###.###-##')">
          </div>
          <div class="form-group">
            <label for="email">*E-mail:</label>
            <input type="text" class="form-control" id="email" name="email" value="${cliente.email}" required="email" placeholder="Ex: paola.bracho@gmail.com">
          </div>
          <div class="form-group">
            <label for="telefone">*Telefone:</label>
            <input type="text" class="form-control" name="telefone" id="telefone" value="${cliente.telefone}" aria-describedby="input-group-example" required="true" placeholder="Ex: (99) 6000-9005" onkeyup="maskIt(this,event,'(##)####-####')">
          </div>
          <div class="form-group">
            <label for="cep">*Cep:</label>
            <input type="text" class="form-control" name="cep" id="cep" value="${cliente.cep}" aria-describedby="input-group-example" required="true" placeholder="Ex: 0440900" maxlength="10" onkeyup="maskIt(this,event,'#####-###')" >
          </div>
          <div class="form-group">
            <label for="rua">*Rua:</label>
            <input type="text" class="form-control" name="rua" id="rua" value="${cliente.rua}" aria-describedby="input-group-example" required="true" placeholder="Ex: Rua mario santana, 50">
          </div>
          <div class="form-group">
            <label for="bairro">*Bairro:</label>
            <input type="text" class="form-control" name="bairro" id="bairro" value="${cliente.bairro}" aria-describedby="input-group-example" required="true" placeholder="Ex: Santo Amaro">
          </div>
          <div class="form-group">
            <label for="cidade">*Cidade:</label>
            <input type="text" class="form-control" name="cidade" id="cidade" value="${cliente.cidade}" aria-describedby="input-group-example" required="true" placeholder="Ex: São Paulo">
          </div>
          <div class="form-group">
            <label for="estado">*Estado:</label>
            <input type="text" class="form-control" name="estado" id="estado" value="${cliente.estado}" aria-describedby="input-group-example" required="true" placeholder="Ex: SP" maxlength="2">
          </div>
          
          <c:if test="${cliente.id ne null}">
            <div class="form-group mt-5">
              <button class="btn-block btn btn-primary-2" value="Update" type="submit">Editar</button>
            </div>
          </c:if>
          <c:if test="${cliente.id eq null}">
            <div class="form-group mt-5">
              <button class="btn-block btn btn-primary" value="Save" type="submit">Salvar</button>
            </div>
          </c:if>
        </form>
      </div>
    </div>

  </div>
</section>

<!-- Lista de clientes -->
<section class="bg-primary-alt">
  <div class="container">

    <!-- Formuário de pesquisa -->
    <div class="row justify-content-center mb-5">
      <div class="col-xl-8 col-lg-9 text-center">
        <h1>Lista de clientes</h1>

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

        <div class="table-responsive">
          <table class="table table-hover" id="table-cadastro-produto">
          <thead>
            <tr>
              <th scope="col">ID</th>
              <th scope="col">Nome</th>
              <th scope="col">CPF</th>
              <th scope="col">E-mail</th>
              <th scope="col">Telefone</th>
              <th scope="col">CEP</th>
              <th scope="col"></th>
            </tr>
          </thead>
          <tbody id="tb-lista">
            <c:forEach items="${clientes}" var="cliente">
              <tr>
                <td scope="row" style="white-space: nowrap;">${cliente.id}</td>
                <td style="white-space: nowrap;">${cliente.nome}</td>
                <td style="white-space: nowrap;">${cliente.cpf}</td>
                <td style="white-space: nowrap;">${cliente.email}</td>
                <td style="white-space: nowrap;">${cliente.telefone}</td>
                <td style="white-space: nowrap;">${cliente.cep}</td>
                <td style="white-space: nowrap;">
                  <a href="${pageContext.request.contextPath}/cliente/editar?idCliente=${cliente.id}" class="mr-2">
                    <svg class="icon bg-primary" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                      <title>Icon For Edit</title>
                      <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                        <rect opacity="0" x="0" y="0" width="24" height="24"></rect>
                        <path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "></path>
                        <rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"></rect>
                      </g>
                    </svg>
                  </a>
                  <a href="${pageContext.request.contextPath}/cliente/desativar?idCliente=${cliente.id}" onclick="return confirm('Tem certeza que deseja desativar este cliente?');" class="">
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

</section>

<script language=javascript>
function validaCPF() 
{
  erro = new String;
	if (cpf.value.length === 14)
	{	
			cpf.value = cpf.value.replace('.', '');
			cpf.value = cpf.value.replace('.', '');
			cpf.value = cpf.value.replace('-', '');
			var nonNumbers = /\D/;
			if (nonNumbers.test(cpf.value)) 
			{
					erro = "A verificacao de CPF suporta apenas números!"; 
			}
			else
			{
					if (cpf.value == "00000000000" || 
							cpf.value == "11111111111" || 
							cpf.value == "22222222222" || 
							cpf.value == "33333333333" || 
							cpf.value == "44444444444" || 
							cpf.value == "55555555555" || 
							cpf.value == "66666666666" || 
							cpf.value == "77777777777" || 
							cpf.value == "88888888888" || 
							cpf.value == "99999999999") {
							erro = "Número de CPF inválido!"
					}
					var a = [];
					var b = new Number;
					var c = 14;
					for (i=0; i<14; i++){
							a[i] = cpf.value.charAt(i);
							if (i < 10) b += (a[i] * --c);
					}
					if ((x = b % 14) < 2) { a[10] = 0 } else { a[10] = 14-x }
					b = 0;
					c = 14;
					for (y=0; y<13; y++) b += (a[y] * c--); 
					if ((x = b % 13) < 2) { a[13] = 0; } else { a[13] = 14-x; }
					if ((cpf.value.charAt(12) != a[12]) || (cpf.value.charAt(13) != a[13])) {
						erro = "Número de CPF inválido.";
					}
			}
	}
	else
	{
		if(cpf.value.length === 0)
			return false;
		else
			erro = "Número de CPF inválido.";
	}
	if (erro.length > 0) {
			alert(erro);
                        cpf.focus();
			cpf.value = "";
			return false;
                        
	}
	return true;	
}

function maskCPF(CPF) {
	var evt = window.event;
	kcode=evt.keyCode;
	if (kcode == 8) return;
	if (CPF.value.length == 3) { CPF.value = CPF.value + '.'; }
	if (CPF.value.length == 7) { CPF.value = CPF.value + '.'; }
	if (CPF.value.length == 11) { CPF.value = CPF.value + '-'; }
}
// evento onBlur
function formataCPF(cpf)
{
	with (cpf)
	{
		value = value.substr(0, 3) + '.' + 
				value.substr(3, 3) + '.' + 
				value.substr(6, 3) + '-' +
				value.substr(9, 2);
	}
}

function maskIt(w,e,m,r,a){

// Cancela se o evento for Backspace

if (!e) var e = window.event

if (e.keyCode) code = e.keyCode;

else if (e.which) code = e.which;



// Variáveis da função

var txt = (!r) ? w.value.replace(/[^\d]+/gi,'') : w.value.replace(/[^\d]+/gi,'').reverse();

var mask = (!r) ? m : m.reverse();

var pre = (a ) ? a.pre : "";

var pos = (a ) ? a.pos : "";

var ret = "";



if(code == 9 || code == 8 || txt.length == mask.replace(/[^#]+/g,'').length) return false;



// Loop na máscara para aplicar os caracteres

for(var x=0,y=0, z=mask.length;x<z && y<txt.length;){

if(mask.charAt(x)!='#'){

ret += mask.charAt(x); x++;

} else{

ret += txt.charAt(y); y++; x++;

}

}

// Retorno da função

ret = (!r) ? ret : ret.reverse()

w.value = pre+ret+pos;

}

// Novo método para o objeto 'String'

String.prototype.reverse = function(){

return this.split('').reverse().join('');

};
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-masker/1.1.0/vanilla-masker.min.js"></script>
<script type="text/javascript" src="jquery.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
<script>
  function inputHandler(masks, max, event) {
	var c = event.target;
	var v = c.value.replace(/\D/g, '');
	var m = c.value.length > max ? 1 : 0;
	VMasker(c).unMask();
	VMasker(c).maskPattern(masks[m]);
	c.value = VMasker.toPattern(v, masks[m]);
}

var telMask = ['(99) 9999-99999', '(99) 99999-9999'];
var tel = document.querySelector('input[attrname=telephone1]');
VMasker(tel).maskPattern(telMask[0]);
tel.addEventListener('input', inputHandler.bind(undefined, telMask, 14), false);

var docMask = ['999.999.999-99', '99.999.999/9999-99'];
var cpf = document.querySelector('#cpf');
VMasker(cpf).maskPattern(docMask[0]);
doc.addEventListener('input', inputHandler.bind(undefined, docMask, 14), false);
</script>

<!-- Não mudar ABAIXO -->

<jsp:include page="utilidades/rodape.jsp" />