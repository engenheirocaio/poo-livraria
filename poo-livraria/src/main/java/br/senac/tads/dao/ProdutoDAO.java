/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.dao;

import br.senac.tads.db.DB;
import br.senac.tads.model.Produto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProdutoDAO implements CrudInterface<Produto> {

  @Override
  public ArrayList<Produto> listar(int idFilial) {
    DB db = new DB(true);
    try {
      String sql = "SELECT * FROM produto WHERE idFilial = " + idFilial + " AND Ativo = true;";
      ResultSet rs = db.executarConsulta(sql);
      ArrayList<Produto> produtos = new ArrayList<>();
      while (rs.next()) {
        Produto p = new Produto();
        p.setIdProduto(rs.getInt("idProduto"));
        p.setNomeProduto(rs.getString("NomeProduto"));
        p.setAno(rs.getString("Ano"));
        p.setAutor(rs.getString("Autor"));
        p.setEditora(rs.getString("Editora"));
        p.setNumeroPagina(rs.getString("NumeroPagina"));
        p.setPrecoDiaria(rs.getDouble("PrecoDiaria"));
        p.setAlugado(rs.getBoolean("Alugado"));
        p.setAtivo(rs.getBoolean("Ativo"));
        produtos.add(p);
      }
      db.close();
      return produtos;
    } catch (SQLException ex) {
      System.out.println(ex.getMessage());
      db.close();
      return null;
    }
  }
  
  public ArrayList<Produto> listarAlugando(int idFilial) {
    DB db = new DB(true);
    try {
      String sql = "SELECT * FROM produto WHERE idFilial = " + idFilial + " AND Alugado = true AND Ativo = true;";
      ResultSet rs = db.executarConsulta(sql);
      ArrayList<Produto> produtos = new ArrayList<>();
      while (rs.next()) {
        Produto p = new Produto();
        p.setIdProduto(rs.getInt("idProduto"));
        p.setNomeProduto(rs.getString("NomeProduto"));
        p.setAno(rs.getString("Ano"));
        p.setAutor(rs.getString("Autor"));
        p.setEditora(rs.getString("Editora"));
        p.setNumeroPagina(rs.getString("NumeroPagina"));
        p.setPrecoDiaria(rs.getDouble("PrecoDiaria"));
        p.setAlugado(rs.getBoolean("Alugado"));
        p.setAtivo(rs.getBoolean("Ativo"));
        produtos.add(p);
      }
      db.close();
      return produtos;
    } catch (SQLException ex) {
      System.out.println(ex.getMessage());
      db.close();
      return null;
    }
  }
  
  public ArrayList<Produto> listarNaoAlugado(int idFilial) {
    DB db = new DB(true);
    try {
      String sql = "SELECT * FROM produto WHERE idFilial = " + idFilial + " AND Alugado = false AND Ativo = true;";
      ResultSet rs = db.executarConsulta(sql);
      ArrayList<Produto> produtos = new ArrayList<>();
      while (rs.next()) {
        Produto p = new Produto();
        p.setIdProduto(rs.getInt("idProduto"));
        p.setNomeProduto(rs.getString("NomeProduto"));
        p.setAno(rs.getString("Ano"));
        p.setAutor(rs.getString("Autor"));
        p.setEditora(rs.getString("Editora"));
        p.setNumeroPagina(rs.getString("NumeroPagina"));
        p.setPrecoDiaria(rs.getDouble("PrecoDiaria"));
        p.setAlugado(rs.getBoolean("Alugado"));
        p.setAtivo(rs.getBoolean("Ativo"));
        produtos.add(p);
      }
      db.close();
      return produtos;
    } catch (SQLException ex) {
      System.out.println(ex.getMessage());
      db.close();
      return null;
    }
  }
  
  @Override
  public Produto mostrar(int idProduto) {
    DB db = new DB(true);
    try {
      String sql = "SELECT * FROM produto WHERE idProduto = " + idProduto + ";";
      ResultSet rs = db.executarConsulta(sql);
      Produto p = new Produto();
      while (rs.next()) {
        p.setIdProduto(rs.getInt("idProduto"));
        p.setNomeProduto(rs.getString("NomeProduto"));
        p.setAno(rs.getString("Ano"));
        p.setAutor(rs.getString("Autor"));
        p.setEditora(rs.getString("Editora"));
        p.setNumeroPagina(rs.getString("NumeroPagina"));
        p.setPrecoDiaria(rs.getDouble("PrecoDiaria"));
        p.setAlugado(rs.getBoolean("Alugado"));
        p.setAtivo(rs.getBoolean("Ativo"));
      }
      db.close();
      return p;
    } catch (SQLException ex) {
      System.out.println(ex.getMessage());
      db.close();
      return null;
    }
  }

  @Override
  public boolean editar(Produto p) {
    DB db = new DB(false);

    try {

      String sql
              = "UPDATE produto SET "
              + "NomeProduto = '" + p.getNomeProduto() + "', "
              + "Ano = '" + p.getAno() + "', "
              + "Autor = '" + p.getAutor() + "', "
              + "Editora = '" + p.getEditora()+ "', "
              + "NumeroPagina = '" + p.getNumeroPagina() + "', "
              + "PrecoDiaria = " + p.getPrecoDiaria() + " "
              + "Where idProduto = " + p.getIdProduto() + "; ";
      
      if (!db.executarAlteracao(sql)) {
        throw new Exception("Não foi possivel atualizar o produto.");
      }

      db.commit();
      db.close();
      return true;

    } catch (Exception e) {
      System.out.println(e.getMessage());
      db.rollback();
      db.close();
      return false;
    }
  }

  @Override
  public boolean salvar(Produto p) {
    DB db = new DB(false);

    try {

      String sql
              = "INSERT INTO produto "
              + "(NomeProduto, Ano, Autor, Editora, NumeroPagina, PrecoDiaria, Alugado, idFilial, Ativo)"
              + "VALUES ("
              + "'" + p.getNomeProduto() + "', "
              + "'" + p.getAno() + "', "
              + "'" + p.getAutor() + "', "
              + "'" + p.getEditora() + "', "
              + "'" + p.getNumeroPagina() + "', "
              + p.getPrecoDiaria() + ", "
              + "false, "
              + p.getIdFilial() + ", "
              + "true );";

      if (!db.executarAlteracao(sql)) {
        throw new Exception("Não foi possível cadastrar o produto.");
      }

      db.commit();
      db.close();
      return true;

    } catch (Exception e) {
      System.out.println(e.getMessage());
      db.rollback();
      db.close();
      return false;
    }
  }

  @Override
  public boolean desativar(int produtoID) {
    DB db = new DB(false);

    try {

      String sql
              = "UPDATE produto SET "
              + "Ativo = false "
              + "Where idProduto = " + produtoID + "; ";

      if (!db.executarAlteracao(sql)) {
        throw new Exception("Não foi possível desativar o produto.");
      }

      db.commit();
      db.close();
      return true;

    } catch (Exception e) {
      System.out.println(e.getMessage());
      db.rollback();
      db.close();
      return false;
    }
  }


}
