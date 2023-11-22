package com.br.sistema.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.br.sistema.api.model.RequisicaoDados;
import com.br.sistema.api.repository.requisicao.RequisicaoRepositoryQuery;

@Repository
public interface RequisicaoRepository extends JpaRepository<RequisicaoDados, Long>, RequisicaoRepositoryQuery {

}
