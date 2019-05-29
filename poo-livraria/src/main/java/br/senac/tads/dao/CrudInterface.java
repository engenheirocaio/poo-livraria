/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.dao;

import java.util.ArrayList;
import java.util.Date;


public interface CrudInterface<O> {
  
  public ArrayList<O> listar(int idFilial);
  public O mostrar(int ID);
  public boolean editar(O objeto);
  public boolean salvar(O objeto);
  public boolean desativar(int ID);

}
