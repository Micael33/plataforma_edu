import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';


import '../../domain/entities/user.dart';
import '../../domain/repositories/users_repository.dart';
import '../providers/auth_provider.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final usersRepo = GetIt.instance.get<UsersRepository>();

    return Scaffold(
      appBar: AppBar(title: const Text('Criar Conta')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(labelText: 'Nome completo'),
                validator: (v) => (v ?? '').trim().isEmpty ? 'Informe seu nome' : null,
              ),
              TextFormField(
                controller: _emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) => (v ?? '').contains('@') ? null : 'Email inválido',
              ),
              TextFormField(
                controller: _passCtrl,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (v) => (v ?? '').length < 6 ? 'Senha curta' : null,
              ),
              TextFormField(
                controller: _confirmCtrl,
                decoration: const InputDecoration(labelText: 'Confirmar senha'),
                obscureText: true,
                validator: (v) => v != _passCtrl.text ? 'Senhas não conferem' : null,
              ),
              const SizedBox(height: 16),
              _loading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) return;
                        setState(() => _loading = true);
                        try {
                          final id = DateTime.now().microsecondsSinceEpoch.toString();
                          final user = UserEntity(id: id, name: _nameCtrl.text.trim(), email: _emailCtrl.text.trim());
                          // Attempt to add user
                          await usersRepo.addUser(user);

                          // Verify insertion
                          final check = await usersRepo.getUserById(id);
                          if (check == null) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Falha ao criar conta (inserção no DB)')));
                            return;
                          }

                          // Sign in using AuthNotifier so session and state are handled
                          final signed = await ref.read(authNotifierProvider.notifier).signInWithEmail(_emailCtrl.text.trim(), _passCtrl.text.trim());

                          if (signed == null) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erro ao autenticar após cadastro')));
                            return;
                          }

                          if (!mounted) return;
                          Navigator.of(context).pushReplacementNamed('/home');
                        } catch (e, s) {
                          // Log and surface error
                          // ignore: avoid_print
                          print('Signup error: $e\n$s');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao criar conta: $e')));
                        } finally {
                          if (mounted) setState(() => _loading = false);
                        }
                      },
                      child: const Text('Criar Conta'),
                    ),

              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Navigator.of(context).pushReplacementNamed('/login'),
                child: const Text('Já tenho conta — Entrar'),
              ),

              const SizedBox(height: 8),
              TextButton(
                onPressed: () {},
                child: const Text('Termos de uso e privacidade'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
