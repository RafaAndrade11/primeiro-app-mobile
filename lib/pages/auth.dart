import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final providers = [EmailAuthProvider()];

    return SignInScreen(

            providers: providers,
            //fazendo callbacks para mudar o estado para home ao logar e criar conta
            actions: [
              AuthStateChangeAction<SignedIn>((context, state) {
                Get.offNamed('/home');
              }),
              AuthStateChangeAction<UserCreated>((context, state) {
                Get.offNamed('/home');
                 }),
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return Image.asset('assets/icons/logo.png');
            },
            sideBuilder: (context, constraints) {
              return const SizedBox();
            },
            subtitleBuilder:(context, action) {
              final actionText = switch (action) {
                AuthAction.signIn => 'Por favor, insira as credenciais.',
                AuthAction.signUp => 'Por favor, cadastre seu email e senha.',
                _=> throw Exception('Invalid action: $action'),
              };
            return Padding(padding: const EdgeInsets.only(bottom: 8),
            child: Text('Bem vindo ao app! $actionText.'),
            );
            },
            footerBuilder:(context, action) {
              final actionText = switch (action) {
                AuthAction.signIn => 'Entrar',
                AuthAction.signUp => 'Cadastrar',
                _=> throw Exception('Invalid action $action'),
              };
              return Center(
                child: Padding(padding: const EdgeInsets.only(top: 16),
                child: Text('Após $actionText, você aceitar os termos e condições.',
                style: const TextStyle(color: Colors.grey),))
              );
            },  
                   );
  }
}