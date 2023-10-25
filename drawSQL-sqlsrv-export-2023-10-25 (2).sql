CREATE TABLE "funcionarios"(
    "id" INT NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "data_nascimento" DATE NOT NULL,
    "cpf" INT NOT NULL,
    "rg" INT NOT NULL,
    "esocial" INT NOT NULL,
    "telefone" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "endereco" VARCHAR(255) NOT NULL,
    "cargo_id" INT NOT NULL
);
ALTER TABLE
    "funcionarios" ADD CONSTRAINT "funcionarios_id_primary" PRIMARY KEY("id");
CREATE TABLE "periodicos"(
    "id" INT NOT NULL,
    "exame" VARCHAR(255) NOT NULL,
    "cargo_id" INT NOT NULL,
    "frequencia" INT NOT NULL,
    "data" DATE NOT NULL
);
ALTER TABLE
    "periodicos" ADD CONSTRAINT "periodicos_id_primary" PRIMARY KEY("id");
CREATE TABLE "imposto"(
    "id" INT NOT NULL,
    "inss" INT NOT NULL,
    "fgts" INT NOT NULL,
    "irf" INT NOT NULL
);
ALTER TABLE
    "imposto" ADD CONSTRAINT "imposto_id_primary" PRIMARY KEY("id");
CREATE TABLE "contratos"(
    "id" INT NOT NULL,
    "colaborador" VARCHAR(255) NOT NULL,
    "cargo_id" INT NOT NULL,
    "data_adm" DATE NOT NULL,
    "salario_inicial" DECIMAL(8, 2) NOT NULL,
    "salario_atual" DECIMAL(8, 2) NOT NULL,
    "ultima_alteracao" DATE NOT NULL,
    "data_saida" DATE NOT NULL,
    "motivo_saida" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "contratos" ADD CONSTRAINT "contratos_id_primary" PRIMARY KEY("id");
CREATE TABLE "cargos"(
    "id" INT NOT NULL,
    "cargo" VARCHAR(255) NOT NULL,
    "nivel" INT NOT NULL,
    "departamento" VARCHAR(255) NOT NULL,
    "salario_base" DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    "cargos" ADD CONSTRAINT "cargos_id_primary" PRIMARY KEY("id");
CREATE TABLE "folha_pagamento"(
    "id" INT NOT NULL,
    "colaborador_id" INT NOT NULL,
    "cargo_id" INT NOT NULL,
    "salario_base" DECIMAL(8, 2) NOT NULL,
    "comissao_vista" DECIMAL(8, 2) NOT NULL,
    "comissao_prazo" DECIMAL(8, 2) NOT NULL,
    "hora_extra" DECIMAL(8, 2) NOT NULL,
    "salario_bruto" DECIMAL(8, 2) NOT NULL,
    "quinzenal_bruto" DECIMAL(8, 2) NOT NULL,
    "salario_liquido" DECIMAL(8, 2) NOT NULL,
    "imposto_id" INT NOT NULL,
    "vale_lobao" DECIMAL(8, 2) NOT NULL,
    "vales" DECIMAL(8, 2) NOT NULL,
    "outros_vales" DECIMAL(8, 2) NOT NULL,
    "debitos_loja" DECIMAL(8, 2) NOT NULL,
    "quizenal_liquido" DECIMAL(8, 2) NOT NULL,
    "reflexo_dsl" DECIMAL(8, 2) NOT NULL,
    "reflexo_dsr" DECIMAL(8, 2) NOT NULL,
    "adicionais" DECIMAL(8, 2) NOT NULL,
    "ferias" DECIMAL(8, 2) NOT NULL,
    "rescisoes" DECIMAL(8, 2) NOT NULL,
    "acerto_avulso" DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    "folha_pagamento" ADD CONSTRAINT "folha_pagamento_id_primary" PRIMARY KEY("id");
ALTER TABLE
    "contratos" ADD CONSTRAINT "contratos_colaborador_foreign" FOREIGN KEY("colaborador") REFERENCES "funcionarios"("id");
ALTER TABLE
    "folha_pagamento" ADD CONSTRAINT "folha_pagamento_cargo_id_foreign" FOREIGN KEY("cargo_id") REFERENCES "cargos"("id");
ALTER TABLE
    "funcionarios" ADD CONSTRAINT "funcionarios_cargo_id_foreign" FOREIGN KEY("cargo_id") REFERENCES "cargos"("id");
ALTER TABLE
    "periodicos" ADD CONSTRAINT "periodicos_cargo_id_foreign" FOREIGN KEY("cargo_id") REFERENCES "cargos"("id");
ALTER TABLE
    "folha_pagamento" ADD CONSTRAINT "folha_pagamento_imposto_id_foreign" FOREIGN KEY("imposto_id") REFERENCES "imposto"("id");
ALTER TABLE
    "contratos" ADD CONSTRAINT "contratos_cargo_id_foreign" FOREIGN KEY("cargo_id") REFERENCES "cargos"("id");
ALTER TABLE
    "folha_pagamento" ADD CONSTRAINT "folha_pagamento_colaborador_id_foreign" FOREIGN KEY("colaborador_id") REFERENCES "funcionarios"("id");