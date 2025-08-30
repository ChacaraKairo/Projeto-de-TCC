/*Postgres*/
-- Para usar a função gen_random_uuid(), a extensão 'pgcrypto' precisa estar habilitada.
-- CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE localizacao(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_user UUID NOT NULL,
  latitude DECIMAL(9, 6) NOT NULL,
  longitude DECIMAL(10, 6) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_user FOREIGN KEY(id_user) REFERENCES usuarios(id) ON DELETE CASCADE
);