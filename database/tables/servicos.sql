CREATE TABLE IF NOT EXISTS servicos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    prestador_id UUID NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    duracao_minutos INT,
    CONSTRAINT fk_servicos_prestador FOREIGN KEY (prestador_id) REFERENCES usuarios(id) ON DELETE CASCADE
);