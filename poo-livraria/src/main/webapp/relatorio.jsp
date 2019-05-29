<%@page contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="utilidades/cabecalho.jsp">
    <jsp:param name="paginaAtual" value="${'relatorio'}"/>
    <jsp:param name="usuarioSessao" value="${usuarioSessao}"/>
</jsp:include>

<!-- Não mudar ACIMA -->

<section>
    <div class="container">
        <h1 class="text-center">Relatório semanal</h1>
        <div class="row justify-content-center">
            <div class="col-10">
                <canvas id="myChart"></canvas>
            </div>
        </div>
    </div>
</section>

<section class="bg-primary-alt">
    <div class="container">
        <form action="${registerUrl}" method="post">
            <div class="row">
                <div class="form-group col-4"> <!-- Date input -->
                    <div class="form-group">
                        <label for="text">Data Inicial</label>
                        <input type="date" class="form-control" id="StartTime" name="StartTime" value=""  placeholder="yyyy/mm/dd" >
                    </div>
                </div>
                <div class="form-group col-4"> <!-- Date input -->
                    <label class="control-label" for="filtroFinal">Data Final</label>
                    <input class="form-control" id="EndTime" name="EndTime" value="" placeholder="yyyy/mm/dd" type="date">
                </div>
                <c:if test="${isGlobal == true}">
                    <div class="form-group col-4">
                        <label class="control-label" for="idFilial">Filial</label>
                        <select class="form-control" name="idFilial" class="custom-select" selected>
                            <option value="0">Todos</option> 
                            <c:forEach items="${filiais}" var="filial">
                                <option value="${filial.idFilial}">${filial.nomeFilial}</option> 
                            </c:forEach>
                        </select>
                    </div>
                </c:if>
                <div class="form-group col-4">
                    <button class="btn-block btn btn-primary" type="submit" style="margin-top: 10%; width: 100px; 
                            padding-left: 24px; padding-top: 5px; padding-bottom: 5px; ">Filtrar</button>
                </div>
            </div>
        </form>
        <!-- Tabela de produtos -->
        <div class="row justify-content-center">
            <div class="col">
                <table class="table table-hover" id="table-cadastro-produto">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Cliente</th>
                            <th scope="col">Carro</th>
                            <th scope="col">Valor diária</th>
                            <th scope="col">Data Devolução</th>
                            <th scope="col">Valor total</th>
                        </tr>
                    </thead>
                    <tbody id="tb-lista">
                        <c:forEach items="${relatorios}" var="relatorio">
                            <tr>
                                <th scope="row">${relatorio.idAluguel}</th>
                                <td>${relatorio.nomeCliente}</td>
                                <td>${relatorio.nomeProduto}</td>
                                <td>${relatorio.precoDiaria}</td>
                                <td name="dataFinal">${relatorio.dataFinal}</td>
                                <td name="valorTotal">${relatorio.valorTotal}</td>
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