import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Entrar')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: _passCtrl, decoration: const InputDecoration(labelText: 'Senha'), obscureText: true),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: authState.loading
                  ? null
                  : () async {
                      final user = await ref.read(authNotifierProvider.notifier).signInWithEmail(_emailCtrl.text.trim(), _passCtrl.text.trim());
                      if (user != null) {
                        if (!mounted) return;
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushReplacementNamed('/home');
                      }
                    },
              child: authState.loading ? const CircularProgressIndicator() : const Text('Entrar'),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Não tem conta? "),
                TextButton(onPressed: () => Navigator.of(context).pushNamed('/signup'), child: const Text('Criar conta'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
