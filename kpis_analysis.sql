select * from public.dim_cargo;
select * from public.dim_departamento;
select * from public.dim_divisao;
select * from public.dim_funcionario;
select * from public.fat_folha_pagamento;
select * from public.dim_calendar;

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

-- CUSTO TOTAL FOLHA DE PAGAMENTO
select sum(vl_fat_folha_pagamento_salario)::numeric(18,2) as custo_total_folha_pagamento
from fat_folha_pagamento
order by custo_total_folha_pagamento desc;

--
-- ANÁLISES
--

-- DISTRIBUIÇÃO SALARIAL POR CARGO
select dc.ds_dim_cargo as cargo, fat.vl_fat_folha_pagamento_salario::numeric(18,2) as salario
from fat_folha_pagamento fat
inner join dim_cargo dc on fat.sk_dim_cargo = dc.sk_dim_cargo
where dc.nk_dim_cargo <> 0
group by ds_dim_cargo, salario
order by salario desc;

-- EVOLUÇÃO DO CUSTO DE FOLHA DE PAGAMENTO
select dca.nr_dim_calendar_month as mes, dca.nr_dim_calendar_year as ano, fat.vl_fat_folha_pagamento_salario::numeric(18,2) as custo_folha_pagamento
from fat_folha_pagamento fat
inner join dim_calendar dca on fat.id_dim_calendar = dca.id_dim_calendar
group by dca.nr_dim_calendar_month, dca.nr_dim_calendar_year, fat.vl_fat_folha_pagamento_salario
order by dca.nr_dim_calendar_month, dca.nr_dim_calendar_year;

