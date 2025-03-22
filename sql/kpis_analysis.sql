select * from public.dim_cargo;
select * from public.dim_departamento;
select * from public.dim_divisao;
select * from public.dim_funcionario;
select * from public.fat_folha_pagamento;

--
-- KPIS
--

-- TOTAL DE FUNCIONÁRIOS POR DEPARTAMENTO;
select dd.ds_dim_departamento as departamento, count(df.nk_dim_funcionario) as total_funcionario
from fat_folha_pagamento fat
inner join dim_departamento dd on fat.sk_dim_departamento = dd.sk_dim_departamento
inner join dim_funcionario df on fat.sk_dim_funcionario = df.sk_dim_funcionario
where df.nk_dim_funcionario <> 0
group by dd.ds_dim_departamento
order by total_funcionario desc;

-- MÉDIA SALARIAL POR CARGO
select ds_dim_cargo as cargo, avg(fat.vl_fat_folha_pagamento_salario)::numeric(18,2) as media_salarial
from fat_folha_pagamento fat
inner join dim_cargo dc on fat.sk_dim_cargo = dc.sk_dim_cargo
where dc.nk_dim_cargo <> 0
group by ds_dim_cargo
order by media_salarial desc;

-- MÉDIA TEMPO DE EMPRESA

-- CUSTO TOTAL FOLHA DE PAGAMENTO

--
-- ANÁLISES
--

-- FUNCIONÁRIOS COM MAIOR TEMPO DE EMPRESA

-- DISTRIBUIÇÃO SALARIAL POR CARGO

-- EVOLUÇÃO DO CUSTO DE FOLHA DE PAGAMENTO



