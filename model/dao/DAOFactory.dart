import 'PessoaDAO.dart';
import 'PessoaDAOMemory.dart';

class DAOFactory {
  static PessoaDAO createPessoaDAO() {
    return PessoaDAOMemory();
  }
}
