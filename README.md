# Flutter Produtos Json Funcionários
Exemplo de um app flutter que **abre dados Mockup** JSON, uma lista de funcionários.<br>Exemplo de arquivos de estilização com paleta de cores e tema.

## Tecnologias
- Flutter
- VsCode
- Android Studio

|Efeitos|WidGets|
|-|:-:|
|Tema|ThemeData.light().copyWith()|
|Imagens|Image.asset()|
|Assincronicidade|async|
|Carregar arquivos texto locais|rootBundle.loadString('assets/..');|
|Conversão de dados|json.encode(), json.decode()|
|Menu dropDown "Select"|DropdownButton<dynamic>()|
|Botões de controle de conteúdos em tela|ElevatedButton()|

|![Splash](./assets/info/splash.png)|![Home](./assets/info/home.png)|![Home](./assets/info/menu.png)|
|:-:|:-:|:-:|
|Splash|Home|Menu|

# Para testar
- 1 Clone o repositório
- 2 Abra com VsCode, Abra o trminal **CTRL + "**, execute o comando `flutter pub get` para instalar as dependências
- 3 Navegue até o arquivo lib/main.dart e dê **play** ou execute o comando `flutter run` para rodar o projeto
- 4 Escolha navegador ou um emulador para testar, ou abra o arquivo */lib/main.dart* e clique em Play.
- O projeto irá abrir a tela de Splash com uma animação, clique em entrar e navegue pelos produtos.