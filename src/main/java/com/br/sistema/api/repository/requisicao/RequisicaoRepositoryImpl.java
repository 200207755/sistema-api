package com.br.sistema.api.repository.requisicao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;

import com.br.sistema.api.model.RequisicaoDados;
import com.br.sistema.api.model.RequisicaoDados_;
import com.br.sistema.api.repository.filter.RequisicaoFilter;

public class RequisicaoRepositoryImpl implements RequisicaoRepositoryQuery {

	@PersistenceContext
	private EntityManager manager;

	public Page<RequisicaoDados> filtrar(RequisicaoFilter requisicaoFilter, Pageable pageable) {
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<RequisicaoDados> criteria = builder.createQuery(RequisicaoDados.class);
		Root<RequisicaoDados> root = criteria.from(RequisicaoDados.class);
		
		Predicate[] predicates = criarRestricoes(requisicaoFilter, builder, root);
		criteria.where(predicates);
		
		TypedQuery<RequisicaoDados> query = manager.createQuery(criteria);
		adicionarRestricoesDePaginacao(query, pageable);
		
		return new PageImpl<>(query.getResultList(), pageable, total());
	}

	private void adicionarRestricoesDePaginacao(TypedQuery<?> query, Pageable pageable) {
		int paginaAtual = pageable.getPageNumber();
		int totalRegistrosPorPagina = pageable.getPageSize();
		int primeiroRegistroDaPagina = paginaAtual * totalRegistrosPorPagina;
		
		query.setFirstResult(primeiroRegistroDaPagina);
		query.setMaxResults(totalRegistrosPorPagina);
	}
	
	private Long total() {
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<Long> criteria = builder.createQuery(Long.class);
		Root<RequisicaoDados> root = criteria.from(RequisicaoDados.class);
		
		criteria.select(builder.count(root));
		return manager.createQuery(criteria).getSingleResult();
	}
	private Predicate[] criarRestricoes(RequisicaoFilter requisicaoFilter, CriteriaBuilder builder, Root<RequisicaoDados> root) {
		List<Predicate> predicates = new ArrayList<>();
		predicates.add(builder.notEqual(root.get(RequisicaoDados_.status), "EXCLUIDO"));
		
		if (requisicaoFilter.getDataRequisicaoDe() != null) {
			predicates.add(builder.greaterThanOrEqualTo(root.get(RequisicaoDados_.dataRequisicao), requisicaoFilter.getDataRequisicaoDe()));
		}
		if (requisicaoFilter.getDataRequisicaoAte() != null) {
			predicates.add(builder.lessThanOrEqualTo(root.get(RequisicaoDados_.dataRequisicao), requisicaoFilter.getDataRequisicaoAte()));
		}
		return predicates.toArray(new Predicate[predicates.size()]);
	}
}
