/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.aluguelServlet;

import br.senac.tads.dao.ProdutoDAO;
import br.senac.tads.dao.ClienteDAO;
import br.senac.tads.model.Cliente;
import br.senac.tads.model.Produto;
import br.senac.tads.model.Usuario;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "AluguelServlet", urlPatterns = {"/aluguel"})
public class AluguelServlet extends HttpServlet {

  private final ProdutoDAO produtoDAO = new ProdutoDAO();
  private final ClienteDAO clienteDAO = new ClienteDAO();

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    Usuario u = new Usuario(request);

    if (!u.acessaAluguel()) {
      response.sendRedirect(request.getContextPath() + "/");
      return;
    }

    SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
    String hoje = formato.format(new Date());
    request.setAttribute("hoje", hoje);
    
    ArrayList<Produto> produtos = produtoDAO.listarNaoAlugado(u.getIdFilial());
    request.setAttribute("produtos", produtos);
    ArrayList<Cliente> clientes = clienteDAO.listarNaoAlugando(u.getIdFilial());
    request.setAttribute("clientes", clientes);

    request.getRequestDispatcher("/aluguel.jsp").forward(request, response);
  }
}
