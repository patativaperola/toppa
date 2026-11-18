-- Banco de dados do Toppa (versão de teste)
-- Cole tudo isto em Supabase › SQL Editor › New query e clique em Run.

create table if not exists public.registros (
  id          bigint generated always as identity primary key,
  tipo        text not null check (tipo in ('perfil','evento','cadastro','feedback','lista','visita','topada')),
  dispositivo text not null check (char_length(dispositivo) between 8 and 64),
  dados       jsonb not null check (octet_length(dados::text) < 300000),
  criado      timestamptz not null default now()
);

create index if not exists registros_tipo_criado on public.registros (tipo, criado desc);

alter table public.registros enable row level security;

-- Qualquer visitante do site pode ENVIAR registros (cadastro, perfil, vaga, avaliação...).
drop policy if exists "qualquer um pode enviar" on public.registros;
create policy "qualquer um pode enviar"
  on public.registros for insert to anon
  with check (true);

-- Qualquer visitante pode LER só os perfis de freelancer e as vagas das empresas.
-- Cadastros completos, avaliações, lista de espera e visitas ficam visíveis só para você no painel do Supabase.
drop policy if exists "perfis e vagas sao publicos" on public.registros;
create policy "perfis e vagas sao publicos"
  on public.registros for select to anon
  using (tipo in ('perfil','evento'));

grant insert, select on public.registros to anon;
