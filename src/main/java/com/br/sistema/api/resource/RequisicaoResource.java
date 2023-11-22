package com.br.sistema.api.resource;

import java.time.LocalDate;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.br.sistema.api.event.RecursoCriadoEvent;
import com.br.sistema.api.model.RequisicaoDados;
import com.br.sistema.api.repository.RequisicaoRepository;
import com.br.sistema.api.repository.filter.RequisicaoFilter;
import com.br.sistema.api.service.RequisicaoService;

@RestController
@RequestMapping("/requisicao")
public class RequisicaoResource {

	@Autowired
	private RequisicaoRepository requisicaoRepository;
		
	@Autowired
	private RequisicaoService requisicaoService;

	@Autowired
	private ApplicationEventPublisher publisher;
	
	@GetMapping
	@PreAuthorize("hasAuthority('ROLE_PESQUISAR_REQUISICAO') and hasAuthority('SCOPE_read')")
	public Page<RequisicaoDados> pesquisar(RequisicaoFilter requisicaoFilter, Pageable pageable) {
		return requisicaoRepository.filtrar(requisicaoFilter, pageable);
	}
	
	@PostMapping
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_REQUISICAO') and hasAuthority('SCOPE_write')")
	public ResponseEntity<RequisicaoDados> criar(@Valid @RequestBody RequisicaoDados requisicaoDados, HttpServletResponse response) {
		requisicaoDados.setBancoDados("BANCODEDADOS");
		requisicaoDados.setDataRequisicao(LocalDate.now());
		requisicaoDados.setStatus("AGUARDANDO PROCESSAMENTO");
		RequisicaoDados requisicaoDadosSalvo = requisicaoService.salvar(requisicaoDados);
		publisher.publishEvent(new RecursoCriadoEvent(this, response, requisicaoDadosSalvo.getCodigo()));
		return ResponseEntity.status(HttpStatus.CREATED).body(requisicaoDadosSalvo);
	}

	@DeleteMapping("/{codigo}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('ROLE_REMOVER_REQUISICAO') and hasAuthority('SCOPE_write')")
	public void remover(@PathVariable Long codigo) {
		Optional<RequisicaoDados> dadoOptinal = requisicaoRepository.findById(codigo);
		if(dadoOptinal.isPresent()) {
			RequisicaoDados dado = dadoOptinal.get();
			dado.setStatus("EXCLUIDO");
			requisicaoRepository.saveAndFlush(dado);
		}
		
	}
}
