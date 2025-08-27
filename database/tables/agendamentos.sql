

CREATE TABLE IF NOT EXISTS agendamentos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    cliente_id UUID NOT NULL,
    prestador_id UUID NOT NULL,
    servico_id UUID NOT NULL,
    data_agendamento TIMESTAMPTZ NOT NULL,
    data_termino TIMESTAMPTZ NOT NULL,
  status TIPO_STATUS_AGENDAMENTO NOT NULL, -- Ex: 'pendente', 'confirmado', 'concluido', 'cancelado'
    valor_total DECIMAL(10, 2) NOT NULL,
    criado_em TIMESTAMPTZ DEFAULT NOW(),
    CONSTRAINT fk_agendamento_cliente FOREIGN KEY (cliente_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_agendamento_prestador FOREIGN KEY (prestador_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_agendamento_servico FOREIGN KEY (servico_id) REFERENCES servicos(id) ON DELETE CASCADE
);