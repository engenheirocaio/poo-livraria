/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.model;

/**
 *
 * @author caio.araujo
 */
public class Pessoa {
    public int id;
    public String nome;
    public String email;
    public boolean ativo;

    
    
    public Pessoa(int id, String nome, String email, boolean ativo) {
    this.id = id;
    this.nome = nome;
    this.email = email;
    this.ativo = ativo;
  }
    
     public Pessoa() {
     this.id = 0;
     this.nome = "";
     this.email = "";
     this.ativo = true;
  }
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the ativo
     */
    public boolean isAtivo() {
        return ativo;
    }

    /**
     * @param ativo the ativo to set
     */
    public void setAtivo(boolean ativo) {
        this.ativo = ativo;
    }
}

