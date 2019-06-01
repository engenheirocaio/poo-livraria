/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.model;


public class Cliente extends Pessoa{

  //private int id;
  private String cpf, cnh, telefone, cep, rua, bairro, cidade, estado;
  
  
  public Cliente(String cpf, String telefone, String cep, String rua, String bairro, String cidade, String estado) {

    this.cpf = cpf;
    this.telefone = telefone;
    this.cep = cep;
    this.rua = rua;
    this.bairro = bairro;
    this.cidade = cidade;
    this.estado = estado;
  }

  public Cliente() {
    
    this.cpf = "";
    this.telefone = "";
    this.cep = "";
    this.rua = "";
    this.bairro = "";
    this.cidade = "";
    this.estado = "";
    
  }


  public String getCpf() {
    return cpf;
  }

  public void setCpf(String cpf) {
    this.cpf = cpf;
  }


  public String getTelefone() {
    return telefone;
  }

  public void setTelefone(String telefone) {
    this.telefone = telefone;
  }

  public String getCep() {
    return cep;
  }

  public void setCep(String cep) {
    this.cep = cep;
  }

  public String getRua() {
    return rua;
  }

  public void setRua(String rua) {
    this.rua = rua;
  }

  public String getBairro() {
    return bairro;
  }

  public void setBairro(String bairro) {
    this.bairro = bairro;
  }

  public String getCidade() {
    return cidade;
  }

  public void setCidade(String cidade) {
    this.cidade = cidade;
  }

  public String getEstado() {
    return estado;
  }

  public void setEstado(String estado) {
    this.estado = estado;
  }

}
