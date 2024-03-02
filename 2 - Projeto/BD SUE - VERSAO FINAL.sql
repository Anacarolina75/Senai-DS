CREATE DATABASE sue;
USE sue;

CREATE TABLE Usuario (
    id_Usuario INT PRIMARY KEY,
    Usuario_nome VARCHAR(45),
    Usuario_cpf VARCHAR(45),
    Usuario_data_nasc DATE,
    Usuario_telefone VARCHAR(11),
    Usuario_email VARCHAR(60)
);

CREATE TABLE Endereco (
    id_Endereco INT PRIMARY KEY,
    Endereco_cep VARCHAR(10),
    Endereco_rua VARCHAR(45),
    Endereco_cidade VARCHAR(45),
    Endereco_numero VARCHAR(45),
    id_usuario_ender_pk INT,
    FOREIGN KEY (id_usuario_ender_pk) REFERENCES Usuario(id_Usuario)
);

CREATE TABLE Coordenador (
    id_Coordenador INT PRIMARY KEY,
    coordenador_Matricula VARCHAR(11),
    id_usuario_coord_pk INT,
    FOREIGN KEY (id_usuario_coord_pk) REFERENCES Usuario(id_Usuario)
);

CREATE TABLE Curso (
    id_Curso INT PRIMARY KEY,
    Curso_nome VARCHAR(45),
    Coordenador_id_Coordenador INT,
    Curso_valor DOUBLE,
    FOREIGN KEY (Coordenador_id_Coordenador) REFERENCES Coordenador(id_Coordenador)
);

CREATE TABLE Turma (
    id_Turma INT PRIMARY KEY,
    Turma_ano INT,
    Curso_id_Curso INT,
    FOREIGN KEY (Curso_id_Curso) REFERENCES Curso(id_Curso)
);

CREATE TABLE Responsavel (
    id_Responsavel INT PRIMARY KEY,
    id_usuario_responsavel_pk INT,
    FOREIGN KEY (id_usuario_responsavel_pk) REFERENCES Usuario(id_Usuario)
);

CREATE TABLE Professor (
    id_Professor INT PRIMARY KEY,
    professor_Matricula VARCHAR(11),
    id_usuario_prof_pk INT,
    FOREIGN KEY (id_usuario_prof_pk) REFERENCES Usuario(id_Usuario)
);

CREATE TABLE Disciplina (
    id_Disciplina INT PRIMARY KEY,
    Disciplina_nome VARCHAR(45),
    Disciplina_valor DOUBLE
);

CREATE TABLE Recuperacao (
    id_Recuperacao INT PRIMARY KEY,
    Recuperacao_valor DOUBLE
);

CREATE TABLE Aluno (
    id_Aluno INT PRIMARY KEY,
    aluno_Matricula VARCHAR(11),
    id_usuario_aluno_pk INT,
    Recuperacao_id_Recuperacao INT,
    FOREIGN KEY (id_usuario_aluno_pk) REFERENCES Usuario(id_Usuario),
    FOREIGN KEY (Recuperacao_id_Recuperacao) REFERENCES Recuperacao(id_Recuperacao)
);

CREATE TABLE Turma_has_Disciplina (
    Turma_id_Turma INT,
    Disciplina_id_Disciplina INT,
    PRIMARY KEY (Turma_id_Turma, Disciplina_id_Disciplina),
    FOREIGN KEY (Turma_id_Turma) REFERENCES Turma(id_Turma),
    FOREIGN KEY (Disciplina_id_Disciplina) REFERENCES Disciplina(id_Disciplina)
);

CREATE TABLE Professor_has_Disciplina (
    Professor_id_Professor INT,
    Disciplina_id_Disciplina INT,
    PRIMARY KEY (Professor_id_Professor, Disciplina_id_Disciplina),
    FOREIGN KEY (Professor_id_Professor) REFERENCES Professor(id_Professor),
    FOREIGN KEY (Disciplina_id_Disciplina) REFERENCES Disciplina(id_Disciplina)
);


CREATE TABLE Aluno_has_Turma (
    Aluno_id_Aluno INT,
    Turma_id_Turma INT,
    Turma_Curso_id_Curso INT,
    Turma_Curso_Coordenador_id_Coordenador INT,
    PRIMARY KEY (Aluno_id_Aluno, Turma_id_Turma),
    FOREIGN KEY (Aluno_id_Aluno) REFERENCES Aluno(id_Aluno),
    FOREIGN KEY (Turma_id_Turma) REFERENCES Turma(id_Turma),
    FOREIGN KEY (Turma_Curso_id_Curso) REFERENCES Curso(id_Curso)
    );
    

CREATE TABLE Pagamento (
    id_Pagamento INT PRIMARY KEY,
    Pagamento_valor_curso DOUBLE,
    Pagamento_valor_recu DOUBLE,
    Pagamento_vencimento DATE,
    Pagamento_dataPagamento DATE,
    Pagamento_valorPagamento DOUBLE,
    Responsavel_id_Responsavel INT,
    Recuperacao_id_Recuperacao INT,
    Curso_id_Curso INT,
    Curso_Coordenador_id_Coordenador INT,
    FOREIGN KEY (Responsavel_id_Responsavel) REFERENCES Responsavel(id_Responsavel),
    FOREIGN KEY (Recuperacao_id_Recuperacao) REFERENCES Recuperacao(id_Recuperacao),
    FOREIGN KEY (Curso_id_Curso) REFERENCES Curso(id_Curso),
    FOREIGN KEY (Curso_Coordenador_id_Coordenador) REFERENCES Coordenador(id_Coordenador)
);

