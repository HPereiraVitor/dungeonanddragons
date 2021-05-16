CREATE SCHEMA DUNGEONS_AND_DRAGONS;
USE DUNGEONS_AND_DRAGONS;

CREATE USER 'USER'@'LOCALHOST' IDENTIFIED BY 'DD123';
GRANT SELECT, INSERT, DELETE, UPDATE ON DUNGEONS_AND_DRAGONS.* TO USER@'LOCALHOST';

CREATE TABLE USU_USUARIO(
    USU_ID BIGINT UNSIGNED AUTO_INCREMENT,
    USU_NOME_USUARIO VARCHAR(50) NOT NULL,
    USU_SENHA VARCHAR(50) NOT NULL,
    USU_NOME_EXIBICAO VARCHAR(64),
    USU_ADMINISTRADOR VARCHAR(20),
    ADM_CLASSIFICACAO INT,

    CONSTRAINT PK_USU_ID PRIMARY KEY (USU_ID),
    CONSTRAINT UK_USU_NOME_USUARIO UNIQUE (USU_NOME_USUARIO)
);

CREATE TABLE PER_PERSONAGEM(
    PER_ID BIGINT UNSIGNED AUTO_INCREMENT,
    PER_PROPRIETARIO BIGINT UNSIGNED,
    PER_NOME VARCHAR(50) NOT NULL,
    PER_RACA VARCHAR(20) NOT NULL,
    PER_CLASSE VARCHAR(50) NOT NULL,
	PER_NIVEL BIGINT UNSIGNED,
	PER_ANTECEDENTE VARCHAR(50),
	PER_FORCA BIGINT UNSIGNED,
	PER_DESTREZA BIGINT UNSIGNED,
	PER_CONSTITUICAO BIGINT UNSIGNED,
	PER_INTELIGENCIA BIGINT UNSIGNED,
	PER_SABEDORIA BIGINT UNSIGNED,
	PER_CARISMA BIGINT UNSIGNED,

    CONSTRAINT PK_PERSONAGEM PRIMARY KEY (PER_ID, PER_PROPRIETARIO),
    CONSTRAINT FK_PER_USU FOREIGN KEY (PER_PROPRIETARIO)
        REFERENCES USU_USUARIO (USU_ID)
);

CREATE TABLE FEI_FEITICEIRO(
    FEI_ID BIGINT UNSIGNED,
    FEI_MAGIAS_CONHECIDAS INT,
    FEI_MODIFICADOR_HABILIDADE INT,

    CONSTRAINT PK_FEI_ID PRIMARY KEY (FEI_ID),
    CONSTRAINT FK_FEI_USU FOREIGN KEY (FEI_ID)
        REFERENCES PER_PERSONAGEM (PER_ID)
);

CREATE TABLE LUT_LUTADOR(
    LUT_ID BIGINT UNSIGNED,
    LUT_DADOS_SUPERIORIDADE INT,

    CONSTRAINT PK_LUT_ID PRIMARY KEY (LUT_ID),
    CONSTRAINT FK_LUT_USU FOREIGN KEY (LUT_ID)
        REFERENCES PER_PERSONAGEM (PER_ID)
);

CREATE TABLE GRU_GRUPO(
    GRU_ID BIGINT UNSIGNED AUTO_INCREMENT,
    GRU_MESTRE BIGINT UNSIGNED,
    GRU_NOME VARCHAR(50),

    CONSTRAINT PK_GRUPO PRIMARY KEY (GRU_ID, GRU_MESTRE),
    CONSTRAINT UK_GRUPO UNIQUE (GRU_MESTRE, GRU_NOME),
    CONSTRAINT FK_GRU_PER FOREIGN KEY (GRU_MESTRE)
        REFERENCES USU_USUARIO (USU_ID)
);

CREATE TABLE INT_INTEGRANTE(
    GRU_ID BIGINT UNSIGNED,
    PER_ID BIGINT UNSIGNED,

    CONSTRAINT PK_INTEGRANTE PRIMARY KEY (GRU_ID, PER_ID),
    CONSTRAINT FK_INT_GRU FOREIGN KEY (GRU_ID)
        REFERENCES GRU_GRUPO (GRU_ID),
    CONSTRAINT FK_INT_PER FOREIGN KEY (PER_ID)
        REFERENCES PER_PERSONAGEM (PER_ID)
);
