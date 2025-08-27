CREATE TABLE IF NOT EXISTS pagamentos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    agendamento_id UUID UNIQUE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    taxa_plataforma DECIMAL(10, 2) NOT NULL,
    valor_liquido_prestador DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL, -- Ex: 'pago', 'processando', 'falhou'
    metodo_pagamento VARCHAR(50), -- Ex: 'cartao_credito', 'boleto', 'pix'
    transacao_id VARCHAR(255) UNIQUE NOT NULL, -- ID da transação no gateway (Stripe, Mercado Pago)
    criado_em TIMESTAMPTZ DEFAULT NOW(),
    CONSTRAINT fk_pagamento_agendamento FOREIGN KEY (agendamento_id) REFERENCES agendamentos(id) ON DELETE CASCADE
);
