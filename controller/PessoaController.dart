import '../model/entities/Pessoa.dart';
import 'IController.dart';
import '../model/dao/DAOFactory.dart';

class PessoaController implements IController{
  var pessoaDao = DAOFactory.createPessoaDAO();

  @override
  bool deleteById(int id) {
      return pessoaDao.deleteById(id);
    }
  
    @override
    List<Pessoa> findAll() {
      return pessoaDao.findAll();
    }
  
    @override
    Pessoa findById(int id) {
      return pessoaDao.findById(id);
    }
  
    @override
    void insert(dynamic obj) {
      pessoaDao.insert(obj);
    }
  
    @override
    bool update(dynamic obj) {
      return pessoaDao.update(obj);
    }
  
}