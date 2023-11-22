package com.br.sistema.api.repository.requisicao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.br.sistema.api.model.RequisicaoDados;
import com.br.sistema.api.repository.filter.RequisicaoFilter;

public interface RequisicaoRepositoryQuery {
	public Page<RequisicaoDados> filtrar(RequisicaoFilter requisicaoFilter, Pageable pageable);

}
