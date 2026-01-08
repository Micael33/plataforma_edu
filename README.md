# plataforma_edu — O Caminho do Saber

Aplicativo educacional inclusivo voltado para crianças com TDAH e TEA.

## Objetivo
Esqueleto inicial com Clean Architecture, Riverpod, autenticação mínima e infraestrutura pronta para evoluir.

## Como rodar localmente
1. Instale o Flutter SDK (estável).
2. Execute: `flutter pub get`.
3. Configure Firebase (opcional para desenvolvimento): adicione `google-services.json` (Android) e `GoogleService-Info.plist` (iOS) seguindo a documentação do Firebase.
   - Observação: para testes locais sem Firebase, comente `await Firebase.initializeApp()` em `lib/src/core/di/injector.dart`.
4. Rode o app: `flutter run`.

## Testes
- Unit tests: `flutter test` (já incluí um teste de exemplo para o UseCase de login).
- Lint & analyze: `flutter analyze`.

## Estrutura do projeto (inicial)
- lib/src/presentation — UI, páginas e providers (Riverpod)
- lib/src/domain — entidades, casos de uso e interfaces de repositórios
- lib/src/data — implementações de repositórios e datasources
- lib/src/core — DI e utilitários

## Próximos passos e prioridades
- Modelagem de dados e integração com SQLite (Drift)
- Implementar perfis (Criança, Responsável, Educador)
- Implementar atividades educativas (MVP) com adaptações de dificuldade
- Rotinas, gamificação e relatórios
- Acessibilidade completa (TTS, ajustes de contraste e fontes, WCAG adaptado para crianças)

## Guidelines rápidas
- State management: Riverpod
- Arquitetura: Clean Architecture
- Testes: unitários e de integração

## Contato
- Repositório e issues: https://github.com/Micael33/plataforma_edu

