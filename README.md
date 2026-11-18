# Toppa – versão de teste

Protótipo acadêmico (SKEMA Business School, Administração) de um app que conecta freelancers verificados e empresas, no estilo "deu match": **topou, fechou**.

## O que dá para testar

- Cadastro de freelancer com foto, portfólio, verificação simulada e regras do app
- Cadastro de empresa com logo, primeira vaga e simulação de plano (mensal, trimestral, semestral, anual)
- App do freelancer: vagas das empresas, topadas e perfil
- App da empresa: talentos, eventos com candidatos e pagamento simulado
- Reserva de equipe com valor por pessoa e serviço personalizado
- Avaliação do protótipo

Nenhum documento real é pedido e nada é cobrado.

## Como os dados funcionam

O site guarda os dados num banco Supabase (tabela `registros`):

| O quê | Quem vê |
|---|---|
| Perfis de freelancer e vagas das empresas | Todos os visitantes do site (atualiza sozinho a cada 20 segundos) |
| Cadastros completos, avaliações, lista de espera, visitas | Só a dona do projeto, no painel do Supabase |

Para ver e baixar os resultados: Supabase › Table Editor › `registros` › Export to CSV.

## Configurar o banco (uma vez)

1. Crie um projeto grátis em supabase.com.
2. Abra SQL Editor, cole o conteúdo de `supabase.sql` e clique em Run.
3. Em Project Settings › API, copie a **Project URL** e a chave **anon public**.
4. Cole as duas em `config.js`. Nunca use a chave `service_role` no site.

## Publicar no GitHub Pages

Settings › Pages › Source: *Deploy from a branch* › Branch: `main` / `(root)` › Save.
O site fica em `https://patativaperola.github.io/toppa/`.
