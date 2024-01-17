import 'dart:developer';

Future<void> main() async {
  log('Inicio');
  const interval = Duration(seconds: 2);
  //! 1º Parâmetro
  //A stream.periodic espera um periodo cujo especificará o periodo que irá rodar e neste caso é um periodo de 2 segundos

  //! 2º Parâmetro
  /*
  A stream espera algum função callback cujo retornará algum valor que a Stream espera. Neste caso ela espera
  um tipo "int" e a nossa função "callback irá receber um valor, incrementar +1 neste valor e multiplica-lo por 2"
  */
  var stream = Stream<int>.periodic(interval, callback);

  //enquanto o numero for menor que 10, a stream nao ira parar
  stream = stream.takeWhile((int numero) => numero < 10);

  //No caso das streams, utilizamos do await cujo sera executado apenas quando a Stream receber algum valor
  await for (var i in stream) {
    log(i.toString());
  }
  log('FIM');
}

int callback(int value) {
  return (value + 1) * 2;
}
