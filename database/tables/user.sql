CREATE TABLE IF NOT EXISTS usuarios (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    cpf VARCHAR(14) UNIQUE NOT NULL,
    sexo TIPO_SEXO NOT NULL DEFAULT 'outro',
    data_nascimento DATE,
    url_foto_perfil VARCHAR(255),
    tipo tipo_usuario NOT NULL,
    email_confirmado BOOLEAN NOT NULL DEFAULT FALSE,
    criado_em TIMESTAMPTZ DEFAULT NOW(),
    atualizado_em TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS cuidadores (
    usuario_id UUID PRIMARY KEY,
    bio TEXT,
    anos_experiencia INT,
    avaliacao_media DECIMAL(3, 2) DEFAULT 0.0,
    documento_profissional VARCHAR(50),
    criado_em TIMESTAMPTZ DEFAULT NOW(),
    CONSTRAINT fk_cuidadores_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS enfermeiros (
    usuario_id UUID PRIMARY KEY,
    coren VARCHAR(20) UNIQUE NOT NULL,
    especialidade VARCHAR(100),
    anos_experiencia INT,
    criado_em TIMESTAMPTZ DEFAULT NOW(),
    CONSTRAINT fk_enfermeiros_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS acompanhantes (
    usuario_id UUID PRIMARY KEY,
    bio TEXT,
    anos_experiencia INT,
    criado_em TIMESTAMPTZ DEFAULT NOW(),
    CONSTRAINT fk_acompanhantes_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);