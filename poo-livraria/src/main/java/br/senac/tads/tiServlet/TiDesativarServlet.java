/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.tiServlet;

import br.senac.tads.dao.AdministracaoDAO;
import br.senac.tads.dao.CrudInterface;
import br.senac.tads.dao.DepartamentoDAO;
import br.senac.tads.dao.UsuarioDAO;
import br.senac.tads.model.Administracao;
import br.senac.tads.model.Departamento;
import br.senac.tads.model.Usuario;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet(name = "TiDesativarServlet", urlPatterns = {"/ti/desativar"})
public class TiDesativarServlet extends HttpServlet {

  private final CrudInterface UsuarioDAO = new UsuarioDAO();
  private final CrudInterface departamentoDAO = new DepartamentoDAO();
  private final CrudInterface filialDAO = new AdministracaoDAO();
 
 @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    Usuario u = new Usuario(request);
    
    if(!u.acessaTi()) {
      response.sendRedirect(request.getContextPath() + "/");
      return;
    }
    
    String id = request.getParameter("idUsuario");
    
    Usuario t = new Usuario();
    
    if (id != null) {
      int idUsuario = Integer.parseInt(id);
      
      boolean sucesso = UsuarioDAO.desativar(idUsuario);
      request.setAttribute("sucesso", sucesso);

      if (sucesso) {
        request.setAttribute("mensagem", "Usuário desativado com sucesso!");
      } else {
        request.setAttribute("mensagem", "Não foi possível desativar o usuário. Por favor, tente novamente!");
      }
    } else {
      request.setAttribute("sucesso", false);
      request.setAttribute("mensagem", "Não foi possível desativar o usuário. Por favor, tente novamente!");
    }
    
    ArrayList<Departamento> departamentos = departamentoDAO.listar(t.getIdFilial());
    ArrayList<Usuario> usuarios = UsuarioDAO.listar(t.getIdFilial());
    ArrayList<Administracao> filiais = filialDAO.listar(0);
 
    request.setAttribute("tis", usuarios); 
    request.setAttribute("departamentos", departamentos);
    request.setAttribute("filiais", filiais);
    request.getRequestDispatcher("/ti.jsp").forward(request, response);
  }
  

}
