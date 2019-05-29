package br.senac.tads.model;

public class Produto extends Object {
    
    private int idProduto, idFilial;
    private String nomeProduto, ano, autor, editora, numeroPagina;
    private double precoDiaria;
    private boolean alugado, ativo;

    public Produto() {
        this.idProduto = 0;
        this.idFilial = 0;
        this.nomeProduto = "";
        this.ano = "";
        this.autor = "";
        this.editora = "";
        this.numeroPagina = "";
        this.precoDiaria = 0;
        this.alugado = false;
        this.ativo = true;
    }
    
    public Produto(int idProduto, int idFilial, String nomeProduto, String ano, String autor, String editora, String numeroPagina, double precoDiaria, boolean alugado, boolean ativo) {
        this.idProduto = idProduto;
        this.idFilial = idFilial;
        this.nomeProduto = nomeProduto;
        this.ano = ano;
        this.autor = autor;
        this.editora = editora;
        this.numeroPagina = numeroPagina;
        this.precoDiaria = precoDiaria;
        this.alugado = alugado;
        this.ativo = ativo;
    }

    public int getIdProduto() {
        return idProduto;
    }
    
     public int getIdFilial() {
        return idFilial;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }
    
     public void setIdFilial(int idFilial) {
        this.idFilial = idFilial;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getEditora() {
        return editora;
    }

    public void setEditora(String editora) {
        this.editora = editora;
    }

    public String getNumeroPagina() {
        return numeroPagina;
    }

    public void setNumeroPagina(String numeroPagina) {
        this.numeroPagina = numeroPagina;
    }

    public double getPrecoDiaria() {
        return precoDiaria;
    }

    public void setPrecoDiaria(double precoDiaria) {
        this.precoDiaria = precoDiaria;
    }

    public boolean isAlugado() {
        return alugado;
    }

    public void setAlugado(boolean alugado) {
        this.alugado = alugado;
    }

    public boolean isAtivo() {
        return ativo;
    }

    public void setAtivo(boolean ativo) {
        this.ativo = ativo;
    }  
    
}
