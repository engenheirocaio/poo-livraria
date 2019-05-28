/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.gerenprod.model;

import java.util.Date;

/**
 *
 * @author mac-ale
 */
public class Relatorio extends Object {
   private int idAluguel;
   private String nomeCliente;
   private String nomeProduto;
   private Date dataFinal;
   private double precoDiaria;
   private double valorTotal;

    public Date getDataFinal() {
        return dataFinal;
    }

    public void setDataFinal(Date dataFinal) {
        this.dataFinal = dataFinal;
    }
   
   
    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public Relatorio(){
    }
    
    public int getIdAluguel() {
        return idAluguel;
    }

    public void setIdAluguel(int idAluguel) {
        this.idAluguel = idAluguel;
    }

    public String getNomeCliente() {
        return nomeCliente;
    }

    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }

    public double getPrecoDiaria() {
        return precoDiaria;
    }

    public void setPrecoDiaria(double precoDiaria) {
        this.precoDiaria = precoDiaria;
    }

    public double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(double valorTotal) {
        this.valorTotal = valorTotal;
    }

  
 }
