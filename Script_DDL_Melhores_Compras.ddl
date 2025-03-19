-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2025-03-10 01:21:14 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE MC_BAIRRO 
    ( 
     CD_BAIRRO      NUMBER (8)  NOT NULL , 
     CD_CIDADE      NUMBER (8)  NOT NULL , 
     NM_BAIRRO      VARCHAR2 (45) , 
     NM_ZONA_BAIRRO VARCHAR2 (20) 
    ) 
;

COMMENT ON COLUMN MC_BAIRRO.CD_BAIRRO IS 'Esta coluna irá receber o codigo do bairro e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_BAIRRO.CD_CIDADE IS 'Esta coluna irá receber o codigo da cidade e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_BAIRRO.NM_BAIRRO IS 'Esta coluna ira receber o nome do Bairro. Esse conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_BAIRRO.NM_ZONA_BAIRRO IS 'Esta coluna irá receber a localização da zona onde se encontra o bairro. Alguns exemplos: Zona Norte, Zona Sul, Zona Leste, Zona Oeste, Centro.' 
;

ALTER TABLE MC_BAIRRO 
    ADD CONSTRAINT PK_MC_BAIRRO PRIMARY KEY ( CD_BAIRRO ) ;

ALTER TABLE MC_BAIRRO 
    ADD CONSTRAINT UN_CD_BAIRRO UNIQUE ( CD_BAIRRO ) ;

CREATE TABLE MC_CATEGORIA_PRODUTO 
    ( 
     CD_CATEGORIA NUMBER  NOT NULL , 
     DS_CATEGORIA VARCHAR2 (500)  NOT NULL , 
     TP_CATEGORIA CHAR (1)  NOT NULL , 
     DT_INICIO    DATE  NOT NULL , 
     DT_TERMINO   DATE , 
     ST_CATEGORIA CHAR (1)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_CATEGORIA_PRODUTO.CD_CATEGORIA IS 'Essa coluna irá armazenar a chave primária da tabela de categoria de produtos da Melhores Compras. Cada categoria nova cadastrada  será acionada a função IDENTITY que se encarregará de gerar o próximo número único da categoria.' 
;

COMMENT ON COLUMN MC_CATEGORIA_PRODUTO.DS_CATEGORIA IS 'Essa coluna irá armazenar descrição da categoria de produtos da Melhores Compras. Cada categoria tem uma  descrição única e serve para organizar os produtos em categorias simliares, melhorando a tomada de decisão.' 
;

COMMENT ON COLUMN MC_CATEGORIA_PRODUTO.TP_CATEGORIA IS 'Nessa  coluna  será  armazenada o tipo de categoria que poderá  ser (V)ídeo ou (P)roduto. Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CATEGORIA_PRODUTO.DT_INICIO IS 'Essa coluna irá receber  a data de início da categoria. Seu formato é dd/mm/yyyy e seu conteúdo deve ser sempre  obrigatório.' 
;

COMMENT ON COLUMN MC_CATEGORIA_PRODUTO.DT_TERMINO IS 'Essa coluna irá receber  a data de encerramento  da categoria. Seu formato é dd/mm/yyyy e seu conteúdo deve ser sempre  opcional. Conteúdo obrigatório significa que a categoria foi encerrada a partir da data término. Já o conteúdo opcional indica que a categoria está ativa e operante.' 
;

COMMENT ON COLUMN MC_CATEGORIA_PRODUTO.ST_CATEGORIA IS 'Essa coluna irá armazenar o stauts da categoria da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).' 
;

ALTER TABLE MC_CATEGORIA_PRODUTO 
    ADD CONSTRAINT CK_TP_CATEGORIA 
    CHECK ((TP_CATEGORIA IN ('V', 'P')
)
;


ALTER TABLE MC_CATEGORIA_PRODUTO 
    ADD CONSTRAINT CK_ST_CATEGORIA 
    CHECK ((ST_CATEGORIA IN ('A', 'I')
)
;
ALTER TABLE MC_CATEGORIA_PRODUTO 
    ADD CONSTRAINT PK_MC_CATEGORIA_PROD PRIMARY KEY ( CD_CATEGORIA ) ;

ALTER TABLE MC_CATEGORIA_PRODUTO 
    ADD CONSTRAINT UN_CD_CATEGORIA UNIQUE ( CD_CATEGORIA ) ;

ALTER TABLE MC_CATEGORIA_PRODUTO 
    ADD CONSTRAINT UN_DS_CATEGORIA UNIQUE ( DS_CATEGORIA ) ;

CREATE TABLE MC_CIDADE 
    ( 
     CD_CIDADE NUMBER (8)  NOT NULL , 
     SG_ESTADO CHAR (2)  NOT NULL , 
     NM_CIDADE VARCHAR2 (60)  NOT NULL , 
     CD_IBGE   NUMBER (8) , 
     NR_DDD    NUMBER (3) 
    ) 
;

COMMENT ON COLUMN MC_CIDADE.CD_CIDADE IS 'Esta coluna irá receber o codigo da cidade e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_CIDADE.SG_ESTADO IS 'Esta coluna ira receber a siga do Estado. Esse conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_CIDADE.NM_CIDADE IS 'Esta coluna ira receber o nome da Cidade. Esse conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_CIDADE.CD_IBGE IS 'Esta coluna irá receber o código do IBGE que fornece informações para geração da NFe.' 
;

COMMENT ON COLUMN MC_CIDADE.NR_DDD IS 'Esta coluna irá receber o número do DDD da cidade para ser utilizado no contato telefônico. Seu conteudo é opcional.' 
;

ALTER TABLE MC_CIDADE 
    ADD CONSTRAINT PK_MC_CIDADE PRIMARY KEY ( CD_CIDADE ) ;

ALTER TABLE MC_CIDADE 
    ADD CONSTRAINT UN_CD_CIDADE UNIQUE ( CD_CIDADE ) ;

CREATE TABLE MC_CLI_FISICA 
    ( 
     NR_CLIENTE        NUMBER (10)  NOT NULL , 
     NR_CPF            NUMBER (11)  NOT NULL , 
     DT_NASCIMENTO     DATE  NOT NULL , 
     FL_SEXO_BIOLOGICO CHAR (1)  NOT NULL , 
     DS_GENERO         VARCHAR2 (100) 
    ) 
;

COMMENT ON COLUMN MC_CLI_FISICA.NR_CLIENTE IS 'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da tabela NC_CLIENTE. ' 
;

COMMENT ON COLUMN MC_CLI_FISICA.NR_CPF IS 'Essa coluna irá armazenar o número do CPF do cliente na plataforma ecommerce da Melhores Compras. Seu conteúdo deve ser obrigatório e único.' 
;

COMMENT ON COLUMN MC_CLI_FISICA.DT_NASCIMENTO IS 'Essa coluna irá armazenar a data de nascimento do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.

Máscara de dados: DD/MM/YYYY' 
;

COMMENT ON COLUMN MC_CLI_FISICA.FL_SEXO_BIOLOGICO IS 'Essa coluna irá armazenar o sexo biológico do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório. Podendo ser preenchido apenas com os valores: (M) Masculino, (F) Feminino ou (H) Hemafrodita. Sempre em letras maiúsculas. ' 
;

COMMENT ON COLUMN MC_CLI_FISICA.DS_GENERO IS 'Genero de nascimento do Cliente. Seu conteúdo deve ser opcional.' 
;
CREATE UNIQUE INDEX IDX_MC_CLI_FISICA_ ON MC_CLI_FISICA 
    ( 
     NR_CLIENTE ASC 
    ) 
;

ALTER TABLE MC_CLI_FISICA 
    ADD CONSTRAINT CK_FL_SEXO_BIOLOGICO 
    CHECK ((ST_CLIENTE IN ('H', 'M','H'))
;
ALTER TABLE MC_CLI_FISICA 
    ADD CONSTRAINT PK_MC_CLI_FISICA PRIMARY KEY ( NR_CLIENTE ) ;

ALTER TABLE MC_CLI_FISICA 
    ADD CONSTRAINT UN_NR_CPF UNIQUE ( NR_CPF ) ;

CREATE TABLE MC_CLI_JURIDICA 
    ( 
     NR_CLIENTE   NUMBER (10)  NOT NULL , 
     NR_CNPJ      NUMBER (14) , 
     DT_FUNDACAO  DATE , 
     NR_INSCR_EST VARCHAR2 (15) 
    ) 
;

COMMENT ON COLUMN MC_CLI_JURIDICA.NR_CLIENTE IS 'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a partir da tabela NC_CLIENTE. ' 
;

COMMENT ON COLUMN MC_CLI_JURIDICA.NR_CNPJ IS 'Essa coluna irá armazenar o  numero do CNPJ do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório e único.' 
;

COMMENT ON COLUMN MC_CLI_JURIDICA.DT_FUNDACAO IS 'Essa coluna irá armazenar data  de fundação do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.

Máscara de dados: DD/MM/YYYY' 
;

COMMENT ON COLUMN MC_CLI_JURIDICA.NR_INSCR_EST IS 'Essa coluna irá armazenar o  numero da Inscrição Estadual  do cliente na plataforma ecommerce da Melhores Compras. Seu conteúdo deve ser opcional' 
;
CREATE UNIQUE INDEX IDX_MC_CLI_JURIDICA_ ON MC_CLI_JURIDICA 
    ( 
     NR_CLIENTE ASC 
    ) 
;

ALTER TABLE MC_CLI_JURIDICA 
    ADD CONSTRAINT PK_MC_CLI_JURIDICA PRIMARY KEY ( NR_CLIENTE ) ;

ALTER TABLE MC_CLI_JURIDICA 
    ADD CONSTRAINT UN_NR_CNPJ UNIQUE ( NR_CNPJ ) ;

CREATE TABLE MC_CLIENTE 
    ( 
     NR_CLIENTE      NUMBER (10)  NOT NULL , 
     NM_CLIENTE      VARCHAR2 (160)  NOT NULL , 
     NM_LOGIN        VARCHAR2 (50)  NOT NULL , 
     QT_ESTRELAS     NUMBER (1) , 
     VL_MEDIO_COMPRA NUMBER (10,2) , 
     ST_CLIENTE      CHAR (1)  NOT NULL , 
     DS_EMAIL        VARCHAR2 (100) , 
     NR_TELEFONE     VARCHAR2 (20) , 
     DS_SENHA        VARCHAR2 (50)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_CLIENTE.NR_CLIENTE IS 'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras. Seu conteúdo deve ser obrigatório, único e preenhcido a partir da IDENTITY ID_MC_NR_CLIENTE, a qual terá sempre o número disponivel para uso.' 
;

COMMENT ON COLUMN MC_CLIENTE.NM_CLIENTE IS 'Essa coluna irá armazenar o nome do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório e no formato InitCap.' 
;

COMMENT ON COLUMN MC_CLIENTE.NM_LOGIN IS 'Essa coluna irá armazenar o login de cada cliente na plataforma ecommerce da Melhores Compras. Seu conteúdo deve ser obrigatório e  único para cada cliente.' 
;

COMMENT ON COLUMN MC_CLIENTE.QT_ESTRELAS IS 'Essa coluna irá armazenar a quantiade de estrelas do cliente na plataforma ecommerce da Melhores Compras. Seu conteúdo deve ser obrigatório e ser possível de estar entre 1 e 5 estrelas.' 
;

COMMENT ON COLUMN MC_CLIENTE.VL_MEDIO_COMPRA IS 'Essa coluna irá armazenar o valor médio de gastos feito pelo cliente na plataforma ecommerce da Melhores Compras. Seu conteúdo deve ser obrigatório e deve ser calculado diariamente.' 
;

COMMENT ON COLUMN MC_CLIENTE.ST_CLIENTE IS 'Essa coluna irá armazenar o stauts do cliente da Melhores Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).' 
;

COMMENT ON COLUMN MC_CLIENTE.DS_EMAIL IS 'Essa coluna irá armazenar o email  do cliente da Melhorees Compras. No minimo é esperado um email contendo o caractere (@) em seu conteúdo.' 
;

COMMENT ON COLUMN MC_CLIENTE.NR_TELEFONE IS 'Essa coluna irá armazenar o número do cliente da Melhorees Compras. A mascara de armazenamento deve ser: (<nr_ddd>) 99999-9999 e  deve ser utilizada pré definida.' 
;

COMMENT ON COLUMN MC_CLIENTE.DS_SENHA IS 'Essa coluna irá armazenar a senha de cada cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.' 
;

ALTER TABLE MC_CLIENTE 
    ADD CONSTRAINT CK_ST_CLIENTE 
    CHECK ((ST_CLIENTE IN ('A', 'I')
)
;
ALTER TABLE MC_CLIENTE 
    ADD CONSTRAINT PK_MC_CLIENTE PRIMARY KEY ( NR_CLIENTE ) ;

ALTER TABLE MC_CLIENTE 
    ADD CONSTRAINT UK_MC_CLIENTE_NOME_CLIENTE UNIQUE ( NM_CLIENTE ) ;

ALTER TABLE MC_CLIENTE 
    ADD CONSTRAINT UN_MC_CLIENTE_NR_CLIENTE UNIQUE ( NR_CLIENTE ) ;

ALTER TABLE MC_CLIENTE 
    ADD CONSTRAINT UN_MC_CLIENTE_NR_LOGIN UNIQUE ( NM_LOGIN ) ;

CREATE TABLE MC_DEPTO 
    ( 
     CD_DEPTO NUMBER (3)  NOT NULL , 
     NM_DEPTO VARCHAR2 (100)  NOT NULL , 
     ST_DEPTO CHAR (1)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_DEPTO.CD_DEPTO IS 'Esta coluna irá receber o codigo do departamento  e seu conteúdo é obrigatório. E será gerado através de uma IDENTITY ID_MC_CD_DEPTO' 
;

COMMENT ON COLUMN MC_DEPTO.NM_DEPTO IS 'Esta coluna irá receber o nome do  departamento  e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_DEPTO.ST_DEPTO IS 'Esta coluna irá receber o status do  departamento  e seu conteúdo é obrigatório. Os valores possíveis são: (A)tivo e (I)nativo.' 
;

ALTER TABLE MC_DEPTO 
    ADD CONSTRAINT CK_ST_DEPTO 
    CHECK ((ST_DEPTO IN ('A', 'I'))
;
ALTER TABLE MC_DEPTO 
    ADD CONSTRAINT PK_MC_DEPTO PRIMARY KEY ( CD_DEPTO ) ;

ALTER TABLE MC_DEPTO 
    ADD CONSTRAINT UN_CD_DEPTO UNIQUE ( CD_DEPTO ) ;

ALTER TABLE MC_DEPTO 
    ADD CONSTRAINT UN_NM_DEPTO UNIQUE ( NM_DEPTO ) ;

CREATE TABLE MC_END_CLI 
    ( 
     NR_CLIENTE         NUMBER (10)  NOT NULL , 
     CD_LOGRADOURO_CLI  NUMBER (10)  NOT NULL , 
     NR_END             NUMBER (8)  NOT NULL , 
     DS_COMPLEMENTO_END VARCHAR2 (80) , 
     DT_INICIO          DATE , 
     DT_TERMINO         DATE , 
     ST_END             CHAR (1) 
    ) 
;

COMMENT ON COLUMN MC_END_CLI.NR_CLIENTE IS 'Esta coluna irá receber o número do cliente e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_END_CLI.CD_LOGRADOURO_CLI IS 'Esta coluna irá receber o código do logradouro  do cliente e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_END_CLI.NR_END IS 'Número do Endereço do Cliente. O número da Rua/Localidade onde o cliente está associado.' 
;

COMMENT ON COLUMN MC_END_CLI.DS_COMPLEMENTO_END IS 'Esta coluna irá receber o complemento do endereço do cliente e seu conteúdo pode ser opcional.' 
;

COMMENT ON COLUMN MC_END_CLI.DT_INICIO IS 'Data de início do endereço associado ao cliente.' 
;

COMMENT ON COLUMN MC_END_CLI.DT_TERMINO IS 'Data de término do endereço associado ao cliente.' 
;

COMMENT ON COLUMN MC_END_CLI.ST_END IS 'Status do endereço. (A)itvo ou (I)nativo.' 
;

ALTER TABLE MC_END_CLI 
    ADD CONSTRAINT CK_ST_END 
    CHECK ((ST_END IN ('A', 'I')
)
;
ALTER TABLE MC_END_CLI 
    ADD CONSTRAINT MC_END_CLI_PK PRIMARY KEY ( NR_CLIENTE ) ;

CREATE TABLE MC_END_FUNC 
    ( 
     CD_FUNCIONARIO     NUMBER (10)  NOT NULL , 
     CD_LOGRADOURO      NUMBER (10)  NOT NULL , 
     NR_END             NUMBER (8)  NOT NULL , 
     DS_COMPLEMENTO_END VARCHAR2 (80) , 
     DT_INICIO          DATE  NOT NULL , 
     DT_TERMINO         DATE , 
     ST_END             CHAR (1)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_END_FUNC.NR_END IS 'Número do Endereço do funcionário. O número da Rua/Localidade onde o funcionário está associado.' 
;

COMMENT ON COLUMN MC_END_FUNC.DT_INICIO IS 'Data de início do endereço associado ao funcionário.' 
;

COMMENT ON COLUMN MC_END_FUNC.DT_TERMINO IS 'Data de término do endereço associado ao funcionário.' 
;

COMMENT ON COLUMN MC_END_FUNC.ST_END IS 'Pode ser ativo (A) ou inativo (I).' 
;

ALTER TABLE MC_END_FUNC 
    ADD CONSTRAINT CK_ST_END 
    CHECK ((ST_END IN ('A', 'I'))
;
ALTER TABLE MC_END_FUNC 
    ADD CONSTRAINT PK_MC_END_FUNC PRIMARY KEY ( CD_FUNCIONARIO ) ;

CREATE TABLE MC_ESTADO 
    ( 
     SG_ESTADO CHAR (2)  NOT NULL , 
     NM_ESTADO VARCHAR2 (30)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_ESTADO.SG_ESTADO IS 'Esta coluna ira receber a siga do Estado. Esse conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_ESTADO.NM_ESTADO IS 'Esta coluna irá receber o nome do estado' 
;

ALTER TABLE MC_ESTADO 
    ADD CONSTRAINT PK_MC_ESTADO PRIMARY KEY ( SG_ESTADO ) ;

ALTER TABLE MC_ESTADO 
    ADD CONSTRAINT UN_SG_ESTADO UNIQUE ( SG_ESTADO ) ;

ALTER TABLE MC_ESTADO 
    ADD CONSTRAINT UN_NM_ESTADO UNIQUE ( NM_ESTADO ) ;

CREATE TABLE MC_FUNCIONARIO 
    ( 
     CD_FUNCIONARIO     NUMBER (10)  NOT NULL , 
     CD_DEPTO           NUMBER (3)  NOT NULL , 
     CD_GERENTE         NUMBER (10) , 
     NM_CPF_FUNCIONARIO NUMBER (11)  NOT NULL , 
     NM_FUNCIONARIO     VARCHAR2 (160)  NOT NULL , 
     DT_NASCIMENTO      DATE  NOT NULL , 
     FL_SEXO_BIOLOGICO  CHAR (1)  NOT NULL , 
     DS_GENERO          VARCHAR2 (100) , 
     DS_CARGO           VARCHAR2 (80)  NOT NULL , 
     VL_SALARIO         NUMBER (10,2) , 
     DS_EMAIL           VARCHAR2 (80)  NOT NULL , 
     ST_FUNC            CHAR (1)  NOT NULL , 
     DT_CADASTRAMENTO   DATE  NOT NULL , 
     DT_DESLIGAMENTO    DATE , 
     NM_TEL_FUNCIONARIO VARCHAR2 (20)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_FUNCIONARIO.CD_FUNCIONARIO IS 'Esta coluna irá receber o codigo do funcionário e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.CD_DEPTO IS 'Esta coluna irá receber o codigo do departamento onde o funcionario trabalha  e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.CD_GERENTE IS 'Esta coluna irá receber o codigo do gestor do funcionario trabalha  e seu conteúdo é opcional.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.NM_CPF_FUNCIONARIO IS 'Deve ser preenchido com o CPF do funcionário, que deve ser único. 
Deve ser criada uma constraint do tipo UNIQUE.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.NM_FUNCIONARIO IS 'Esta coluna irá receber o nome do funcionário e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DT_NASCIMENTO IS 'Esta coluna irá receber a data de nascimento  do funcionário e seu conteúdo é obrigatório. Deve ser armazenado no formato: DD/MM/YYYY.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.FL_SEXO_BIOLOGICO IS 'Esta coluna irá receber o sexo biológico do funcionário e seu conteúdo é obrigatório.Os valores permitidos aqui seriam: (F)eminino; (M)asculino ou (Hermafrodita)' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DS_GENERO IS 'Esta coluna irá receber o genero atribuido ao funcionário e seu conteúdo é opcional.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DS_CARGO IS 'Esta coluna irá receber o cargo do funcionário e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.VL_SALARIO IS 'Esta coluna irá receber o valor do salário do funcionário e seu conteúdo é opcional.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DS_EMAIL IS 'Esta coluna irá receber o email do funcionário e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.ST_FUNC IS 'Essa coluna irá armazenar o stauts do funcionário da Melhores Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DT_CADASTRAMENTO IS 'Data de cadastramento do Funcionario' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DT_DESLIGAMENTO IS 'Data de desligamento  do Funcionario. Seu conteúdo é opcional.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.NM_TEL_FUNCIONARIO IS 'Essa coluna irá armazenar o número do funcionário da Melhorees Compras. A mascara de armazenamento deve ser: (<nr_ddd>) 99999-9999 e  deve ser utilizada pré definida.' 
;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT CK_FL_SEXO_BIOLOGICO 
    CHECK ((FL_SEXO_BIOLOGICO IN ('F', 'M', 'H')
)
;


ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT CK_ST_FUNC 
    CHECK ((ST_FUNC IN ('A', 'I'))
;
ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT PK_MC_FUNCIONARIO PRIMARY KEY ( CD_FUNCIONARIO ) ;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT UN_CD_FUNCIONARIO UNIQUE ( CD_FUNCIONARIO ) ;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT UN_CPF_FUNCIONARIO UNIQUE ( NM_CPF_FUNCIONARIO ) ;

CREATE TABLE MC_LOGRADOURO 
    ( 
     CD_LOGRADOURO NUMBER (10)  NOT NULL , 
     CD_BAIRRO     NUMBER (8)  NOT NULL , 
     NM_LOGRADOURO VARCHAR2 (160)  NOT NULL , 
     NR_CEP        NUMBER (8) 
    ) 
;

COMMENT ON COLUMN MC_LOGRADOURO.CD_LOGRADOURO IS 'Esta coluna irá receber o código do logradouro e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_LOGRADOURO.CD_BAIRRO IS 'Esta coluna irá receber o codigo do bairro e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_LOGRADOURO.NM_LOGRADOURO IS 'Esta coluna irá receber o nome do logradouro e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_LOGRADOURO.NR_CEP IS 'Esta coluna irá receber o numero do CEP do Logradouro e seu conteúdo é obrigatório.' 
;

ALTER TABLE MC_LOGRADOURO 
    ADD CONSTRAINT PK_MC_LOGRADOURO PRIMARY KEY ( CD_LOGRADOURO ) ;

ALTER TABLE MC_LOGRADOURO 
    ADD CONSTRAINT UN_CD_LOGRADOURO UNIQUE ( CD_LOGRADOURO ) ;

CREATE TABLE MC_PRODUTO 
    ( 
     CD_PRODUTO        NUMBER (10)  NOT NULL , 
     CD_CATEGORIA      NUMBER  NOT NULL , 
     DS_PRODUTO        VARCHAR2 (80)  NOT NULL , 
     NR_CD_BARRAS_PROD VARCHAR2 (50) , 
     VL_UNITARIO       NUMBER (8,2)  NOT NULL , 
     TP_EMBALAGEM      VARCHAR2 (15) , 
     ST_PRODUTO        CHAR (1)  NOT NULL , 
     VL_PERC_LUCRO     NUMBER (8,2) , 
     DS_COMPLETA_PROD  VARCHAR2 (4000)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_PRODUTO.CD_PRODUTO IS 'Essa coluna irá armazenar a chave primária da tabela de produtos da Melhores Compras. A cada produto cadastrado será acionada a IDENTITY ID_MC_PRODUTO que se encarregará de gerar o próximo número único do produto.' 
;

COMMENT ON COLUMN MC_PRODUTO.CD_CATEGORIA IS 'Essa coluna irá armazenar a chave primária da tabela de categoria de produtos da Melhorees Compras. Cada categoria nova cadastrada  será acionada a IDENTITY  ID_MC_CATEGORIA que se encarregará de gerar o próximo número único da categoria..' 
;

COMMENT ON COLUMN MC_PRODUTO.DS_PRODUTO IS 'Essa coluna irá armazenar a descrição principal do produto. Seu conteúdo deve ser  obrigatorio e único.' 
;

COMMENT ON COLUMN MC_PRODUTO.NR_CD_BARRAS_PROD IS 'Essa coluna irá armazenar o número do codigo de barras  do produto. Seu conteúdo deve ser opcional.' 
;

COMMENT ON COLUMN MC_PRODUTO.VL_UNITARIO IS 'Essa coluna irá armazenar o valor unitário do produto. Seu conteúdo deve ser > 0 ' 
;

COMMENT ON COLUMN MC_PRODUTO.TP_EMBALAGEM IS 'Essa coluna irá armazenar o tipo de embalagem do produto. Seu conteúdo pode ser opcional.' 
;

COMMENT ON COLUMN MC_PRODUTO.ST_PRODUTO IS 'Essa coluna irá armazenar o stauts do produto da Melhores Compras. Os valores permitidos aqui são: A(tivo), I(nativo) ou P(rospecção).' 
;

COMMENT ON COLUMN MC_PRODUTO.VL_PERC_LUCRO IS 'Essa coluna irá armazenar o percentual  do lucro médio para cada produto. Seu conteúdo deve ser opcional.' 
;

COMMENT ON COLUMN MC_PRODUTO.DS_COMPLETA_PROD IS 'Essa coluna irá armazenar a descrição completa do produto. Seu conteúdo deve ser  obrigatorio.' 
;

ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT CK_VL_UNITARIO 
    CHECK (VL_UNITARIO>0)
;


ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT CK_ST_PRODUTO 
    CHECK ((ST_PRODUTO IN ('A', 'I', 'P')
)
;
ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT PK_MC_PRODUTO PRIMARY KEY ( CD_PRODUTO ) ;

ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT UN_DS_PRODUTO UNIQUE ( DS_PRODUTO ) ;

CREATE TABLE MC_SGV_CATEGORIA_VIDEO 
    ( 
     CD_CATEGORIA_VID NUMBER (10)  NOT NULL , 
     DS_CATEGORIA_VID VARCHAR2 (160)  NOT NULL , 
     ST_CATEGORIA_VID CHAR (1)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_SGV_CATEGORIA_VIDEO.CD_CATEGORIA_VID IS 'Chave primária e única, cada vídeo deve estar associado a uma categoria que por sua vez terá um código único associado a ela. Deve ser gerado através de uma IDENTITY.' 
;

COMMENT ON COLUMN MC_SGV_CATEGORIA_VIDEO.DS_CATEGORIA_VID IS 'Deve ser preenchida obrigatoriamente com o tipo de vídeo (ex: Vídeo de instalação de produto, uso no cotidiano, comercial com personalidade, etc.). Único e obrigátorio.' 
;

COMMENT ON COLUMN MC_SGV_CATEGORIA_VIDEO.ST_CATEGORIA_VID IS 'Classifica se é uma categoria ativa ou inativa, só pode ser preenchida com A = ativa ou I = inativa. Somente as categorias ativas são exibidas na plataforma para serem visualizadas.' 
;

ALTER TABLE MC_SGV_CATEGORIA_VIDEO 
    ADD CONSTRAINT CK_MC_SGV_ST_CAT_VID 
    CHECK ((ST_CATEGORIA_VID IN ('A', 'I'))
;
ALTER TABLE MC_SGV_CATEGORIA_VIDEO 
    ADD CONSTRAINT PK_MC_SGV_CAT_VIDEO PRIMARY KEY ( CD_CATEGORIA_VID ) ;

ALTER TABLE MC_SGV_CATEGORIA_VIDEO 
    ADD CONSTRAINT UN_MC_SGV_DS_CAT_VID UNIQUE ( DS_CATEGORIA_VID ) ;

CREATE TABLE MC_SGV_SAC 
    ( 
     NR_SAC                   NUMBER (10)  NOT NULL , 
     NR_CLIENTE               NUMBER (10)  NOT NULL , 
     CD_FUNCIONARIO           NUMBER (10)  NOT NULL , 
     CD_PRODUTO               NUMBER (10)  NOT NULL , 
     TP_SAC                   CHAR (1)  NOT NULL , 
     DS_DETALHADA_SAC         VARCHAR2 (4000)  NOT NULL , 
     DT_ABERTURA_SAC          DATE  NOT NULL , 
     HR_ABERTURA_SAC          NUMBER (2)  NOT NULL , 
     DT_ATENDIMENTO_SAC       DATE , 
     HR_ATENDIMENTO_SAC       NUMBER (2) , 
     NR_TEMPO_TOTAL_SAC       NUMBER (10)  NOT NULL , 
     DS_DETALHADA_RETORNO_SAC CLOB , 
     ST_SAC                   CHAR (1)  NOT NULL , 
     NR_INDICE_SATISFACAO     NUMBER (2) 
    ) 
;

COMMENT ON COLUMN MC_SGV_SAC.NR_SAC IS 'Essa coluna irá armazenar a chave primária da tabela de SAC de vídeo  da Melhorees Compras. A cada SAC cadastrado pelo cliente será acionada a IDENTITY  SQ_MC_SGV_SAC que se encarregará de gerar o próximo número único do chamado SAC feito pelo Cliente.' 
;

COMMENT ON COLUMN MC_SGV_SAC.NR_CLIENTE IS 'O SAC está diretamente ligado ao cliente, pois é o cliente quem abre um chamado, um chamado pertence a um único cliente, porém um cliente pode ter vários chamados.' 
;

COMMENT ON COLUMN MC_SGV_SAC.CD_FUNCIONARIO IS 'O atendimento deve ser realizado por um funcionário da melhores compras, portanto o preenchimento do código do funcionário é obrigatório.' 
;

COMMENT ON COLUMN MC_SGV_SAC.CD_PRODUTO IS 'Seguindo a regra de negócio RN19 devemos associar todo chamado a um produto, portanto se torna obrigatório o preenchimento desse dado.' 
;

COMMENT ON COLUMN MC_SGV_SAC.TP_SAC IS 'Essa coluna  irá  receber o TIPO  do chamado SAC aberto pelo cliente.  Seu conteúdo deve ser  obrigatório e os possíveis valores são: (1) Sugestão, (2) Reclamação ou (3) Dúvida.' 
;

COMMENT ON COLUMN MC_SGV_SAC.DS_DETALHADA_SAC IS 'Essa coluna  irá  receber a descrição completa do SAC aberto pelo cliente. Seu conteudo deve ser obrigatório e conter no máximo 4.000 caracteres.' 
;

COMMENT ON COLUMN MC_SGV_SAC.DT_ABERTURA_SAC IS 'Essa coluna  irá  receber a data e horário do SAC aberto pelo cliente. Seu conteudo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_SGV_SAC.HR_ABERTURA_SAC IS 'Essa coluna  irá  receber a hora do SAC aberto pelo cliente. Seu conteudo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_SGV_SAC.DT_ATENDIMENTO_SAC IS 'Essa coluna  irá  receber a data e horário do atendmiento SAC feita pelo funcionário da Melhores Compras. Seu conteudo deve ser opcional..' 
;

COMMENT ON COLUMN MC_SGV_SAC.HR_ATENDIMENTO_SAC IS 'Essa coluna  irá  receber a hora do SAC do atendimento  feito  pelo funcionario da Melhores Compras. Seu conteudo deve ser opcional.' 
;

COMMENT ON COLUMN MC_SGV_SAC.NR_TEMPO_TOTAL_SAC IS 'Essa coluna  irá  receber o tempo total em horas  (HH24) computado desde a abertura até a conclusão dele. A unidade de medida é horas, ou seja, em quantas horas o chamado foi concluído desde a sua abertura.' 
;

COMMENT ON COLUMN MC_SGV_SAC.DS_DETALHADA_RETORNO_SAC IS 'Essa coluna  irá  receber a descrição detalhada do retorno feito pelo funcionário a partir da solicitação do cliente. Seu conteúdo deve ser opcional e preenchido pelo funcionário.' 
;

COMMENT ON COLUMN MC_SGV_SAC.ST_SAC IS 'Essa coluna  irá  receber o STATUS  do chamado SAC aberto pelo cliente.  Seu conteúdo deve ser  obrigatório e os possíveis valores são: (E)m Atendimento; (C)ancelado; (F)echado ou (X)Fechado com Insatisfação do cliente.' 
;

COMMENT ON COLUMN MC_SGV_SAC.NR_INDICE_SATISFACAO IS 'Essa coluna  irá  receber o índice de satisfação, , computado como um valor simples de 1 a 10, onde 1 refere-se ao cliente menos satisfeito e 10 o cliente mais satisfeito. Esse índice de satisfação é opcional e informado pelo cliente ao final do atendimento.' 
;

ALTER TABLE MC_SGV_SAC 
    ADD CONSTRAINT CK_TP_SAC 
    CHECK ((TP_SAC IN ('1', '2','3')
)
;


ALTER TABLE MC_SGV_SAC 
    ADD CONSTRAINT CK_ST_SAC 
    CHECK ((ST_SAC IN ('E', 'C','F','X')
)
;


ALTER TABLE MC_SGV_SAC 
    ADD CONSTRAINT CK_NR_INDICE_SATISFACAO 
    CHECK ((NR_INDICE_SATISFACAO IN ('1', '2','3','4','5','6','7','8','9','10')
)
;
ALTER TABLE MC_SGV_SAC 
    ADD CONSTRAINT PK_MC_SGV_SAC PRIMARY KEY ( NR_SAC ) ;

CREATE TABLE MC_SGV_VIDEO_DO_PROD 
    ( 
     CD_PRODUTO       NUMBER (10)  NOT NULL , 
     CD_CATEGORIA_VID NUMBER (10)  NOT NULL , 
     ST_VIDEO         CHAR (1)  NOT NULL , 
     DT_CADASTRO      DATE  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_SGV_VIDEO_DO_PROD.CD_PRODUTO IS 'chave estrangeira (FK) referenciando CD_PRODUTO da tabela MC_PRODUTO. Campo obrigatório pois todo vídeo deve pertencer a um produto específico.' 
;

COMMENT ON COLUMN MC_SGV_VIDEO_DO_PROD.CD_CATEGORIA_VID IS 'Chave estrangeira referênciando o relacionamento com a entidade MC_SGV_CATEGORIA_VIDEO. Todos os vídeos devem pertencer a uma categória, que por sua vez possui um código único associado a mesma.' 
;

COMMENT ON COLUMN MC_SGV_VIDEO_DO_PROD.ST_VIDEO IS 'O atributo STATUS aceita apenas os valores ''A'' (Ativo) ou ''I'' (Inativo).
Vídeos que estão inativos não podem ser visualizados. Armazenado como um único caractere sempre em maiúsculas. 

Máscara de dados: A ou I.' 
;

COMMENT ON COLUMN MC_SGV_VIDEO_DO_PROD.DT_CADASTRO IS 'Data de cadastro do vídeo, indicando quando o vídeo foi registrado no sistema.
O campo DT_CADASTRO será preenchido automaticamente com a data e hora em que o vídeo foi cadastrado.

Formato: DD/MM/YYYY.' 
;

ALTER TABLE MC_SGV_VIDEO_DO_PROD 
    ADD CONSTRAINT CK_ST_VIDEO 
    CHECK ((ST_VIDEO IN ('A', 'I'))
;
ALTER TABLE MC_SGV_VIDEO_DO_PROD 
    ADD CONSTRAINT PK_MC_SGV_VIDEO_DO_PRODUTO PRIMARY KEY ( CD_PRODUTO ) ;

CREATE TABLE MC_SGV_VISU_DO_VIDEO 
    ( 
     CD_VISUALIZAÇÃO    NUMBER (10)  NOT NULL , 
     CD_PRODUTO         NUMBER (10)  NOT NULL , 
     NR_CLIENTE         NUMBER (10)  NOT NULL , 
     DT_HR_VISUALIZACAO TIMESTAMP  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_SGV_VISU_DO_VIDEO.CD_VISUALIZAÇÃO IS 'Identificador único da visualização de um vídeo na plataforma. Deve ser único e não nulo.

Importante: O CD_VISUALIZACAO será gerado automaticamente como um número sequencial crescente. Será  implementado no modelo físico usando uma IDENTITY.
' 
;

COMMENT ON COLUMN MC_SGV_VISU_DO_VIDEO.CD_PRODUTO IS 'Todo vídeo possui uma associação com um produto específico, portanto serve de referência (FK) a qual produto o vídeo se refere.' 
;

COMMENT ON COLUMN MC_SGV_VISU_DO_VIDEO.NR_CLIENTE IS 'Necessário para indicar qual cliente (logado) realizou a visualização do vídeo em questão, para armazenar essa informação. Caso seja um usuário anônimo, não é necessário armazenar informação. A obrigatoriedade dessa informação resolve isso.
' 
;

COMMENT ON COLUMN MC_SGV_VISU_DO_VIDEO.DT_HR_VISUALIZACAO IS 'Preencher com timestamp da visita feita pelo internauta.

No formato: DD-MM-YYYY, HH:MM:SS.' 
;

ALTER TABLE MC_SGV_VISU_DO_VIDEO 
    ADD CONSTRAINT PK_MC_SGV_VISU_DO_VIDEO PRIMARY KEY ( CD_VISUALIZAÇÃO ) ;

ALTER TABLE MC_SGV_SAC 
    ADD CONSTRAINT ABRE FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE
    ) 
;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT ALOCA FOREIGN KEY 
    ( 
     CD_DEPTO
    ) 
    REFERENCES MC_DEPTO 
    ( 
     CD_DEPTO
    ) 
;

ALTER TABLE MC_SGV_SAC 
    ADD CONSTRAINT ASSOCIA FOREIGN KEY 
    ( 
     CD_PRODUTO
    ) 
    REFERENCES MC_PRODUTO 
    ( 
     CD_PRODUTO
    ) 
;

ALTER TABLE MC_SGV_SAC 
    ADD CONSTRAINT ATENDE FOREIGN KEY 
    ( 
     CD_FUNCIONARIO
    ) 
    REFERENCES MC_FUNCIONARIO 
    ( 
     CD_FUNCIONARIO
    ) 
;

ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT CATEGORIZA FOREIGN KEY 
    ( 
     CD_CATEGORIA
    ) 
    REFERENCES MC_CATEGORIA_PRODUTO 
    ( 
     CD_CATEGORIA
    ) 
;

ALTER TABLE MC_SGV_VIDEO_DO_PROD 
    ADD CONSTRAINT CLASSIFICA FOREIGN KEY 
    ( 
     CD_CATEGORIA_VID
    ) 
    REFERENCES MC_SGV_CATEGORIA_VIDEO 
    ( 
     CD_CATEGORIA_VID
    ) 
;

ALTER TABLE MC_BAIRRO 
    ADD CONSTRAINT COMPLEMENTA FOREIGN KEY 
    ( 
     CD_CIDADE
    ) 
    REFERENCES MC_CIDADE 
    ( 
     CD_CIDADE
    ) 
;

ALTER TABLE MC_END_CLI 
    ADD CONSTRAINT CONCERNE FOREIGN KEY 
    ( 
     CD_LOGRADOURO_CLI
    ) 
    REFERENCES MC_LOGRADOURO 
    ( 
     CD_LOGRADOURO
    ) 
;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT COORDENA FOREIGN KEY 
    ( 
     CD_GERENTE
    ) 
    REFERENCES MC_FUNCIONARIO 
    ( 
     CD_FUNCIONARIO
    ) 
;

ALTER TABLE MC_SGV_VISU_DO_VIDEO 
    ADD CONSTRAINT EFETUA FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE
    ) 
;

ALTER TABLE MC_END_FUNC 
    ADD CONSTRAINT FUNC_MORA FOREIGN KEY 
    ( 
     CD_FUNCIONARIO
    ) 
    REFERENCES MC_FUNCIONARIO 
    ( 
     CD_FUNCIONARIO
    ) 
;

ALTER TABLE MC_CLI_FISICA 
    ADD CONSTRAINT HERDA_FIS FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE
    ) 
;

ALTER TABLE MC_CLI_JURIDICA 
    ADD CONSTRAINT HERDA_JUR FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE
    ) 
;

ALTER TABLE MC_END_CLI 
    ADD CONSTRAINT MORA FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE
    ) 
;

ALTER TABLE MC_SGV_VIDEO_DO_PROD 
    ADD CONSTRAINT POSSUI FOREIGN KEY 
    ( 
     CD_PRODUTO
    ) 
    REFERENCES MC_PRODUTO 
    ( 
     CD_PRODUTO
    ) 
;

ALTER TABLE MC_LOGRADOURO 
    ADD CONSTRAINT REFERE FOREIGN KEY 
    ( 
     CD_BAIRRO
    ) 
    REFERENCES MC_BAIRRO 
    ( 
     CD_BAIRRO
    ) 
;

ALTER TABLE MC_SGV_VISU_DO_VIDEO 
    ADD CONSTRAINT REGISTRA FOREIGN KEY 
    ( 
     CD_PRODUTO
    ) 
    REFERENCES MC_SGV_VIDEO_DO_PROD 
    ( 
     CD_PRODUTO
    ) 
;

ALTER TABLE MC_END_FUNC 
    ADD CONSTRAINT REMETE FOREIGN KEY 
    ( 
     CD_LOGRADOURO
    ) 
    REFERENCES MC_LOGRADOURO 
    ( 
     CD_LOGRADOURO
    ) 
;

ALTER TABLE MC_CIDADE 
    ADD CONSTRAINT VINCULA FOREIGN KEY 
    ( 
     SG_ESTADO
    ) 
    REFERENCES MC_ESTADO 
    ( 
     SG_ESTADO
    ) 
;

CREATE SEQUENCE ID_CD_CATEGORIA 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER MC_CATEGORIA_PRODUTO_CD_CATEGO 
BEFORE INSERT ON MC_CATEGORIA_PRODUTO 
FOR EACH ROW 
WHEN (NEW.CD_CATEGORIA IS NULL) 
BEGIN 
    :NEW.CD_CATEGORIA := ID_CD_CATEGORIA.NEXTVAL; 
END;
/

CREATE SEQUENCE ID_NR_CLIENTE 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER MC_CLIENTE_NR_CLIENTE_TRG 
BEFORE INSERT ON MC_CLIENTE 
FOR EACH ROW 
WHEN (NEW.NR_CLIENTE IS NULL) 
BEGIN 
    :NEW.NR_CLIENTE := ID_NR_CLIENTE.NEXTVAL; 
END;
/

CREATE SEQUENCE ID_CD_DEPTO 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER MC_DEPTO_CD_DEPTO_TRG 
BEFORE INSERT ON MC_DEPTO 
FOR EACH ROW 
WHEN (NEW.CD_DEPTO IS NULL) 
BEGIN 
    :NEW.CD_DEPTO := ID_CD_DEPTO.NEXTVAL; 
END;
/

CREATE SEQUENCE ID_CD_FUNCIONARIO 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER MC_END_FUNC_CD_FUNCIONARIO_TRG 
BEFORE INSERT ON MC_END_FUNC 
FOR EACH ROW 
WHEN (NEW.CD_FUNCIONARIO IS NULL) 
BEGIN 
    :NEW.CD_FUNCIONARIO := ID_CD_FUNCIONARIO.NEXTVAL; 
END;
/

CREATE SEQUENCE ID_CD_PRODUTO 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER MC_PRODUTO_CD_PRODUTO_TRG 
BEFORE INSERT ON MC_PRODUTO 
FOR EACH ROW 
WHEN (NEW.CD_PRODUTO IS NULL) 
BEGIN 
    :NEW.CD_PRODUTO := ID_CD_PRODUTO.NEXTVAL; 
END;
/

CREATE SEQUENCE ID_CD_CAT_VID 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER MC_SGV_CATEGORIA_VIDEO_CD_CATE 
BEFORE INSERT ON MC_SGV_CATEGORIA_VIDEO 
FOR EACH ROW 
WHEN (NEW.CD_CATEGORIA_VID IS NULL) 
BEGIN 
    :NEW.CD_CATEGORIA_VID := ID_CD_CAT_VID.NEXTVAL; 
END;
/

CREATE SEQUENCE ID_NR_SAC 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER MC_SGV_SAC_NR_SAC_TRG 
BEFORE INSERT ON MC_SGV_SAC 
FOR EACH ROW 
WHEN (NEW.NR_SAC IS NULL) 
BEGIN 
    :NEW.NR_SAC := ID_NR_SAC.NEXTVAL; 
END;
/

CREATE SEQUENCE ID_CD_VISUALIZACAO 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER MC_SGV_VISU_DO_VIDEO_CD_VISUAL 
BEFORE INSERT ON MC_SGV_VISU_DO_VIDEO 
FOR EACH ROW 
WHEN (NEW.CD_VISUALIZAÇÃO IS NULL) 
BEGIN 
    :NEW.CD_VISUALIZAÇÃO := ID_CD_VISUALIZACAO.NEXTVAL; 
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            17
-- CREATE INDEX                             2
-- ALTER TABLE                             70
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           8
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          8
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
