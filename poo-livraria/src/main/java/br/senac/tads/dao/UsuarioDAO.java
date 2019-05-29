/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.dao;

import br.senac.tads.db.DB;
import br.senac.tads.model.Usuario;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class UsuarioDAO implements CrudInterface<Usuario>{

    @Override
  public ArrayList<Usuario> listar(int idFilial) {
    DB db = new DB(true);
    try {
      String sql = "SELECT * FROM usuario "
              + "INNER JOIN departamento ON usuario.idDepartamento = departamento.idDepartamento "
              + "INNER JOIN filial ON filial.idFilial = usuario.idFilial "
              + "WHERE usuario.Ativo = true;";
      ResultSet rs = db.executarConsulta(sql);
      ArrayList<Usuario> usuarios = new ArrayList<>();
      while (rs.next()) {
        Usuario u = new Usuario();
        u.setIdUsuario(rs.getInt("idUsuario"));
        u.setNome(rs.getString("NomeUsuario"));
        u.setEmail(rs.getString("Email"));
        u.setSenha(rs.getString("Senha")); 
        u.setNomeDepartamento(rs.getString("NomeDepartamento")); 
        u.setIdDepartamento(rs.getInt("idDepartamento"));
        u.setNomeFilial(rs.getString("NomeFilial"));    
        u.setAtivo(rs.getBoolean("Ativo"));
        usuarios.add(u);
      }
      db.close();
      return usuarios;
    } catch (SQLException ex) {
      System.out.println(ex.getMessage());
      db.close();
      return null;
    }
  }

    @Override
  public Usuario mostrar(int idUsuario) {
    DB db = new DB(true);
    try {
      String sql = "SELECT * FROM usuario WHERE idUsuario = " + idUsuario + ";";
      ResultSet rs = db.executarConsulta(sql);
      Usuario u = new Usuario();
      while (rs.next()) {
        u.setIdUsuario(rs.getInt("idUsuario"));
        u.setNome(rs.getString("NomeUsuario"));
        u.setEmail(rs.getString("Email"));
        u.setIdDepartamento(rs.getInt("idDepartamento"));
        u.setAtivo(rs.getBoolean("Ativo"));
      }
      db.close();
      return u;
    } catch (SQLException ex) {
      System.out.println(ex.getMessage());
      db.close();
      return null;
    }
  }

    @Override
  public boolean editar(Usuario u) {
   DB db = new DB(false);

    try {

      String sql
              = "UPDATE usuario SET "
              + "NomeUsuario = '" + u.getNome() + "', "
              + "email = '" + u.getEmail() + "', ";
      
              if (!u.getSenha().isEmpty()) {
                sql = sql + "Senha = '" + u.getSenha() + "', ";
              }
              
              sql = sql 
                      + "IdDepartamento= " + u.getIdDepartamento() + ", "
                      + "idFilial= " + u.getIdFilial()+ " "
              + "Where idUsuario = " + u.getIdUsuario() + ";";
      
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
  public boolean salvar(Usuario u) {
    DB db = new DB(false);

    try {

      String sql
              = "INSERT INTO usuario "
              + "(NomeUsuario, Email, Senha, Ativo, IdDepartamento, idFilial)"
              + "VALUES ("
              + "'" + u.getNome() + "', "
              + "'" + u.getEmail() + "', "
              + "'" + u.getSenha() + "', "
              + "true, "
              + u.getIdDepartamento() + ", "
              + u.getIdFilial() + ");";

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
  
    public Usuario login (Usuario usuario) {
    DB db = new DB(true);
    try {
      
      String sql = "select usuario.idUsuario, usuario.NomeUsuario, usuario.Email, usuario.Senha, usuario.Ativo, usuario.idDepartamento, departamento.NomeDepartamento, usuario.idFilial, filial.NomeFilial from usuario inner join departamento on departamento.idDepartamento = usuario.idDepartamento inner join filial on filial.idFilial = usuario.idFilial "
                 + "where usuario.Email = '" + usuario.getEmail() + "' and usuario.Ativo = true;";
      
      System.out.println(sql);
      
      ResultSet rs = db.executarConsulta(sql) != null ? db.executarConsulta(sql) : null;
      
      if(rs == null) {
        return usuario;
      }
      
      while (rs.next()) {
        usuario = new Usuario();
        usuario.setIdUsuario(rs.getInt("idUsuario"));
        usuario.setNome(rs.getString("NomeUsuario"));
        usuario.setEmail(rs.getString("Email"));
        usuario.setSenha(rs.getString("Senha"));
        usuario.setAtivo(rs.getBoolean("Ativo"));
        usuario.setIdDepartamento(rs.getInt("idDepartamento"));
        usuario.setIdFilial(rs.getInt("idFilial"));
        usuario.setNomeDepartamento(rs.getString("NomeDepartamento"));
        usuario.setNomeFilial(rs.getString("NomeFilial"));
      }
      db.close();
      
      return usuario;
    } catch (SQLException ex) {
      System.out.println(ex.getMessage());
      db.close();
      return null;
    }
  }
}