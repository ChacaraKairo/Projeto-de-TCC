CREATE TABLE IF NOT EXISTS avaliacoes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    agendamento_id UUID UNIQUE NOT NULL,
    prestador_id UUID NOT NULL,
    cliente_id UUID NOT NULL,
    nota INT NOT NULL,
    comentario TEXT,
    criado_em TIMESTAMPTZ DEFAULT NOW(),
    CONSTRAINT fk_avaliacao_agendamento FOREIGN KEY (agendamento_id) REFERENCES agendamentos(id) ON DELETE CASCADE,
    CONSTRAINT fk_avaliacao_prestador FOREIGN KEY (prestador_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_avaliacao_cliente FOREIGN KEY (cliente_id) REFERENCES usuarios(id) ON DELETE CASCADE
);