import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('O Caminho do Saber', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      TextButton(onPressed: () => Navigator.of(context).pushNamed('/login'), child: const Text('Entrar')),
                      const SizedBox(width: 8),
                      ElevatedButton(onPressed: () => Navigator.of(context).pushNamed('/signup'), child: const Text('Criar conta')),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Aprendizagem com propósito', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
                          SizedBox(height: 12),
                          Text('Plataforma de ensino que combina teoria e prática em atividades interativas para crianças e educadores.'),
                          SizedBox(height: 24),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Comece agora', style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              ElevatedButton(onPressed: () => Navigator.of(context).pushNamed('/signup'), child: const Text('Criar conta')),
                              const SizedBox(height: 8),
                              OutlinedButton(onPressed: () => Navigator.of(context).pushNamed('/login'), child: const Text('Entrar')),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
