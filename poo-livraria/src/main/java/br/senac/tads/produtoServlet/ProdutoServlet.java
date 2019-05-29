/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.produtoServlet;

import br.senac.tads.dao.CrudInterface;
import br.senac.tads.dao.ProdutoDAO;
import br.senac.tads.model.Produto;
import br.senac.tads.model.Usuario;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ProdutoServlet", urlPatterns = {"/produto"})
public class ProdutoServlet extends HttpServlet {

  private final CrudInterface produtoDAO = new ProdutoDAO();
  
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    Usuario u = new Usuario(request);
    
    if(!u.acessaProduto()) {
      response.sendRedirect(request.getContextPath() + "/");
      return;
    }
    
    ArrayList<ProdutoServlet> produtos = produtoDAO.listar(u.getIdFilial());
    
    request.setAttribute("produtos", produtos);
    request.getRequestDispatcher("/produto.jsp").forward(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request,  HttpServletResponse response) throws ServletException, IOException {

    Usuario u = new Usuario(request);
    
    if(!u.acessaProduto()) {
      response.sendRedirect(request.getContextPath() + "/");
      return;
    }
    
    Produto p = new Produto();
    
    p.setNomeProduto(request.getParameter("nomeProduto"));
    p.setAno(request.getParameter("ano"));
    p.setAutor(request.getParameter("autor"));
    p.setEditora(request.getParameter("editora"));
    p.setNumeroPagina(request.getParameter("numeroPagina"));
    p.setPrecoDiaria(Double.parseDouble(request.getParameter("precoDiaria")));
    p.setIdFilial(u.getIdFilial());

    boolean sucesso = produtoDAO.salvar(p);
    request.setAttribute("sucesso", sucesso);
    
    if (sucesso) {
      request.setAttribute("mensagem", "Produto cadastrado com sucesso!");
    } else {
      request.setAttribute("mensagem", "Não foi possível cadastrar o produto. Por favor, tente novamente!");
    }
    
    ArrayList<ProdutoServlet> produtos = produtoDAO.listar(u.getIdFilial());
    request.setAttribute("produtos", produtos);
    request.getRequestDispatcher("/produto.jsp").forward(request, response);
  }
}
