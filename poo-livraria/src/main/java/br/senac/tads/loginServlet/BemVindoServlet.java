/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.loginServlet;

import br.senac.tads.model.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "BemVindoServlet", urlPatterns = {"/bemvindo"})
public class BemVindoServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    Usuario u = new Usuario(request);
    
    System.out.println("");
    System.out.println(u.getId() + " " + u.getNomeDepartamento());
    System.out.println("");
    
    if(u.getId() == 0) {
      response.sendRedirect(request.getContextPath() + "/");
      return;
    }
    
    request.getRequestDispatcher("/bemvindo.jsp").forward(request, response);
  }
}
