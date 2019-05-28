/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.dao;
import br.senac.tads.db.DB;
import br.senac.tads.model.Ti;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;


public class TiDAO implements CrudInterface<Ti> {

  @Override
  public ArrayList<Ti> listar(int idFilial) {
    DB db = new DB(true);
    try {
      String sql = "SELECT * FROM usuario "
              + "INNER JOIN departamento ON usuario.idDepartamento = departamento.idDepartamento "
              + "INNER JOIN filial ON filial.idFilial = usuario.idFilial "
              + "WHERE usuario.Ativo = true;";
      ResultSet rs = db.executarConsulta(sql);
      ArrayList<Ti> tis = new ArrayList<>();
      while (rs.next()) {
        Ti t = new Ti();
        t.setIdUsuario(rs.getInt("idUsuario"));
        t.setNomeUsuario(rs.getString("NomeUsuario"));
        t.setEmail(rs.getString("Email"));
        t.setSenha(rs.getString("Senha")); 
        t.setNomeDepartamento(rs.getString("NomeDepartamento")); 
        t.setIdDepartamento(rs.getInt("idDepartamento"));
        t.setNomeFilial(rs.getString("NomeFilial")); 
        t.setAtivo(rs.getBoolean("Ativo"));
        tis.add(t);
      }
      db.close();
      return tis;
    } catch (SQLException ex) {
      System.out.println(ex.getMessage());
      db.close();
      return null;
    }

  }

  @Override
  public Ti mostrar(int idUsuario) {
    DB db = new DB(true);
    try {
      String sql = "SELECT * FROM usuario WHERE idUsuario = " + idUsuario + ";";
      ResultSet rs = db.executarConsulta(sql);
      Ti t = new Ti();
      while (rs.next()) {
        t.setIdUsuario(rs.getInt("idUsuario"));
        t.setNomeUsuario(rs.getString("NomeUsuario"));
        t.setEmail(rs.getString("Email"));
        t.setIdDepartamento(rs.getInt("idDepartamento"));
        t.setAtivo(rs.getBoolean("Ativo"));
      }
      db.close();
      return t;
    } catch (SQLException ex) {
      System.out.println(ex.getMessage());
      db.close();
      return null;
    }
  }

  @Override
  public boolean editar(Ti t) {
   DB db = new DB(false);

    try {

      String sql
              = "UPDATE usuario SET "
              + "NomeUsuario = '" + t.getNomeUsuario() + "', "
              + "email = '" + t.getEmail() + "', ";
      
              if (!t.getSenha().isEmpty()) {
                sql = sql + "Senha = '" + t.getSenha() + "', ";
              }
              
              sql = sql 
                      + "IdDepartamento= " + t.getIdDepartamento() + ", "
                      + "idFilial= " + t.getIdFilial()+ " "
              + "Where idUsuario = " + t.getIdUsuario() + ";";
      
      if (!db.executarAlteracao(sql)) {
        throw new Exception("Não foi possivel atualizar os dados de usuário.");
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
  public boolean salvar(Ti t) {
    DB db = new DB(false);

    try {

      String sql
              = "INSERT INTO usuario "
              + "(NomeUsuario, Email, Senha, Ativo, IdDepartamento, idFilial)"
              + "VALUES ("
              + "'" + t.getNomeUsuario() + "', "
              + "'" + t.getEmail() + "', "
              + "'" + t.getSenha() + "', "
              + "true, "
              + t.getIdDepartamento() + ", "
              + t.getIdFilial() + ");";

      if (!db.executarAlteracao(sql)) {
        throw new Exception("Não foi possível cadastrar o usuário.");
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
  public boolean desativar(int idUsuario) {
    DB db = new DB(false);

    try {

      String sql
              = "UPDATE usuario SET "
              + "Ativo = false "
              + "Where idUsuario = " + idUsuario + "; ";

      if (!db.executarAlteracao(sql)) {
        throw new Exception("Não foi possível desativar o usuário.");
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
