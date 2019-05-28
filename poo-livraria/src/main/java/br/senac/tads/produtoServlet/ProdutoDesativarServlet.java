/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.produtoServlet;

import br.senac.tads.dao.CrudInterface;
import br.senac.tads.dao.ProdutoDAO;
import br.senac.tads.model.Usuario;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ProdutoDesativarServlet", urlPatterns = {"/produto/desativar"})
public class ProdutoDesativarServlet extends HttpServlet {

    private final CrudInterface produtoDAO = new ProdutoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Usuario u = new Usuario(request);

        if (!u.acessaProduto()) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        String id = request.getParameter("idProduto");

        if (id != null) {
            int idProduto = Integer.parseInt(id);

            boolean sucesso = produtoDAO.desativar(idProduto);
            request.setAttribute("sucesso", sucesso);

            if (sucesso) {
                request.setAttribute("mensagem", "Produto desativado com sucesso!");
            } else {
                request.setAttribute("sucesso", false);
                request.setAttribute("mensagem", "Não foi possível desativar o produto. Por favor, tente novamente!");
            }

        }

        ArrayList<ProdutoServlet> produtos = produtoDAO.listar(u.getIdFilial());

        request.setAttribute("produtos", produtos);
        request.getRequestDispatcher("/produto.jsp").forward(request, response);
    }
}
