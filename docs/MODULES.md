# Documentação de Módulos — plataforma_edu 📚

Este documento descreve **funcionalidades, responsabilidades e pontos de atenção** de cada módulo do projeto `plataforma_edu`.

---

## Visão geral 🚀
- Aplicação Flutter com arquitetura limpa (Clean Architecture), Riverpod para estado e Drift para persistência local.
- Objetivo: plataforma educativa com atividades lúdicas, relatórios e suporte a perfis (crianças, responsáveis).

---

## Estrutura principal (resumida)
- `lib/src/core` — infraestrutura (DI, inicialização). 🔧
- `lib/src/data` — implementações de repositórios, acesso a DB (Drift). 💾
- `lib/src/domain` — entidades, casos de uso (usecases). 🧠
- `lib/src/presentation` — UI (páginas), providers (Riverpod), navegação. 🎨
- `web/` — bootstrap web e configuração de `sql.js` para Drift no web. 🌐
- `test/` — testes unitários / widget tests. ✅

---

## Módulos detalhados

### lib/src/core 🔧
- `di` (Injeção de dependências):
  - `injector.dart` exporta a implementação correta conforme plataforma (IO vs Web).
  - `injector_io.dart` registra implementações para mobile/desktop, incluindo repositórios que usam Firebase/local DB.
  - `injector_web.dart` registra implementações para web; **inclui `FakeAuthRepository`** que consulta o DB local (útil para desenvolvimento web sem Firebase).
- Outras responsabilidades:
  - Inicialização de serviços (ex.: Firebase em plataformas suportadas), registro de repositórios e provedores do GetIt.

**Ponto de atenção:** se migrar para Firebase em produção, ajuste `injector_web.dart` para apontar ao fluxo real de autenticação.

---

### lib/src/data 💾
- `local/` — Drift (SQLite) adaptado para web com `sql.js` (ou `drift/wasm.dart` recomendado):
  - `database.dart`, `database_io.dart`, `database_web.dart` — configura acesso ao DB por plataforma.
  - `sql-wasm.wasm` é carregado em `web/index.html` para suportar Drift no Chrome.
- `repositories` — implementações concretas:
  - `users_repository_impl.dart` — cria/consulta usuários (usado pelo auth e perfis).
  - `activity_results_repository_impl.dart` — grava/consulta resultados de atividades.
  - `associations_repository_impl.dart` — associações entre cuidador/criança.
  - `auth_repository_impl.dart` — usa Firebase Auth na variante IO; no web é usada uma implementação fake para testes.

**Ponto de atenção:** migrar de `drift/web.dart` para `drift/wasm.dart` é recomendado para estabilidade e compatibilidade web a longo prazo.

---

### lib/src/domain 🧠
- **Entidades**: definem modelos de domínio (ex.: `UserEntity`, `ActivityResult`, `ActivityReport`, `ChildEntity`, `Difficulty`).
- **UseCases**: implementação das regras de negócio (ex.: `SignInWithEmail`, `RecordActivityResult`, `GetActivityReport`, `GetAdaptiveDifficulty`).
- **Interfaces**: repositórios abstratos usadas por casos de uso (inversão de dependência — testável).

---

### lib/src/presentation 🎨
- **Páginas (UI)**:
  - `splash_page.dart` — checagem de sessão (usa `AuthNotifier.init`) e redirecionamento para `/home` ou `/landing`.
  - `landing_page.dart` — página pública com CTA para login/cadastro.
  - `login_page.dart` / `signup_page.dart` — formulários; `signup` cria usuário no DB e chama `AuthNotifier.signInWithEmail`.
  - `home_page.dart` — hub educacional (acessos rápidos, cursos recomendados). Contém atalhos para atividades (ex.: `/color-game`, `/memory-game`).
  - `color_game_page.dart` — atividade existente (jogo das cores).
  - `memory_game_page.dart` — **novo** Jogo da Memória (pares, embaralha, detecção de vitória, reiniciar).
  - `children_page.dart` / `caregivers_page.dart` — gestão de perfis.
  - `reports_page.dart` / `report_details_page.dart` — relatórios e detalhes por criança.

- **Providers (Riverpod)**:
  - `auth_provider.dart` — `AuthNotifier` gerencia estado do usuário, `signInWithEmail`, `signOut`, persistência com `FlutterSecureStorage` (chave: `'current_user_id'`).
  - Outros providers: `users_provider`, `report_provider`, `color_game_provider` — expõem dados para as páginas.

- **Rotas**: definidas em `lib/app.dart` (ex.: `/login`, `/signup`, `/home`, `/color-game`, `/memory-game`, etc.).

---

### web/ 🌐
- `index.html` — adiciona carregamento de `sql-wasm.wasm` e configuração `createSqlJsConfig` para evitar problemas de MIME/CORS; contém `flutter_bootstrap.js` do build.
- **Observação**: evitamos redirecionamento do servidor que pode retornar `index.html` para a requisição do wasm (isso causa o erro "expected magic word"). Por isso, em dev, `sql-wasm.wasm` foi trazido para `web/`.

---

### Plataformas (android/ios/linux/macos/windows) 🛠️
- Diretórios `android/`, `ios/`, `linux/`, `macos/`, `windows/` contêm artefatos nativos e runners gerados pelo Flutter.
- Arquivos gerados (`generated_plugin_registrant.*`) aparecem e podem variar por plataforma.

---

### Testes e CI ✅
- `test/` — contém testes unitários e de widget (ex.: `widget_test.dart`, usecases tests).
- `.github/workflows/flutter-ci.yml` — workflow básico para análise e testes (verifique se está habilitado no repositório remoto).

---

## Como rodar localmente (resumo) ▶️
1. Clone / leia `README.md` e instale o Flutter.
2. `flutter pub get`
3. Para web: `flutter run -d chrome` (o projeto já inclui `sql-wasm.wasm` em `web/` para evitar problemas de MIME em dev).
4. Testes: `flutter test`.
5. Analyzer: `flutter analyze`.

---

## Pontos de melhoria / To-do técnico ✨
- Migrar `drift/web.dart` → `drift/wasm.dart` para compatibilidade web mais moderna.
- Substituir `FakeAuthRepository` (web) por integração completa com Firebase Auth (incluir social logins se necessário).
- Implementar testes de integração (signup→login→home), e adicionar checks no CI.
- Revisar tratamentos de segurança (senhas, armazenamento seguro, tokens) antes de deploy em produção.

---

## Referências rápidas 🧾
- Rotas principais: definidas em `lib/app.dart` (`/home`, `/color-game`, `/memory-game`, `/reports`, ...).
- Persistência de sessão: `FlutterSecureStorage` com chave `current_user_id` (ver `auth_provider.dart`).
- DB web: `web/sql-wasm.wasm` + `web/index.html` (`createSqlJsConfig`).

---

Se quiser, eu adiciono exemplos de diagramas simples (arquitetura) ou gero um `README` de módulos em versão curta para a home do repositório. Quer que eu também commite este arquivo e envie para o repositório? (responda: `sim` ou `não`)