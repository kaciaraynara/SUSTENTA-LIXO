-- schema.sql
-- Script de criação do banco de dados PostgreSQL com suporte a PostGIS.
-- Este schema segue o modelo de dados definido na Etapa 1.

-- Instalar a extensão PostGIS para dados geoespaciais
CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    perfil VARCHAR(20) NOT NULL DEFAULT 'cidadao' 
);

CREATE TABLE equipes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    regiao_atendimento VARCHAR(100)
);

CREATE TABLE relatos (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER REFERENCES usuarios(id),
    descricao TEXT NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Pendente', 
    timestamp_criacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    equipe_id INTEGER REFERENCES equipes(id) NULL,
    localizacao GEOMETRY(Point, 4326) NOT NULL
);

CREATE INDEX idx_relatos_localizacao ON relatos USING GIST(localizacao);