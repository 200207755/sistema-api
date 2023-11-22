package com.br.sistema.api.model;

import java.time.LocalDate;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "REQUISICAODADOS")
public class RequisicaoDados {

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	private String link;

	@Column(name = "data_requisicao")
	private LocalDate dataRequisicao;

	@Column(name = "data_processamento")
	private LocalDate dataProcessamento;
	
	@Column(name = "banco_dados")
	private String bancoDados;

	@Column(name = "status")
	private String status;
	
	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public LocalDate getDataRequisicao() {
		return dataRequisicao;
	}

	public void setDataRequisicao(LocalDate dataRequisicao) {
		this.dataRequisicao = dataRequisicao;
	}

	public LocalDate getDataProcessamento() {
		return dataProcessamento;
	}

	public void setDataProcessamento(LocalDate dataProcessamento) {
		this.dataProcessamento = dataProcessamento;
	}

	public String getBancoDados() {
		return bancoDados;
	}

	public void setBancoDados(String bancoDados) {
		this.bancoDados = bancoDados;
	}

	@Override
	public int hashCode() {
		return Objects.hash(codigo);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RequisicaoDados other = (RequisicaoDados) obj;
		return Objects.equals(codigo, other.codigo);
	}


}
