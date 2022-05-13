CREATE TABLE USUARIO(
	ID_USUARIO INT PRIMARY KEY UNIQUE,
	NOME VARCHAR(50),
	EMAIL VARCHAR(50),
	SENHA VARCHAR(50),
	IDADE INT
);

CREATE TABLE TRILHA(
	ID_TRILHA INT PRIMARY KEY UNIQUE,
	NOME VARCHAR(50)
);

CREATE TABLE ESTUDA(
	FK_TRILHA_ID INT,
	FK_USUARIO_ID INT,
	
	CONSTRAINT FK_TRILHA_ID
	FOREIGN KEY(FK_TRILHA_ID)
	REFERENCES TRILHA(ID_TRILHA),
	CONSTRAINT FK_USUARIO_ID
	FOREIGN KEY(FK_USUARIO_ID)
	REFERENCES USUARIO(ID_USUARIO)
);

CREATE TABLE AULA(
	ID_AULA INT PRIMARY KEY UNIQUE,
	NOME VARCHAR(50),
	TEMA VARCHAR(50),
	TEXTO TEXT,
	IMAGEM VARCHAR(100)
);

CREATE TABLE EXERCICIO(
	ID_EXERCICIO INT PRIMARY KEY UNIQUE,
	NOME VARCHAR(50),
	TEMA VARCHAR(50),
	ENUNCIADO TEXT,
	IMAGEM VARCHAR(100)
);

CREATE TABLE CONTEM_TRILHA_AULA_EXERCICIO(
	FK_TRILHA_ID INT,
	FK_AULA_ID INT,
	FK_EXERCICIO_ID INT,
	
	CONSTRAINT FK_TRILHA_ID
	FOREIGN KEY(FK_TRILHA_ID)
	REFERENCES TRILHA(ID_TRILHA),
	CONSTRAINT FK_AULA_ID
	FOREIGN KEY(FK_AULA_ID)
	REFERENCES AULA(ID_AULA),
	CONSTRAINT FK_EXERCICIO_ID
	FOREIGN KEY(FK_EXERCICIO_ID)
	REFERENCES EXERCICIO(ID_EXERCICIO)
);


INSERT INTO USUARIO VALUES (1 ,'Beto', 'beto@gmail.com', 'yashjsjak', '22');
INSERT INTO USUARIO VALUES (2 ,'Magno', 'magno@gmail.com', 'fdsfsdfsd', '24');
INSERT INTO USUARIO VALUES (3 ,'Campos', 'campos@gmail.com', 'jkhkhjkhj', '26');
INSERT INTO USUARIO VALUES (4 ,'Silva', 'silva@gmail.com', 'cvbcvbcvn', '28');

INSERT INTO TRILHA VALUES (1 ,'Kotlin');
INSERT INTO TRILHA VALUES (2 ,'Javascript');
INSERT INTO TRILHA VALUES (3 ,'Python');
INSERT INTO TRILHA VALUES (4 ,'Algoritmos');

INSERT INTO ESTUDA VALUES (1 ,1);
INSERT INTO ESTUDA VALUES (1 ,4);
INSERT INTO ESTUDA VALUES (2 ,1);
INSERT INTO ESTUDA VALUES (2 ,3);
INSERT INTO ESTUDA VALUES (3 ,1);
INSERT INTO ESTUDA VALUES (3 ,4);
INSERT INTO ESTUDA VALUES (4 ,1);
INSERT INTO ESTUDA VALUES (4 ,2);

INSERT INTO AULA VALUES (1 ,'O que é Kotlin?', 'Introdução', 'Texto referente ao conteúdo da aula', 'Url de imagem referente ao conteúdo da aula');
INSERT INTO AULA VALUES (2 ,'O que é Javascript?', 'Introdução', 'Texto referente ao conteúdo da aula', 'Url de imagem referente ao conteúdo da aula');
INSERT INTO AULA VALUES (3 ,'O que é Python?', 'Introdução', 'Texto referente ao conteúdo da aula', 'Url de imagem referente ao conteúdo da aula');
INSERT INTO AULA VALUES (4 ,'O que são Algoritmos?', 'Introdução', 'Texto referente ao conteúdo da aula', 'Url de imagem referente ao conteúdo da aula');
INSERT INTO AULA VALUES (5 ,'O que é Kotlin?', 'Intermediário', 'Texto referente ao conteúdo da aula', 'Url de imagem referente ao conteúdo da aula');
INSERT INTO AULA VALUES (6 ,'O que é Javascript?', 'Intermediário', 'Texto referente ao conteúdo da aula', 'Url de imagem referente ao conteúdo da aula');
INSERT INTO AULA VALUES (7 ,'O que é Python?', 'Intermediário', 'Texto referente ao conteúdo da aula', 'Url de imagem referente ao conteúdo da aula');
INSERT INTO AULA VALUES (8 ,'O que são Algoritmos?', 'Intermediário', 'Texto referente ao conteúdo da aula', 'Url de imagem referente ao conteúdo da aula');
INSERT INTO AULA VALUES (9 ,'O que é Python?', 'Avançado', 'Texto referente ao conteúdo da aula', 'Url de imagem referente ao conteúdo da aula');
INSERT INTO AULA VALUES (10 ,'O que são Algoritmos?', 'Avançado', 'Texto referente ao conteúdo da aula', 'Url de imagem referente ao conteúdo da aula');


INSERT INTO EXERCICIO VALUES (1 ,'Primeiro problema em Kotlin', 'Exercicio Introdutório', 'Texto referente ao enunciado do exercício', 'Url de imagem referente ao enunciado do exercício');
INSERT INTO EXERCICIO VALUES (2 ,'Primeiro problema em Javascript', 'Exercicio Introdutório', 'Texto referente ao enunciado do exercício', 'Url de imagem referente ao enunciado do exercício');
INSERT INTO EXERCICIO VALUES (3 ,'Primeiro problema em Python', 'Exercicio Introdutório', 'Texto referente ao enunciado do exercício', 'Url de imagem referente ao enunciado do exercício');
INSERT INTO EXERCICIO VALUES (4 ,'Primeiro problema em Algoritmos', 'Exercicio Introdutório', 'Texto referente ao enunciado do exercício', 'Url de imagem referente ao enunciado do exercício');

INSERT INTO CONTEM_TRILHA_AULA_EXERCICIO VALUES (1, 1, 1);
INSERT INTO CONTEM_TRILHA_AULA_EXERCICIO VALUES (2, 2, 2);
INSERT INTO CONTEM_TRILHA_AULA_EXERCICIO VALUES (3, 3 ,3);
INSERT INTO CONTEM_TRILHA_AULA_EXERCICIO VALUES (4, 4 ,4);

SELECT * FROM USUARIO;

SELECT * FROM ESTUDA;

SELECT  USUARIO.ID_USUARIO, 
		USUARIO.NOME, 
		USUARIO.EMAIL, 
		USUARIO.IDADE, 
		TRILHA.NOME AS TRILHA_QUE_ESTUDA
FROM USUARIO 
INNER JOIN ESTUDA
ON ID_USUARIO = FK_USUARIO_ID 
INNER JOIN TRILHA
ON ID_TRILHA = FK_TRILHA_ID;

SELECT AULA.TEMA, COUNT(AULA.TEMA) AS QUANTIDADE_DE_AULAS_POR_TEMA
FROM AULA 
GROUP BY AULA.TEMA;

SELECT AULA.TEMA, COUNT(AULA.TEMA) AS QUANTIDADE_DE_AULAS_POR_TEMA
FROM AULA 
GROUP BY AULA.TEMA
HAVING COUNT(AULA.TEMA) > 3;

INSERT INTO ESTUDA VALUES (5, 1);

DELETE FROM AULA
WHERE ID_AULA = 10;