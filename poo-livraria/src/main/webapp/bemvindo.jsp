<%@page contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="utilidades/cabecalho.jsp">
  <jsp:param name="usuarioSessao" value="${usuarioSessao}"/>
</jsp:include>

<!-- Não mudar ACIMA -->

<section class="">
  <div class="container">
    <div class="text-center">
      <h1 class="display-1">Bem vindo!</h1>
      <h1 class="text-muted">Selecione um dos menus acima para iniciar.</h1>
    </div>
  </div>
</section>

<section class="bg-primary-alt">
  <div class="container">
    <div class="row">
      <div class="col">
        <h2 class="text-center mb-5">Créditos</h2>
        <div class="row">
          <div class="col-md-6 col-lg-4 d-flex">
            <div class="card card-body shadow-3d">
              <h4>Alexandre Vinicius Ferreira da Silva</h4>
              <p>22 anos, atualmente cursa faculdade de análise e desenvolvimento de sistemas, trabalha como estagiário na Startup de desenvolvimento de software e marketing digital, Seven7Link.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 d-flex">
            <div class="card card-body shadow-3d">
              <h4>Bruna Duarte Pereira Santos</h4>
              <p>25 anos, pós graduada em enfermagem em inctologia. Atualmente trabalha como quality assurance na empresa Green Yellow garantindo a qualidade e a realização de testes focado no processo de desenvolvimento de software. </p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 d-flex">
            <div class="card card-body shadow-3d">
              <h4>Caio Celso Lopes de Araújo</h4>
              <p>32 anos, formado em engenharia de produção, atualmente trabalha com desenvolvimento C# para empresa Nepos.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 d-flex">
            <div class="card card-body shadow-3d">
              <h4>Felippe Gustavo de Souza e Silva</h4>
              <p>29 anos, atualmente trabalha como desenvolvedor Java junior na empresa BRQ atendendo ao Bradesco em desenvolvimento de melhorias e soluções otimizando e atualizando os sistemas do banco.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 d-flex">
            <div class="card card-body shadow-3d">
              <h4>Gustavo Pereira dos Santos</h4>
              <p>19 anos, cursando tecnologia em análise e desenvolvimento de sistemas na universidade SENAC, atualmente trabalha na empresa JBS como estagiário de desenvolvimento de softwares.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Não mudar ABAIXO -->

<jsp:include page="utilidades/rodape.jsp" />