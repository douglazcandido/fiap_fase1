DROP TABLE IF EXISTS 17;
DROP TABLE IF EXISTS MC_SGV_VISU_VID;
DROP TABLE IF EXISTS MC_SGV_VID_PROD;
DROP TABLE IF EXISTS MC_SGV_SAC;
DROP TABLE IF EXISTS MC_SGV_CAT_VIDEO;
DROP TABLE IF EXISTS MC_PRODUTO;
DROP TABLE IF EXISTS MC_LOGRADOURO;
DROP TABLE IF EXISTS MC_FUNCIONARIO;
DROP TABLE IF EXISTS MC_ESTADO;
DROP TABLE IF EXISTS MC_END_FUNC;
DROP TABLE IF EXISTS MC_END_CLI;
DROP TABLE IF EXISTS MC_DEPTO;
DROP TABLE IF EXISTS MC_CLIENTE;
DROP TABLE IF EXISTS MC_CLI_JURIDICA;
DROP TABLE IF EXISTS MC_CLI_FISICA;
DROP TABLE IF EXISTS MC_CIDADE;
DROP TABLE IF EXISTS MC_CATEGORIA_PROD;
DROP TABLE IF EXISTS MC_BAIRRO;

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

CREATE TABLE MC_CATEGORIA_PROD 
    ( 
     CD_CATEGORIA NUMBER (10)  NOT NULL , 
     DS_CATEGORIA VARCHAR2 (500)  NOT NULL , 
     TP_CATEGORIA CHAR (1)  NOT NULL , 
     DT_INICIO    DATE  NOT NULL , 
     DT_TERMINO   DATE , 
     ST_CATEGORIA CHAR (1)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_CATEGORIA_PROD.CD_CATEGORIA IS 'Essa coluna irá armazenar a chave primária da tabela de categoria de produtos da Melhorees Compras. Cada categoria nova cadastrada  será acionada a Sequence  SQ_MC_CATEGORIA que se encarregará de gerar o próximo número único da categoria..' 
;

COMMENT ON COLUMN MC_CATEGORIA_PROD.DS_CATEGORIA IS 'Essa coluna irá armazenar descrição da categoria de produtos da Melhorees Compras. Cada categoria tem uma  descrição única e serve para organizar os produtos em categorias simliares, melhorando a tomada de decisão.' 
;

COMMENT ON COLUMN MC_CATEGORIA_PROD.TP_CATEGORIA IS 'Nessa  coluna  será  armazenada o tipo de categoria que poderá  ser (V)ídeo ou (P)rodudto. Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CATEGORIA_PROD.DT_INICIO IS 'Essa coluna irá receber  a data de início da categoria. Seu formato é dd/mm/yyyy e seu conteúdo deve ser sempre  obrigatório.' 
;

COMMENT ON COLUMN MC_CATEGORIA_PROD.DT_TERMINO IS 'Essa coluna irá receber  a data de encerramento  da categoria. Seu formato é dd/mm/yyyy e seu conteúdo deve ser sempre  opcional. Conteúdo obrigatório significa que a categoria foi encerrada a partir da data término. Já o conteúdo opcional indica que a categoria está ativa e operante.' 
;

COMMENT ON COLUMN MC_CATEGORIA_PROD.ST_CATEGORIA IS 'Essa coluna irá armazenar o stauts da categoria da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).' 
;

ALTER TABLE MC_CATEGORIA_PROD 
    ADD CONSTRAINT PK_MC_CATEGORIA_PROD PRIMARY KEY ( CD_CATEGORIA ) ;

ALTER TABLE MC_CATEGORIA_PROD 
    ADD CONSTRAINT UN_DS_CAT_PROD UNIQUE ( DS_CATEGORIA ) ;

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
    ADD CONSTRAINT MC_CIDADE_PK PRIMARY KEY ( CD_CIDADE ) ;

ALTER TABLE MC_CIDADE 
    ADD CONSTRAINT UN_CD_CIDADE UNIQUE ( CD_CIDADE ) ;

CREATE TABLE MC_CLI_FISICA 
    ( 
     NR_CPF            VARCHAR2 (14)  NOT NULL , 
     NR_CLIENTE        NUMBER (10)  NOT NULL , 
     DT_NASCIMENTO     DATE  NOT NULL , 
     FL_SEXO_BIOLOGICO CHAR (1)  NOT NULL , 
     DS_GENERO         VARCHAR2 (100)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_CLI_FISICA.NR_CPF IS 'Essa coluna irá armazenar o número do CPF do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório. ' 
;

COMMENT ON COLUMN MC_CLI_FISICA.NR_CLIENTE IS 'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da tabela NC_CLIENTE. ' 
;

COMMENT ON COLUMN MC_CLI_FISICA.DT_NASCIMENTO IS 'Essa coluna irá armazenar a data de nascimento do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório. ' 
;

COMMENT ON COLUMN MC_CLI_FISICA.FL_SEXO_BIOLOGICO IS 'Essa coluna irá armazenar o sexo biológico do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.. ' 
;

COMMENT ON COLUMN MC_CLI_FISICA.DS_GENERO IS 'Genero do sexo do Cliente. Seu conteúdo deve ser obrigatório.' 
;
CREATE UNIQUE INDEX MC_CLI_FISICA__IDX ON MC_CLI_FISICA 
    ( 
     NR_CLIENTE ASC 
    ) 
;
CREATE UNIQUE INDEX MC_CLI_FISICA__IDXv1 ON MC_CLI_FISICA 
    ( 
     NR_CLIENTE ASC 
    ) 
;

ALTER TABLE MC_CLI_FISICA 
    ADD CONSTRAINT PK_MC_CLI_FISICA PRIMARY KEY ( NR_CPF ) ;

CREATE TABLE MC_CLI_JURIDICA 
    ( 
     NR_CNPJ      VARCHAR2 (20)  NOT NULL , 
     NR_CLIENTE   NUMBER (10)  NOT NULL , 
     DT_FUNDACAO  DATE  NOT NULL , 
     NR_INSCR_EST VARCHAR2 (15) 
    ) 
;

COMMENT ON COLUMN MC_CLI_JURIDICA.NR_CNPJ IS 'Essa coluna irá armazenar o  numero do CNPJ do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CLI_JURIDICA.NR_CLIENTE IS 'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da tabela NC_CLIENTE. ' 
;

COMMENT ON COLUMN MC_CLI_JURIDICA.DT_FUNDACAO IS 'Essa coluna irá armazenar data  de fundação do cliente na plataforma ecommerce da Melhores Compras. Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CLI_JURIDICA.NR_INSCR_EST IS 'Essa coluna irá armazenar o  numero da Inscrição Estadual  do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser opcional' 
;
CREATE UNIQUE INDEX MC_CLI_JURIDICA__IDX ON MC_CLI_JURIDICA 
    ( 
     NR_CLIENTE ASC 
    ) 
;
CREATE UNIQUE INDEX MC_CLI_JURIDICA__IDXv3 ON MC_CLI_JURIDICA 
    ( 
     NR_CLIENTE ASC 
    ) 
;

ALTER TABLE MC_CLI_JURIDICA 
    ADD CONSTRAINT PK_MC_CLI_JURIDICA PRIMARY KEY ( NR_CNPJ ) ;

CREATE TABLE MC_CLIENTE 
    ( 
     NR_CLIENTE      NUMBER (10)  NOT NULL , 
     NM_CLIENTE      VARCHAR2 (160)  NOT NULL , 
     QT_ESTRELAS     NUMBER (1) , 
     VL_MEDIO_COMPRA NUMBER (10,2)  NOT NULL , 
     ST_CLIENTE      CHAR (1)  NOT NULL , 
     DS_EMAIL        VARCHAR2 (100) , 
     NR_TELEFONE     VARCHAR2 (20)  NOT NULL , 
     NM_LOGIN        VARCHAR2 (50)  NOT NULL , 
     DS_SENHA        VARCHAR2 (50)  NOT NULL , 
     TP_CLIENTE      CHAR (1)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_CLIENTE.NR_CLIENTE IS 'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da chamada de sequence  SQ_MC_CLIENTE, a qual terá sempre o número disponivel para uso.' 
;

COMMENT ON COLUMN MC_CLIENTE.NM_CLIENTE IS 'Essa coluna irá armazenar o nome do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CLIENTE.QT_ESTRELAS IS 'Essa coluna irá armazenar a quantiade de estrelas do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório e ser possível de estar entre 1 e 5 estrelas.' 
;

COMMENT ON COLUMN MC_CLIENTE.VL_MEDIO_COMPRA IS 'Essa coluna irá armazenar o valor  médio de gastos f eito pelo cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório e deve ser calculado diariamente.' 
;

COMMENT ON COLUMN MC_CLIENTE.ST_CLIENTE IS 'Essa coluna irá armazenar o stauts do cliente da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).' 
;

COMMENT ON COLUMN MC_CLIENTE.DS_EMAIL IS 'Essa coluna irá armazenar o email  do cliente da Melhorees Compras. No minimo é esperado um email contendo o caractere (@) em seu conteúdo.' 
;

COMMENT ON COLUMN MC_CLIENTE.NR_TELEFONE IS 'Essa coluna irá armazenar o número do cliente da Melhorees Compras. A mascara de armazenamento deve ser: (<nr_ddd>) 99999-9999 e  deve ser utilizada pré definida.' 
;

COMMENT ON COLUMN MC_CLIENTE.NM_LOGIN IS 'Essa coluna irá armazenar o login de cada cliente na plataforma ecommerce da Melhores Compras. Seu conteúdo deve ser obrigatório e  único para cada cliente.' 
;

COMMENT ON COLUMN MC_CLIENTE.DS_SENHA IS 'Essa coluna irá armazenar a senha de cada cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CLIENTE.TP_CLIENTE IS 'Deve ser preenchido de acordo com o tipo de cliiente podendo ser: F(pessoa física) ou J(pessoa jurídica). Deve ser feita uma constraint check. ' 
;

ALTER TABLE MC_CLIENTE 
    ADD CONSTRAINT MC_CLIENTE_PK PRIMARY KEY ( NR_CLIENTE ) ;

ALTER TABLE MC_CLIENTE 
    ADD CONSTRAINT MC_CLIENTE_NR_CLIENTE_UN UNIQUE ( NR_CLIENTE ) ;

CREATE TABLE MC_DEPTO 
    ( 
     CD_DEPTO NUMBER (3)  NOT NULL , 
     NM_DEPTO VARCHAR2 (100)  NOT NULL , 
     ST_DEPTO CHAR (1)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_DEPTO.CD_DEPTO IS 'Esta coluna irá receber o codigo do departamento  e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_DEPTO.NM_DEPTO IS 'Esta coluna irá receber o nome do  departamento  e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_DEPTO.ST_DEPTO IS 'Esta coluna irá receber o status do  departamento  e seu conteúdo é obrigatório. Os valores possíveis são: (A)tivo e (I)nativo.' 
;

ALTER TABLE MC_DEPTO 
    ADD CONSTRAINT PK_MC_DEPTO PRIMARY KEY ( CD_DEPTO ) ;

CREATE TABLE MC_END_CLI 
    ( 
     NR_CLIENTE         NUMBER (10)  NOT NULL , 
     CD_LOGRADOURO      NUMBER (10)  NOT NULL , 
     NR_END             NUMBER (8)  NOT NULL , 
     DS_COMPLEMENTO_END VARCHAR2 (80) , 
     DT_INICIO          DATE  NOT NULL , 
     DT_TERMINO         DATE , 
     ST_END_CLI         CHAR (1)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_END_CLI.NR_CLIENTE IS 'Esta coluna irá receber o número do cliente e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_END_CLI.CD_LOGRADOURO IS 'Esta coluna irá receber o código do logradouro  do cliente e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_END_CLI.NR_END IS 'Número do Endereço do Cliente. O número da Rua/Localidade onde o cliente está associado.' 
;

COMMENT ON COLUMN MC_END_CLI.DS_COMPLEMENTO_END IS 'Esta coluna irá receber o complemento do endereço do cliente e seu conteúdo pode ser opcional.' 
;

COMMENT ON COLUMN MC_END_CLI.DT_INICIO IS 'Data de início do endereço associado ao cliente.' 
;

COMMENT ON COLUMN MC_END_CLI.DT_TERMINO IS 'Data de término do endereço associado ao cliente.' 
;

COMMENT ON COLUMN MC_END_CLI.ST_END_CLI IS 'Status do endereço. (A)itvo ou (I)nativo.' 
;

ALTER TABLE MC_END_CLI 
    ADD CONSTRAINT PK_MC_END_CLI PRIMARY KEY ( NR_CLIENTE ) ;

CREATE TABLE MC_END_FUNC 
    ( 
     CD_FUNCIONARIO     NUMBER  NOT NULL , 
     CD_LOGRADOURO      NUMBER (10)  NOT NULL , 
     NR_END             NUMBER (8)  NOT NULL , 
     DS_COMPLEMENTO_END VARCHAR2 (80) , 
     DT_INICIO          DATE  NOT NULL , 
     DT_TERMINO         DATE , 
     ST_END_FUN         CHAR (1)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_END_FUNC.CD_FUNCIONARIO IS 'Indica a que funcionário o endereço pertence.' 
;

COMMENT ON COLUMN MC_END_FUNC.CD_LOGRADOURO IS 'Indica qual o código do logradouro que o funcionário pertence.' 
;

COMMENT ON COLUMN MC_END_FUNC.NR_END IS 'Número do Endereço do Cliente. O número da Rua/Localidade onde o cliente está associado.' 
;

COMMENT ON COLUMN MC_END_FUNC.DS_COMPLEMENTO_END IS 'Opcional, deve ser preenchido se for necessário.' 
;

COMMENT ON COLUMN MC_END_FUNC.DT_INICIO IS 'Data de início do endereço associado ao cliente.' 
;

COMMENT ON COLUMN MC_END_FUNC.DT_TERMINO IS 'Data de término do endereço associado ao cliente.' 
;

COMMENT ON COLUMN MC_END_FUNC.ST_END_FUN IS 'Indica o status do endereço do funcionário (A)tivo ou (I)nativo.' 
;
CREATE UNIQUE INDEX MC_END_FUNC__IDX ON MC_END_FUNC 
    ( 
     CD_FUNCIONARIO ASC 
    ) 
;

ALTER TABLE MC_END_FUNC 
    ADD CONSTRAINT PK_MC_END_FUNC PRIMARY KEY ( CD_FUNCIONARIO ) ;

ALTER TABLE MC_END_FUNC 
    ADD CONSTRAINT UN_CD_FUNCIONARIO_END UNIQUE ( CD_FUNCIONARIO ) ;

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
    ADD CONSTRAINT MC_ESTADO_PK PRIMARY KEY ( SG_ESTADO ) ;

ALTER TABLE MC_ESTADO 
    ADD CONSTRAINT MC_ESTADO_SG_ESTADO_UN UNIQUE ( SG_ESTADO ) ;

CREATE TABLE MC_FUNCIONARIO 
    ( 
     CD_FUNCIONARIO    NUMBER (10)  NOT NULL , 
     CD_DEPTO          NUMBER (3)  NOT NULL , 
     CD_GERENTE        NUMBER (10) , 
     NM_FUNCIONARIO    VARCHAR2 (160)  NOT NULL , 
     DT_NASCIMENTO     DATE  NOT NULL , 
     FL_SEXO_BIOLOGICO CHAR (1)  NOT NULL , 
     DS_GENERO         VARCHAR2 (100) , 
     DS_CARGO          VARCHAR2 (80) , 
     VL_SALARIO        NUMBER (10,2) , 
     DS_EMAIL          VARCHAR2 (80) , 
     ST_FUNC           CHAR (1)  NOT NULL , 
     DT_CADASTRAMENTO  DATE  NOT NULL , 
     DT_DESLIGAMENTO   DATE , 
     NR_CPF_FUNC       NUMBER (11)  NOT NULL , 
     NR_TEL_FUNC       VARCHAR2 (20)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_FUNCIONARIO.CD_FUNCIONARIO IS 'Esta coluna irá receber o codigo do funcionário e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.CD_DEPTO IS 'Obrigatório indica a que departamento o funcionário pertence.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.CD_GERENTE IS 'Esta coluna irá receber o codigo do gestor do funcionario trabalha  e seu conteúdo é opcional.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.NM_FUNCIONARIO IS 'Esta coluna irá receber o nome do funcionário e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DT_NASCIMENTO IS 'Esta coluna irá receber a data de nascimento  do funcionário e seu conteúdo é obrigatório. E deve ser no formato: DD/MM/YYYY.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.FL_SEXO_BIOLOGICO IS 'Esta coluna irá receber o sexo biológico do funcionário e seu conteúdo é obrigatório.Os valores permitidos aqui seriam: (F)eminino; (M)asculino ou (Hermafrodita)' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DS_GENERO IS 'Esta coluna irá receber o genero atribuido ao funcionário e seu conteúdo é opcional.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DS_CARGO IS 'Esta coluna irá receber o cargo do funcionário e seu conteúdo é opcional.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.VL_SALARIO IS 'Esta coluna irá receber o valor do salário do funcionário e seu conteúdo é opcional.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DS_EMAIL IS 'Esta coluna irá receber o email do funcionário e seu conteúdo é opcional.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.ST_FUNC IS 'Essa coluna irá armazenar o stauts do funcionário da Melhores Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DT_CADASTRAMENTO IS 'Data de cadastramento do Funcionario' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DT_DESLIGAMENTO IS 'Data de desligamento  do Funcionario. Seu conteúdo é opcional.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.NR_CPF_FUNC IS 'Número do CPF obrigatório e único.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.NR_TEL_FUNC IS 'Obrigatoriamente deve conter o número de telefone do funcionário no modelo (<nr_ddd>) 99999-9999' 
;
CREATE UNIQUE INDEX MC_FUNCIONARIO__IDX ON MC_FUNCIONARIO 
    ( 
     CD_FUNCIONARIO ASC 
    ) 
;
CREATE UNIQUE INDEX MC_FUNCIONARIO__IDX1 ON MC_FUNCIONARIO 
    ( 
     CD_GERENTE ASC 
    ) 
;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT MC_FUNCIONARIO_PK PRIMARY KEY ( CD_FUNCIONARIO ) ;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT UN_CD_FUNCIONARIO UNIQUE ( CD_FUNCIONARIO ) ;

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
     CD_CATEGORIA      NUMBER (10)  NOT NULL , 
     DS_PRODUTO        VARCHAR2 (80)  NOT NULL , 
     DS_COMPLETA_PROD  VARCHAR2 (4000)  NOT NULL , 
     NR_CD_BARRAS_PROD VARCHAR2 (50) , 
     VL_UNITARIO       NUMBER (8,2)  NOT NULL , 
     TP_EMBALAGEM      VARCHAR2 (15) , 
     ST_PRODUTO        CHAR (1)  NOT NULL , 
     VL_PERC_LUCRO     NUMBER (8,2) 
    ) 
;

COMMENT ON COLUMN MC_PRODUTO.CD_PRODUTO IS 'Essa coluna irá armazenar a chave primária da tabela de produtos da Melhores Compras. A cada produto cadastrado será acionada a Sequence  SQ_MC_PRODUTO que se encarregará de gerar o próximo número único do produto.' 
;

COMMENT ON COLUMN MC_PRODUTO.CD_CATEGORIA IS 'Indica a qual categoria o produto pertence, obrigatório.' 
;

COMMENT ON COLUMN MC_PRODUTO.DS_PRODUTO IS 'Essa coluna irá armazenar a descrição principal do produto. Seu conteúdo deve ser  obrigatorio.' 
;

COMMENT ON COLUMN MC_PRODUTO.DS_COMPLETA_PROD IS 'Essa coluna irá armazenar a descrição completa do produto. Seu conteúdo deve ser  obrigatorio.' 
;

COMMENT ON COLUMN MC_PRODUTO.NR_CD_BARRAS_PROD IS 'Essa coluna irá armazenar o número do codigo de barras  do produto. Seu conteúdo deve ser opcional.' 
;

COMMENT ON COLUMN MC_PRODUTO.VL_UNITARIO IS 'Essa coluna irá armazenar o valor unitário do produto. Seu conteúdo deve ser > 0 ' 
;

COMMENT ON COLUMN MC_PRODUTO.TP_EMBALAGEM IS 'Essa coluna irá armazenar o tipo de embalagem do produto. Seu conteúdo pode ser opcional.' 
;

COMMENT ON COLUMN MC_PRODUTO.ST_PRODUTO IS 'Essa coluna irá armazenar o stauts do produto da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).' 
;

COMMENT ON COLUMN MC_PRODUTO.VL_PERC_LUCRO IS 'Essa coluna irá armazenar o percentual  do lucro médio para cada produto. Seu conteúdo deve ser opcional.' 
;

ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT PK_MC_PRODUTO PRIMARY KEY ( CD_PRODUTO ) ;

ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT UN_DS_PROD UNIQUE ( DS_PRODUTO ) ;

ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT UN_DS_COMP_PROD UNIQUE ( DS_COMPLETA_PROD ) ;

CREATE TABLE MC_SGV_CAT_VIDEO 
    ( 
     CD_CAT_VIDEO        NUMBER (10)  NOT NULL , 
     DS_CAT_VIDEO        VARCHAR2 (160)  NOT NULL , 
     ST_CAT_VIDEO        CHAR (1)  NOT NULL , 
     DT_CADASTRO_CAT_VID DATE  NOT NULL , 
     DT_TERMINO_CAT_VID  DATE 
    ) 
;

COMMENT ON COLUMN MC_SGV_CAT_VIDEO.CD_CAT_VIDEO IS 'Código gerado automaticamente, único atrelado a uma categoria de vídeo específica.' 
;

COMMENT ON COLUMN MC_SGV_CAT_VIDEO.DS_CAT_VIDEO IS 'Descrição que deve ser única de cada categoria de vídeo.' 
;

COMMENT ON COLUMN MC_SGV_CAT_VIDEO.ST_CAT_VIDEO IS 'Indica o status da categoria do video, podendo ser preenchida apenas com: A(tivo) ou I(nativo) ' 
;

COMMENT ON COLUMN MC_SGV_CAT_VIDEO.DT_CADASTRO_CAT_VID IS ' Indica a data do cadastro da categoria. Obrigatório e seu formato é dd/mm/yyyy' 
;

COMMENT ON COLUMN MC_SGV_CAT_VIDEO.DT_TERMINO_CAT_VID IS ' Indica a data do término da categoria. Opcional  e seu formato é dd/mm/yyyy' 
;

ALTER TABLE MC_SGV_CAT_VIDEO 
    ADD CONSTRAINT PK_MC_SGV_CAT_VID PRIMARY KEY ( CD_CAT_VIDEO ) ;

ALTER TABLE MC_SGV_CAT_VIDEO 
    ADD CONSTRAINT UN_DS_CAT_VID UNIQUE ( DS_CAT_VIDEO ) ;

CREATE TABLE MC_SGV_SAC 
    ( 
     NR_SAC                   NUMBER (10)  NOT NULL , 
     NR_CLIENTE               NUMBER (10)  NOT NULL , 
     CD_PRODUTO               NUMBER (10)  NOT NULL , 
     CD_FUNCIONARIO           NUMBER (10)  NOT NULL , 
     DS_DETALHADA_SAC         CLOB  NOT NULL , 
     DT_ABERTURA_SAC          DATE  NOT NULL , 
     HR_ABERTURA_SAC          NUMBER (2)  NOT NULL , 
     DT_ATENDIMENTO           DATE , 
     HR_ATENDIMENTO_SAC       NUMBER (2) , 
     NR_TEMPO_TOTAL_SAC       NUMBER (10) , 
     DS_DETALHADA_RETORNO_SAC CLOB , 
     TP_SAC                   CHAR (1)  NOT NULL , 
     ST_SAC                   CHAR (1)  NOT NULL , 
     NR_INDICE_SATISFACAO     NUMBER (2) 
    ) 
;

COMMENT ON COLUMN MC_SGV_SAC.NR_SAC IS 'Essa coluna irá armazenar a chave primária da tabela de SAC de vídeo  da Melhorees Compras. A cada SAC cadastrado pelo cliente será acionada a Sequence  SQ_MC_SGV_SAC que se encarregará de gerar o próximo número único do chamado SAC feito pelo Cliente.' 
;

COMMENT ON COLUMN MC_SGV_SAC.NR_CLIENTE IS 'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da tabela NC_CLIENTE. ' 
;

COMMENT ON COLUMN MC_SGV_SAC.CD_PRODUTO IS 'Todo chamado deve ser associado a um produto segundo as regras de negócio, portanto é um conteúdo obrigatório.' 
;

COMMENT ON COLUMN MC_SGV_SAC.CD_FUNCIONARIO IS 'Esta coluna irá receber o codigo do funcionário e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_SGV_SAC.DS_DETALHADA_SAC IS 'Essa coluna  irá  receber a descrição completa do SAC aberto pelo cliente. Seu conteudo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_SGV_SAC.DT_ABERTURA_SAC IS 'Essa coluna  irá  receber a data e horário do SAC aberto pelo cliente. Seu conteudo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_SGV_SAC.HR_ABERTURA_SAC IS 'Essa coluna  irá  receber a hora do SAC aberto pelo cliente. Seu conteudo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_SGV_SAC.DT_ATENDIMENTO IS 'Essa coluna  irá  receber a data e horário do atendmiento SAC feita pelo funcionário da Melhores Compras. Seu conteudo deve ser opcional..' 
;

COMMENT ON COLUMN MC_SGV_SAC.HR_ATENDIMENTO_SAC IS 'Essa coluna  irá  receber a hora do SAC do atendimento  feito  pelo funcionario da Melhores Compras. Seu conteudo deve ser opcional.' 
;

COMMENT ON COLUMN MC_SGV_SAC.NR_TEMPO_TOTAL_SAC IS 'Essa coluna  irá  receber o tempo total em horas  (HH24) computado desde a abertura até a conclusão dele. A unidade de medida é horas, ou seja, em quantas horas o chamado foi concluído desde a sua abertura.' 
;

COMMENT ON COLUMN MC_SGV_SAC.DS_DETALHADA_RETORNO_SAC IS 'Essa coluna  irá  receber a descrição detalhada do retorno feito pelo funcionário a partir da solicitação do cliente. Seu conteúdo deve ser opcional e preenchido pelo funcionário.' 
;

COMMENT ON COLUMN MC_SGV_SAC.TP_SAC IS 'Essa coluna  irá  receber o TIPO  do chamado SAC aberto pelo cliente.  Seu conteúdo deve ser  obrigatório e os possíveis valores são: (S)ugestão; (D)úvida ou (E)logio.' 
;

COMMENT ON COLUMN MC_SGV_SAC.ST_SAC IS 'Essa coluna  irá  receber o STATUS  do chamado SAC aberto pelo cliente.  Seu conteúdo deve ser  obrigatório e os possíveis valores são: (E)m Atendimento; (C)ancelado; (F)echado ou (X)Fechado com Insatisfação do cliente.' 
;

COMMENT ON COLUMN MC_SGV_SAC.NR_INDICE_SATISFACAO IS 'Essa coluna  irá  receber o índice de satisfação, , computado como um valor simples de 1 a 10, onde 1 refere-se ao cliente menos satisfeito e 10 o cliente mais satisfeito. Esse índice de satisfação é opcional e informado pelo cliente ao final do atendimento.' 
;

ALTER TABLE MC_SGV_SAC 
    ADD CONSTRAINT PK_MC_SGV_SAC PRIMARY KEY ( NR_SAC ) ;

CREATE TABLE MC_SGV_VID_PROD 
    ( 
     CD_VID_PROD   NUMBER  NOT NULL , 
     CD_PRODUTO    NUMBER (10)  NOT NULL , 
     CD_CAT_VIDEO  NUMBER (10)  NOT NULL , 
     DT_CADASTRO   DATE  NOT NULL , 
     ST_VIDEO_PROD CHAR (1)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_SGV_VID_PROD.CD_VID_PROD IS 'Código identificador do vídeo do produto, será a PK da entidade e deve ser único e gerado via identity crescente.' 
;

COMMENT ON COLUMN MC_SGV_VID_PROD.CD_PRODUTO IS 'Código de produto que indica a que produto o vídeo é associado' 
;

COMMENT ON COLUMN MC_SGV_VID_PROD.CD_CAT_VIDEO IS 'Cada vídeo deve obrigatóriamente estar alocado em uma categoria.' 
;

COMMENT ON COLUMN MC_SGV_VID_PROD.DT_CADASTRO IS 'Data de cadastro do vídeo na plataforma, deve ser obrigatório e no modelo: DD/MM/YYYY.' 
;

COMMENT ON COLUMN MC_SGV_VID_PROD.ST_VIDEO_PROD IS 'Indica qual o status do vídeo na plataforma, ele pode ser uma das duas seguintes opções: A(tivo) ou (I)nativo.' 
;

ALTER TABLE MC_SGV_VID_PROD 
    ADD CONSTRAINT PK_MC_SGV_VID_PROD PRIMARY KEY ( CD_VID_PROD ) ;

CREATE TABLE MC_SGV_VISU_VID 
    ( 
     CD_VISUALIZACAO NUMBER (10)  NOT NULL , 
     CD_VID_PROD     NUMBER (10)  NOT NULL , 
     NR_CLIENTE      NUMBER (10) , 
     DT_HR_VISU      TIMESTAMP  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_SGV_VISU_VID.CD_VISUALIZACAO IS 'Código único gerado através da visualização feita por um usuário logado, criado a partir de uma IDENTITY. Sequencial e inteiro.' 
;

COMMENT ON COLUMN MC_SGV_VISU_VID.CD_VID_PROD IS 'Indica qual vídeo foi assistido pelo cliente da Melhores Compras' 
;

COMMENT ON COLUMN MC_SGV_VISU_VID.NR_CLIENTE IS 'Indica qual o código do cliente que visualizou o vídeo.' 
;

COMMENT ON COLUMN MC_SGV_VISU_VID.DT_HR_VISU IS 'Timestamp gerado através da data e hora da visualização. No formato: DD/MM/YYYY e HH/MM/SS' 
;

ALTER TABLE MC_SGV_VISU_VID 
    ADD CONSTRAINT PK_MC_SGV_VISU_VID PRIMARY KEY ( CD_VISUALIZACAO ) ;

ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT FK_CAT_MC_PROD FOREIGN KEY 
    ( 
     CD_CATEGORIA
    ) 
    REFERENCES MC_CATEGORIA_PROD 
    ( 
     CD_CATEGORIA
    ) 
;

ALTER TABLE MC_SGV_VISU_VID 
    ADD CONSTRAINT FK_CLIENTE_VISU FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE
    ) 
;

ALTER TABLE MC_SGV_SAC 
    ADD CONSTRAINT FK_FUNC_SAC FOREIGN KEY 
    ( 
     CD_FUNCIONARIO
    ) 
    REFERENCES MC_FUNCIONARIO 
    ( 
     CD_FUNCIONARIO
    ) 
;

ALTER TABLE MC_BAIRRO 
    ADD CONSTRAINT FK_MC_BAIRRO_CIDADE FOREIGN KEY 
    ( 
     CD_CIDADE
    ) 
    REFERENCES MC_CIDADE 
    ( 
     CD_CIDADE
    ) 
;

ALTER TABLE MC_CIDADE 
    ADD CONSTRAINT FK_MC_CIDADE_ESTADO FOREIGN KEY 
    ( 
     SG_ESTADO
    ) 
    REFERENCES MC_ESTADO 
    ( 
     SG_ESTADO
    ) 
;

ALTER TABLE MC_END_CLI 
    ADD CONSTRAINT FK_MC_CLIENTE_END FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE
    ) 
;

ALTER TABLE MC_CLI_FISICA 
    ADD CONSTRAINT FK_MC_CLIENTE_FISICA FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE
    ) 
;

ALTER TABLE MC_CLI_JURIDICA 
    ADD CONSTRAINT FK_MC_CLIENTE_JURIDICA FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE
    ) 
;

ALTER TABLE MC_SGV_SAC 
    ADD CONSTRAINT FK_MC_CLIENTE_SAC FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE
    ) 
;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT FK_MC_DEPTO_FUNC FOREIGN KEY 
    ( 
     CD_DEPTO
    ) 
    REFERENCES MC_DEPTO 
    ( 
     CD_DEPTO
    ) 
;

ALTER TABLE MC_END_FUNC 
    ADD CONSTRAINT FK_MC_END_FUNC_LOGRADOURO FOREIGN KEY 
    ( 
     CD_LOGRADOURO
    ) 
    REFERENCES MC_LOGRADOURO 
    ( 
     CD_LOGRADOURO
    ) 
;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT FK_MC_FUNC_SUPERIOR FOREIGN KEY 
    ( 
     CD_GERENTE
    ) 
    REFERENCES MC_FUNCIONARIO 
    ( 
     CD_FUNCIONARIO
    ) 
;

ALTER TABLE MC_LOGRADOURO 
    ADD CONSTRAINT FK_MC_LOGRADOURO_BAIRRO FOREIGN KEY 
    ( 
     CD_BAIRRO
    ) 
    REFERENCES MC_BAIRRO 
    ( 
     CD_BAIRRO
    ) 
;

ALTER TABLE MC_END_CLI 
    ADD CONSTRAINT FK_MC_LOGRADOURO_END FOREIGN KEY 
    ( 
     CD_LOGRADOURO
    ) 
    REFERENCES MC_LOGRADOURO 
    ( 
     CD_LOGRADOURO
    ) 
;

ALTER TABLE MC_SGV_SAC 
    ADD CONSTRAINT FK_MC_PROD_SAC FOREIGN KEY 
    ( 
     CD_PRODUTO
    ) 
    REFERENCES MC_PRODUTO 
    ( 
     CD_PRODUTO
    ) 
;

ALTER TABLE MC_SGV_VID_PROD 
    ADD CONSTRAINT FK_MC_PRODUTO_VIDEO FOREIGN KEY 
    ( 
     CD_PRODUTO
    ) 
    REFERENCES MC_PRODUTO 
    ( 
     CD_PRODUTO
    ) 
;

ALTER TABLE MC_SGV_VID_PROD 
    ADD CONSTRAINT FK_MC_SGV_VID_PROD FOREIGN KEY 
    ( 
     CD_CAT_VIDEO
    ) 
    REFERENCES MC_SGV_CAT_VIDEO 
    ( 
     CD_CAT_VIDEO
    ) 
;

ALTER TABLE MC_SGV_VISU_VID 
    ADD CONSTRAINT FK_VID_VISU FOREIGN KEY 
    ( 
     CD_VID_PROD
    ) 
    REFERENCES MC_SGV_VID_PROD 
    ( 
     CD_VID_PROD
    ) 
;

CREATE OR REPLACE TRIGGER ARC_FK_ARCO_CLI__MC_CLI_FISICA 
BEFORE INSERT OR UPDATE OF NR_CLIENTE 
ON MC_CLI_FISICA 
FOR EACH ROW 
DECLARE 
    d CHAR (1); 
BEGIN 
    SELECT A.TP_CLIENTE INTO d 
    FROM MC_CLIENTE A 
    WHERE A.NR_CLIENTE = :new.NR_CLIENTE; 
    IF (d IS NULL OR d <> 'F') THEN 
        raise_application_error(-20223,'FK FK_MC_CLIENTE_FISICA in Table MC_CLI_FISICA violates Arc constraint on Table MC_CLIENTE - discriminator column TP_CLIENTE doesn''t have value ''F'''); 
    END IF; 
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        NULL; 
    WHEN OTHERS THEN 
        RAISE; 
END; 
/

CREATE OR REPLACE TRIGGER ARC_FK_ARCO_CL_MC_CLI_JURIDICA 
BEFORE INSERT OR UPDATE OF NR_CLIENTE 
ON MC_CLI_JURIDICA 
FOR EACH ROW 
DECLARE 
    d CHAR (1); 
BEGIN 
    SELECT A.TP_CLIENTE INTO d 
    FROM MC_CLIENTE A 
    WHERE A.NR_CLIENTE = :new.NR_CLIENTE; 
    IF (d IS NULL OR d <> 'J') THEN 
        raise_application_error(-20223,'FK FK_MC_CLIENTE_JURIDICA in Table MC_CLI_JURIDICA violates Arc constraint on Table MC_CLIENTE - discriminator column TP_CLIENTE doesn''t have value ''J'''); 
    END IF; 
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        NULL; 
    WHEN OTHERS THEN 
        RAISE; 
END; 
/

CREATE SEQUENCE MC_CATEGORIA_PROD_CD_CATEGORIA 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER MC_CATEGORIA_PROD_CD_CATEGORIA 
BEFORE INSERT ON MC_CATEGORIA_PROD 
FOR EACH ROW 
WHEN (NEW.CD_CATEGORIA IS NULL) 
BEGIN 
    :NEW.CD_CATEGORIA := MC_CATEGORIA_PROD_CD_CATEGORIA.NEXTVAL; 
END;
/

CREATE SEQUENCE MC_PRODUTO_CD_PRODUTO_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER MC_PRODUTO_CD_PRODUTO_TRG 
BEFORE INSERT ON MC_PRODUTO 
FOR EACH ROW 
WHEN (NEW.CD_PRODUTO IS NULL) 
BEGIN 
    :NEW.CD_PRODUTO := MC_PRODUTO_CD_PRODUTO_SEQ.NEXTVAL; 
END;
/

CREATE SEQUENCE MC_SGV_CAT_VIDEO_CD_CAT_VIDEO 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER MC_SGV_CAT_VIDEO_CD_CAT_VIDEO 
BEFORE INSERT ON MC_SGV_CAT_VIDEO 
FOR EACH ROW 
WHEN (NEW.CD_CAT_VIDEO IS NULL) 
BEGIN 
    :NEW.CD_CAT_VIDEO := MC_SGV_CAT_VIDEO_CD_CAT_VIDEO.NEXTVAL; 
END;
/

CREATE SEQUENCE MC_SGV_SAC_NR_SAC_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER MC_SGV_SAC_NR_SAC_TRG 
BEFORE INSERT ON MC_SGV_SAC 
FOR EACH ROW 
WHEN (NEW.NR_SAC IS NULL) 
BEGIN 
    :NEW.NR_SAC := MC_SGV_SAC_NR_SAC_SEQ.NEXTVAL; 
END;
/

CREATE SEQUENCE MC_SGV_VID_PROD_CD_VID_PROD 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER MC_SGV_VID_PROD_CD_VID_PROD 
BEFORE INSERT ON MC_SGV_VID_PROD 
FOR EACH ROW 
WHEN (NEW.CD_VID_PROD IS NULL) 
BEGIN 
    :NEW.CD_VID_PROD := MC_SGV_VID_PROD_CD_VID_PROD.NEXTVAL; 
END;
/

CREATE SEQUENCE MC_SGV_VISU_VID_CD_VISUALIZACA 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER MC_SGV_VISU_VID_CD_VISUALIZACA 
BEFORE INSERT ON MC_SGV_VISU_VID 
FOR EACH ROW 
WHEN (NEW.CD_VISUALIZACAO IS NULL) 
BEGIN 
    :NEW.CD_VISUALIZACAO := MC_SGV_VISU_VID_CD_VISUALIZACA.NEXTVAL; 
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            17
-- CREATE INDEX                             7
-- ALTER TABLE                             46
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
-- CREATE SEQUENCE                          6
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
