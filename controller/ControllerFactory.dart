import 'PessoaController.dart';
import 'IController.dart';

class ControllerFactory{
  static IController createPessoaController(){
    return PessoaController();
  }
}