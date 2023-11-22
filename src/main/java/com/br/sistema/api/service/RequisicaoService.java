package com.br.sistema.api.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.br.sistema.api.model.RequisicaoDados;
import com.br.sistema.api.repository.RequisicaoRepository;

@Service
public class RequisicaoService {
		
	private static final Logger logger = LoggerFactory.getLogger(RequisicaoService.class);
	
	@Autowired
	private RequisicaoRepository requisicaoRepository;

	public RequisicaoDados salvar(RequisicaoDados requisicaoDados) {
		return requisicaoRepository.save(requisicaoDados);
	}

	public RequisicaoRepository getRequisicaoRepository() {
		return requisicaoRepository;
	}

	public void setRequisicaoRepository(RequisicaoRepository requisicaoRepository) {
		this.requisicaoRepository = requisicaoRepository;
	}
	
}
