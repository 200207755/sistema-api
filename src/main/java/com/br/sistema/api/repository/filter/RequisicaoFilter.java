package com.br.sistema.api.repository.filter;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class RequisicaoFilter {
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate dataRequisicaoDe;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate dataRequisicaoAte;

	public LocalDate getDataRequisicaoDe() {
		return dataRequisicaoDe;
	}

	public void setDataRequisicaoDe(LocalDate dataRequisicaoDe) {
		this.dataRequisicaoDe = dataRequisicaoDe;
	}

	public LocalDate getDataRequisicaoAte() {
		return dataRequisicaoAte;
	}

	public void setDataRequisicaoAte(LocalDate dataRequisicaoAte) {
		this.dataRequisicaoAte = dataRequisicaoAte;
	}

}
