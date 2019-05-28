package br.senac.tads.model;

/**
 *
 * @author Bruna
 */
public class Departamento extends Object {

  private int idDepartamento;
  private String nomeDepartamento;

  public Departamento() {
    this.idDepartamento = 0;
    this.nomeDepartamento = "";
  }

  public Departamento(int idDepartamento, String nomeDepartamento) {
    this.idDepartamento = idDepartamento;
    this.nomeDepartamento = nomeDepartamento;
  }

  public int getIdDepartamento() {
    return idDepartamento;
  }

  public String getNomeDepartamento() {
    return nomeDepartamento;
  }

  public void setIdDepartamento(int idDepartamento) {
    this.idDepartamento = idDepartamento;
  }

  public void setNomeDepartamento(String nomeDepartamento) {
    this.nomeDepartamento = nomeDepartamento;
  }

}
