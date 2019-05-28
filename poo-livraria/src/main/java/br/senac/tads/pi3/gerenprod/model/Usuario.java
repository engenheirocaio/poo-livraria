/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.gerenprod.model;

import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Bruna
 */
public final class Usuario {
  
  private static String D = "Diretoria";
  private static String GGR = "Gerencia global retaguarda";
  private static String GRR = "Gerencia regional retaguarda";
  private static String FM = "Funcionário matriz";
  private static String FRR = "Funcionário regional retaguarda";
  private static String GGV = "Gerencia global vendas";
  private static String GRV = "Gerencia regional vendas";
  private static String VR = "Vendedor regional";
  private static String GGT = "Gerencia global ti";
  private static String GRT = "Gerencia regional ti";
  private static String EST = "Equipe de suporte técnico";
  private static String GGA = "Gerencia global adm";
  private static String FA = "Funcionário adm";
  
    // Acesso as páginas
  private boolean acessaProduto = false;
  private boolean acessaCliente = false;
  private boolean acessaAluguel = false;
  private boolean acessaDevolucao = false;
  private boolean acessaRelatorio = false;
  private boolean acessaTi = false;
  private boolean acessaAdministracao = false;
  private boolean isGlobal = false;
  
  private int idUsuario, idDepartamento, idFilial;
  private String nome, email, senha, nomeFilial, nomeDepartamento;
  private boolean ativo;

  public Usuario() {
    iniciaVazio();
  }
  
  private void iniciaVazio() {
    this.idUsuario = 0;
    this.idDepartamento = 0;
    this.idFilial = 0;
    this.nome = "";
    this.email = "";
    this.senha = "";
    this.ativo = true;
    this.nomeFilial = "";
    this.nomeDepartamento = "";
  }
 
  public Usuario(int idUsuario, int idDepartamento, int idFilial, String nome, String email, String senha, boolean ativo, String nomeFilial, String nomeDepartamento) {
    this.idUsuario = idUsuario;
    this.idDepartamento = idDepartamento;
    this.idFilial = idFilial;
    this.nome = nome;
    this.email = email;
    this.senha = senha;
    this.ativo = ativo;
    this.nomeFilial = nomeFilial;
    this.nomeDepartamento = nomeDepartamento;
    
    validaAcessos();
  }

  public Usuario(HttpServletRequest request) {
    this.getSession(request);
  }
  
  public void setSession(HttpServletRequest request) {
    
    HttpSession sessao = request.getSession();
    
    sessao.setAttribute("usuario.idUsuario", this.idUsuario);
    sessao.setAttribute("usuario.idDepartamento", this.idDepartamento);
    sessao.setAttribute("usuario.idFilial", this.idFilial);
    sessao.setAttribute("usuario.nome", this.nome);
    sessao.setAttribute("usuario.email", this.email);
    sessao.setAttribute("usuario.senha", this.senha);
    sessao.setAttribute("usuario.ativo", this.ativo);
    sessao.setAttribute("usuario.nomeFilial", this.nomeFilial);
    sessao.setAttribute("usuario.nomeDepartamento", this.nomeDepartamento);
  }
  
  public void getSession(HttpServletRequest request) {
    
    HttpSession sessao = request.getSession();
    
    if (sessao.getAttribute("usuario.idUsuario") == "" || sessao.getAttribute("usuario.idUsuario") == null) {
      return;
    }
    
    this.idUsuario = (int) sessao.getAttribute("usuario.idUsuario");
    this.idDepartamento = (int) sessao.getAttribute("usuario.idDepartamento");
    this.idFilial = (int) sessao.getAttribute("usuario.idFilial");
    this.nome = (String) sessao.getAttribute("usuario.nome");
    this.email = (String) sessao.getAttribute("usuario.email");
    this.senha = (String) sessao.getAttribute("usuario.senha");
    this.ativo = (boolean) sessao.getAttribute("usuario.ativo");
    this.nomeFilial = (String) sessao.getAttribute("usuario.nomeFilial");
    this.nomeDepartamento = (String) sessao.getAttribute("usuario.nomeDepartamento");
    
    validaAcessos();
    
    request.setAttribute("usuarioSessao", this);
  }
  
  private void validaAcessos() {

    if (Arrays.asList(D, GGR, GGV, GGT, GGA).contains(this.nomeDepartamento)) {
      isGlobal = true;
    }
    
    if (Arrays.asList(D, GGR, GRR, FM, FRR).contains(this.nomeDepartamento)) {
      acessaProduto = true;
    }
    
    if (Arrays.asList(D, GGV, GRV, VR).contains(this.nomeDepartamento)) {
      acessaCliente = true;
      acessaAluguel = true;
      acessaDevolucao = true;
    }
    
    if (Arrays.asList(D, GGR, GRR, FM, GGV, GRV, GGT, GRT, GGA, FA).contains(this.nomeDepartamento)) {
      acessaRelatorio = true;
    }
    
    if (Arrays.asList(D, GGT, GRT, EST).contains(this.nomeDepartamento)) {
      acessaTi = true;
    }
    
    if (Arrays.asList(D, GGA, FA).contains(this.nomeDepartamento)) {
      acessaAdministracao = true;
    }
  }
  
  public void criptografarSenha() {
    this.senha = BCrypt.hashpw(this.senha, BCrypt.gensalt());
  }
  
  public int getIdUsuario() {
    return idUsuario;
  }

  public void setIdUsuario(int idUsuario) {
    this.idUsuario = idUsuario;
  }

  public int getIdDepartamento() {
    return idDepartamento;
  }

  public void setIdDepartamento(int idDepartamento) {
    this.idDepartamento = idDepartamento;
  }

  public int getIdFilial() {
    return idFilial;
  }

  public void setIdFilial(int idFilial) {
    this.idFilial = idFilial;
  }

  public String getNome() {
    return nome;
  }

  public void setNome(String nome) {
    this.nome = nome;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getSenha() {
    return senha;
  }

  public void setSenha(String senha) {
    this.senha = senha;
  }

  public boolean isAtivo() {
    return ativo;
  }

  public void setAtivo(boolean ativo) {
    this.ativo = ativo;
  }
  
  public String getNomeFilial() {
    return nomeFilial;
  }

  public void setNomeFilial(String nomeFilial) {
    this.nomeFilial = nomeFilial;
  }

  public String getNomeDepartamento() {
    return nomeDepartamento;
  }

  public void setNomeDepartamento(String nomeDepartamento) {
    this.nomeDepartamento = nomeDepartamento;
  }
  
  public boolean acessaProduto() {
    return acessaProduto;
  }

  public boolean acessaCliente() {
    return acessaCliente;
  }

  public boolean acessaAluguel() {
    return acessaAluguel;
  }

  public boolean acessaDevolucao() {
    return acessaDevolucao;
  }

  public boolean acessaRelatorio() {
    return acessaRelatorio;
  }

  public boolean acessaTi() {
    return acessaTi;
  }

  public boolean acessaAdministracao() {
    return acessaAdministracao;
  }
  
  public boolean isGlobal() {
    return isGlobal;
  }
}