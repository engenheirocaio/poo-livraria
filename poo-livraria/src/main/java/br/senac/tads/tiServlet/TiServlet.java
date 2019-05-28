/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.tiServlet;

import br.senac.tads.dao.CrudInterface;
import br.senac.tads.dao.DepartamentoDAO;
import br.senac.tads.dao.TiDAO;
import br.senac.tads.dao.AdministracaoDAO;
import br.senac.tads.model.Departamento;
import br.senac.tads.model.Ti;
import br.senac.tads.model.Usuario;
import br.senac.tads.model.Administracao;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Bruna
 */
@WebServlet(name = "TiServlet", urlPatterns = {"/ti"})
public class TiServlet extends HttpServlet {
  
private final CrudInterface tiDAO = new TiDAO();
private final CrudInterface departamentoDAO = new DepartamentoDAO();
private final CrudInterface filialDAO = new AdministracaoDAO();
  
@Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    Usuario u = new Usuario(request);
    
    if(!u.acessaTi()) {
      response.sendRedirect(request.getContextPath() + "/");
      return;
    }
    
    ArrayList<Departamento> departamentos = departamentoDAO.listar(u.getIdFilial());
    ArrayList<Ti> tis = tiDAO.listar(u.getIdFilial());
    ArrayList<Administracao> filiais = filialDAO.listar(0);
 
    request.setAttribute("tis", tis); 
    request.setAttribute("departamentos", departamentos); 
    request.setAttribute("filiais", filiais);
    request.getRequestDispatcher("/ti.jsp").forward(request, response);
  }
  
@Override
  protected void doPost(HttpServletRequest request,  HttpServletResponse response) throws ServletException, IOException {
      
    Usuario u = new Usuario(request);
    
    if(!u.acessaTi()) {
      response.sendRedirect(request.getContextPath() + "/");
      return;
    }
    
    Ti t = new Ti();
    
    t.setNomeUsuario(request.getParameter("nomeUsuario"));
    t.setEmail(request.getParameter("email"));
    t.setSenha(request.getParameter("senha"));
    t.criptografarSenha();
    t.setIdDepartamento(Integer.parseInt(request.getParameter("idDepartamento")));
    t.setIdFilial(Integer.parseInt(request.getParameter("idFilial")));
    
    boolean sucesso = tiDAO.salvar(t);
    request.setAttribute("sucesso", sucesso);
    
    if (sucesso) {
      request.setAttribute("mensagem", "Usuário cadastrado com sucesso!");
    } else {
      request.setAttribute("mensagem", "Não foi possível cadastrar o Usuario. Por favor, tente novamente!");
    }
    
    ArrayList<Departamento> departamentos = departamentoDAO.listar(u.getIdFilial());
    ArrayList<Ti> tis = tiDAO.listar(u.getIdFilial());
    ArrayList<Administracao> filiais = filialDAO.listar(0);
 
    request.setAttribute("tis", tis); 
    request.setAttribute("departamentos", departamentos);
    request.setAttribute("filiais", filiais);
    request.getRequestDispatcher("/ti.jsp").forward(request, response);
  }
}