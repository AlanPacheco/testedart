import '../entities/Pessoa.dart';
import '../../DB/Database.dart';

import 'PessoaDAO.dart';

class PessoaDAOMemory implements PessoaDAO {
  List<Pessoa> pessoas = Database.pessoas;

//================

  @override
  void insert(Pessoa pessoa) {
    pessoas.add(pessoa);
  }

  @override
  bool update(Pessoa pessoa) {
    for (var i = 0; i < pessoas.length; i++) {
      if (pessoas[i].id == pessoa.id) {
        pessoas[i].nome = pessoa.nome;
        pessoas[i].cpfCnpj = pessoa.cpfCnpj;
        pessoas[i].dataNascimento = pessoa.dataNascimento;
        pessoas[i].email = pessoa.email;
        pessoas[i].telefone = pessoa.telefone;
        pessoas[i].endereco = pessoa.endereco;
      }
    }
    return true;
  }

  @override
  bool deleteById(int id) {
    if (_indexExist(id)) {
      pessoas.removeWhere((pessoa) => pessoa.id == id);
      return true;
    }
    return false;
  }

  @override
  Pessoa findById(int id) {
    if (_indexExist(id)) {
      return pessoas.singleWhere((pessoa) => pessoa.id == id);
    }
    return null;
  }

  @override
  List<Pessoa> findAll() {
    if (pessoas.isNotEmpty) {
      return pessoas;
    }
    return null;
  }

  bool _indexExist(int id) {
    if (pessoas.isNotEmpty) {
      var index = pessoas.indexWhere((pessoa) => pessoa.id == id);
      if (index > -1) {
        return true;
      }
    }
    return false;
  }
}
