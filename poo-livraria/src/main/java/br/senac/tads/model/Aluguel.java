/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.model;

import java.util.Date;

/**
 *
 * @author Gustavo
 */
public class Aluguel {

    private int idAluguel, idProduto, idCliente, idFilial;
    private Date dataInicial, dataFinal;
    private double precoTotal;
    private Produto produto;
    private Cliente cliente;

    public Aluguel(int idAluguel, int idProduto, int idCliente, int idFilial, Date dataInicial, Date dataFinal, Double precoTotal) {
        this.idAluguel = idAluguel;
        this.idProduto = idProduto;
        this.idCliente = idCliente;
        this.idFilial = idFilial;
        this.dataInicial = dataInicial;
        this.dataFinal = dataFinal;
        this.precoTotal = precoTotal;
    }

    public Aluguel() {
        this.idAluguel = 0;
        this.idProduto = 0;
        this.idCliente = 0;
        this.idFilial = 0;
        this.dataInicial = new Date();
        this.dataFinal = new Date();
        this.precoTotal = 0;
    }

    public int getIdAluguel() {
        return idAluguel;
    }

    public void setIdAluguel(int idAluguel) {
        this.idAluguel = idAluguel;
    }

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdFilial() {
        return idFilial;
    }

    public void setIdFilial(int idFilial) {
        this.idFilial = idFilial;
    }

    public Date getDataInicial() {
        return dataInicial;
    }

    public void setDataInicial(Date dataInicial) {
        this.dataInicial = dataInicial;
    }

    public Date getDataFinal() {
        return dataFinal;
    }

    public void setDataFinal(Date dataFinal) {
        this.dataFinal = dataFinal;
    }
    
    public double getPrecoTotal() {
        return precoTotal;
    }

    public void setPrecoTotal(double precoTotal) {
        this.precoTotal = precoTotal;
    }
    
    public Produto getProduto() {
      return produto;
    }

    public void setProduto(Produto produto) {
      this.produto = produto;
    }

    public Cliente getCliente() {
      return cliente;
    }

    public void setCliente(Cliente cliente) {
      this.cliente = cliente;
    }
}
