# primeiroapp

## Funcionalidades

    - Login
    - Cadastro
    - Recuperar Senha
    - Redirecionamento para tela principal do app
    - Armazenar os usuários e acessos no painel do Firebase
    - Subir e restaurar imagem do perfil pela câmera ou pela galeria do app

## Tópicos

### Dependências

- get
    - Navegação de telas
    - Gerenciamento de dependencias (bind e controllers)
    - Observers e Gerenciamento de Estado

- Firebase related
    - firebase_auth: ^5.3.3
    - firebase_core: ^3.8.0
    - firebase_ui_auth: ^1.16.0
    - firebase_ui_localizations: ^1.13.0

- image_picker: ^1.1.2

- Formatação: 
    intl: ^0.19.0

### Launcher Icons

- Icons de carregamento (Android, IOS ou Web)
- Miniatura do app no celular
- Comandos
```
    flutter pub get
    flutter pub run flutter_launcher_icons
```

### Splash Screen

    - Tela de inicialização dos aplicativos (geralmente tem a logo da empresa ou do app)

### Autenticação
    
    - Comunica com um servidor externo para realizar a autenticação 
    - Identificação do usuário e redirecionamento para as funcionalidades
    - Restaurar o usuário que já fez o login anteriormente na aplicação

### Handle de imagens
    
    - Subir as imagens e restaurar elas do storage
 
### Home Screen

    - Funcionalidade principal do aplicativo: salvar as despesas mensais

### Flavers