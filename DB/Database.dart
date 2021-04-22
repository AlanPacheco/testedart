import '../model/entities/Endereco.dart';
import '../model/entities/Pessoa.dart';

class Database {
  static List<Pessoa> _pessoas = [];
  static List<Endereco> _enderecos = [];

  static List<Pessoa> get pessoas => _pessoas;
  static List<Endereco> get enderecos => _enderecos;
}
