#Api de Máquinas e Aplicações

Essa RESTfull api foi desenvolvida com rails 4 e mongoid. É necessário uma conexão com o mongodb para que a api funcione, a mesma pode ser configurada no aqrquivo "config/mongoid.yml". Todas as dependencias do projeto estão listadas no Gemfile, portanto, após clonar o repositório é necessário rodar o ```bundle``` dentro do diretório do projeto para que as mesmas possam ser instaladas.

###Rails vs Rails-Api
Uso a gem rails-api nesse projeto para que alguns módulos que não são necessários no desenvolvimento de uma api sejam ignorados afim de que a performance seja melhor.

###Testes e configurações
* É necessário que antes de rodar a aplicação, sejam criados os indices no mongodb. É tão simples quanto executar: ```bundle exec rake db:mongoid:create_indexes```.
* Para rodar os testes basta executar: ```bundle exec rspec```.

#####Test Coverage
Apesar de implementar uma simples autenticação via token não a deixei disponível nessa versão pois não obtive sucesso durante os testes, portanto, a linha de código que habilitaria a mesma está comentada em "controllers/api_controller.rb".
Contudo, sinta-se a vontade para adicionar o teste faltante. Existe um post no stackoverflow tratando do problema e assim que eu descobrir a solução do erro eu implemento aqui.

###NodeJs
Em um tempo que sobrou eu tentei fazer a mesma api porém, usando nodejs. Ainda não tá completa mas, já tem o esqueleto e algum código. Você pode dar uma olhada aqui: https://github.com/felippemr/testGlobocomNode




##I hope you like it!
