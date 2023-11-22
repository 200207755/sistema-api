package com.br.sistema.api.model;

import java.time.LocalDate;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(RequisicaoDados.class)
public abstract class RequisicaoDados_ {

	public static volatile SingularAttribute<RequisicaoDados, Long> codigo;
	public static volatile SingularAttribute<RequisicaoDados, LocalDate> dataRequisicao;
	public static volatile SingularAttribute<RequisicaoDados, String> link;
	public static volatile SingularAttribute<RequisicaoDados, LocalDate> dataProcessamento;
	public static volatile SingularAttribute<RequisicaoDados, String> bancoDados;
	public static volatile SingularAttribute<RequisicaoDados, String> status;

	public static final String CODIGO = "codigo";
	public static final String DATA_REQUISICAO = "dataRequisicao";
	public static final String LINK = "link";
	public static final String DATA_PROCESSAMENTO = "dataProcessamento";
	public static final String BANCO_DADOS = "bancoDados";
	public static final String STATUS = "status";

}

