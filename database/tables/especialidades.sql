CREATE TABLE IF NOT EXISTS especialidades (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(100) UNIQUE NOT NULL
);

-- Tabela de junção para relacionar prestadores (cuidadores, enfermeiros, etc.) a especialidades
CREATE TABLE IF NOT EXISTS prestador_especialidades (
    prestador_id UUID NOT NULL,
    especialidade_id UUID NOT NULL,
    PRIMARY KEY (prestador_id, especialidade_id),
    CONSTRAINT fk_pe_prestador FOREIGN KEY (prestador_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_pe_especialidade FOREIGN KEY (especialidade_id) REFERENCES especialidades(id) ON DELETE CASCADE
);