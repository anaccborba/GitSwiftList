# GitSwiftList

O app GitSwiftList fornece uma lista de repositórios Swift, elencados do maior número de estrelas para o menor, ao clicar em cada um dos repositórios somos direcionados a uma tela com os Pull Requests abertos daquele repositório e se clicarmos em algum desses Pull Requests somos direcionados a uma WebView com os detalhes do Pull Request

Para o desenvolvimento da aplicação foi utilizada a arquitetura MVVM, dado que a aplicação não é complexa foi escolhida uma arquitetura sem muitas camadas em comparação a VIPER por exemplo, porém a arquitetura foi contruida de forma a não ser somente desacoplada e testável, como também fácil de escalar, já que ficaram separadas as camadas de view, serviço, view model e coordinador, sendo muito fácil de evoluir para uma arquitetura mais complexa. Cada feature está desacoplada e também foi feito um "módulo" de Design System, que poderiamos num futuro até mesmo transformarmos em uma lib externa ao projeto, para que o mesmo possa ser usado por outros repositórios.

A aplicação usa como gerenciador de dependência o Swift Package e foram utilizados os seguintes pacotes:

Lottie -> Para construção de animações, tanto da splash quando do loading
SnapKit -> Para melhoras a visibilidade e legibilidade da construção das constraints
Alamofire -> Para melhorar a visibilidade e legibilidade da camada de Serviço

A aplicação foi construída interamente utilizando view code, todas as telas usam componentes reutilizáveis, que foram desenvolvidas no Design System da aplicação, sendo assim de fácil manutenção e fácil incrementação das telas.
Apesar de serem muito parecidas as telas de Repositórios e Pull Requests optei por fazer telas apartadas, para que as mesmas não fiquem acopladas, já que normalmente temos muitos incrementos e modificações do time de produto, assim facilitamos futuras modificações.

A execução do projeto é simples não exige nenhum tipo de usuário, basta rodar a aplicação com acesso a internet.
