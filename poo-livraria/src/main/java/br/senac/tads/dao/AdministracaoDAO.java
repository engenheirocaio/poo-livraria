/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.dao;

import br.senac.tads.db.DB;
import br.senac.tads.model.Administracao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;


public class AdministracaoDAO implements CrudInterface<Administracao>  {

    @Override
    public ArrayList<Administracao> listar(int idFilial) {
    DB db = new DB(true);
    try {
      String sql = "SELECT * FROM filial WHERE Ativo = true;";
      ResultSet rs = db.executarConsulta(sql);
      ArrayList<Administracao> administracao = new ArrayList<>();
      while (rs.next()) {
        Administracao p = new Administracao();
        p.setIdFilial(rs.getInt("idFilial"));
        p.setNomeFilial(rs.getString("nomeFilial"));
        p.setCnpj(rs.getString("CNPJ"));
        p.setEstado(rs.getString("Estado"));
        p.setCidade(rs.getString("Cidade"));
        p.setCep(rs.getString("CEP"));
        p.setAtivo(rs.getBoolean("Ativo"));
        administracao.add(p);
      }
      db.close();
      return administracao;
    } catch (SQLException ex) {
      System.out.println(ex.getMessage());
      db.close();
      return null;
    }
    }

    @Override
    public Administracao mostrar(int idFilial) {
         DB db = new DB(true);
    try {
      String sql = "SELECT * FROM filial WHERE idFilial = " + idFilial + ";";
      ResultSet rs = db.executarConsulta(sql);
      Administracao p = new Administracao();
      while (rs.next()) {
        p.setIdFilial(rs.getInt("idFilial"));
        p.setNomeFilial(rs.getString("nomeFilial"));
        p.setCnpj(rs.getString("CNPJ"));
        p.setEstado(rs.getString("Estado"));
        p.setCidade(rs.getString("Cidade"));
        p.setCep(rs.getString("CEP"));
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
    public boolean editar(Administracao p) {
        DB db = new DB(false);

    try {

      String sql
              = "UPDATE filial SET "
              + "NomeFilial = '" + p.getNomeFilial() + "', "
              + "CNPJ = '" + p.getCnpj() + "', "
              + "Estado = '" + p.getEstado() + "', "
              + "Cidade = '" + p.getCidade()+ "', "
              + "CEP = '" + p.getCep() + "' "
              + "Where idFilial = " + p.getIdFilial() + "; ";
              
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
    public boolean salvar(Administracao p) {
        DB db = new DB(false);

    try {

      String sql
              = "INSERT INTO filial "
              + "(NomeFilial, CNPJ, Estado, Cidade, CEP, Ativo)"
              + "VALUES ("
              + "'" + p.getNomeFilial() + "', "
              + "'" + p.getCnpj() + "', "
              + "'" + p.getEstado() + "', "
              + "'" + p.getCidade() + "', "
              + "'" + p.getCep() + "', "
              + "true );";

      if (!db.executarAlteracao(sql)) {
        throw new Exception("Não foi possivel cadastrar o produto.");
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
    public boolean desativar(int filialID) {
        DB db = new DB(false);

    try {

      String sql
              = "UPDATE filial SET "
              + "Ativo = false "
              + "Where idFilial = " + filialID + "; ";

      if (!db.executarAlteracao(sql)) {
        throw new Exception("Não foi possivel desativar o produto.");
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
    

