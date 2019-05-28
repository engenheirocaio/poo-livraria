/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.model;

import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Bruna
 */
public class Ti extends Object {
  
  private int idUsuario, idFilial, idDepartamento;
  private String nomeUsuario, email, senha, nomeDepartamento, nomeFilial;
  private boolean ativo;

  public Ti() {
    this.idUsuario = 0;
    this.idFilial = 0;
    this.idDepartamento = 0;
    this.nomeUsuario = "";
    this.email = "";
    this.senha = "";
    this.ativo = true;
  }

  public Ti(int idUsuario, int idFilial, int idDepartamento, String nomeUsuario, String email, String senha, String nomeDepartamento, boolean ativo) {
    this.idUsuario = idUsuario;
    this.idFilial = idFilial;
    this.idDepartamento = idDepartamento;
    this.nomeUsuario = nomeUsuario;
    this.email = email;
    this.senha = senha;
    this.nomeDepartamento = nomeDepartamento;
    this.ativo = ativo;
  }

  public void criptografarSenha() {
    this.senha = BCrypt.hashpw(this.senha, BCrypt.gensalt());
  }
  
  public void setIdUsuario(int idUsuario) {
    this.idUsuario = idUsuario;
  }

  public void setIdFilial(int idFilial) {
    this.idFilial = idFilial;
  }

  public void setIdDepartamento(int idDepartamento) {
    this.idDepartamento = idDepartamento;
  }

  public void setNomeUsuario(String nomeUsuario) {
    this.nomeUsuario = nomeUsuario;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public void setSenha(String senha) {
    this.senha = senha;
  }

  public void setAtivo(boolean ativo) {
    this.ativo = ativo;
  }

  public int getIdUsuario() {
    return idUsuario;
  }

  public int getIdFilial() {
    return idFilial;
  }

  public int getIdDepartamento() {
    return idDepartamento;
  }

  public String getNomeUsuario() {
    return nomeUsuario;
  }

  public String getEmail() {
    return email;
  }

  public String getSenha() {
    return senha;
  }

  public boolean isAtivo() {
    return ativo;
  } 

  public String getNomeDepartamento() {
    return nomeDepartamento;
  }

  public void setNomeDepartamento(String nomeDepartamento) {
    this.nomeDepartamento = nomeDepartamento;
  }

  public String getNomeFilial() {
    return nomeFilial;
  }

  public void setNomeFilial(String nomeFilial) {
    this.nomeFilial = nomeFilial;
  }
}
