/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.relatorioServlet;

import br.senac.tads.dao.AdministracaoDAO;
import br.senac.tads.dao.Auxiliar;
import br.senac.tads.dao.CrudInterface;
import br.senac.tads.dao.RelatorioDAO;
import br.senac.tads.model.Administracao;
import br.senac.tads.model.Relatorio;
import br.senac.tads.model.Usuario;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "RelatorioServlet", urlPatterns = {"/relatorio"})
public class RelatorioServlet extends HttpServlet {

    private final CrudInterface RelatorioDAO = new RelatorioDAO();
    private final CrudInterface filialDAO = new AdministracaoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Usuario u = new Usuario(request);

        if (!u.acessaRelatorio()) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        
        if(u.isGlobal()) {
          request.setAttribute("isGlobal", true);
        } else {
          request.setAttribute("isGlobal", false);
        }
        
        ArrayList<Relatorio> relatorios = RelatorioDAO.listar(u.getIdFilial());
        ArrayList<Administracao> filiais = filialDAO.listar(0);

        request.setAttribute("relatorios", relatorios);
        request.setAttribute("filiais", filiais);
        request.getRequestDispatcher("/relatorio.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Usuario u = new Usuario(request);

        if (!u.acessaRelatorio()) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        try {
            Date StartTime = Auxiliar.InputDateToUtilDate(request.getParameter("StartTime"));
            Date EndTime = Auxiliar.InputDateToUtilDate(request.getParameter("EndTime"));

            int idFilial = u.getIdFilial();
            
            if(u.isGlobal()) {
              request.setAttribute("isGlobal", true);
              idFilial = Integer.parseInt(request.getParameter("idFilial"));
            } else {
              request.setAttribute("isGlobal", false);
            }
            
            ArrayList<Relatorio> relatorios = RelatorioDAO.getAluguelByDates(StartTime, EndTime, idFilial);
            request.setAttribute("relatorios", relatorios);

            ArrayList<Administracao> filiais = filialDAO.listar(0);
            request.setAttribute("filiais", filiais);
            request.getRequestDispatcher("/relatorio.jsp").forward(request, response);

        } catch (ParseException ex) {
            Logger.getLogger(RelatorioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
