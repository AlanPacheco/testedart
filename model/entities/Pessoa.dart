//import '../../DB/Database.dart';
import 'Endereco.dart';
import 'package:sprintf/sprintf.dart';
import 'package:intl/intl.dart';

class Pessoa {
  static int _countPessoa = 0;
  int _id;
  String _nome;
  String _cpfCnpj;
  DateTime _dataNascimento;
  String _email;
  String _telefone;
  Endereco _endereco;

  Pessoa(String nome, String cpfCnpj, String email, [DateTime dataNascimento, 
          String telefone, Endereco endereco]) {
    this._id = ++Pessoa._countPessoa;
    this._nome = nome;
    this._cpfCnpj = cpfCnpj;
    this._dataNascimento = dataNascimento;
    this._email = email;
    this._telefone = telefone;
    this._endereco = endereco;
  }

  get id => _id;
  get nome => _nome;
  get cpfCnpj => _cpfCnpj;
  get dataNascimento => _dataNascimento;
  get email => _email;
  get telefone => _telefone;
  get endereco => _endereco;

  set nome(String nome) => this._nome = nome;
  set cpfCnpj(String cpfCnpj) => this._cpfCnpj = cpfCnpj;
  set dataNascimento(DateTime dataNascimento) => this._dataNascimento = dataNascimento;
  set email(String email) => this._email = email;
  set telefone(String telefone) => this._telefone = telefone;
  set endereco(Endereco endereco) => this._endereco = endereco;

  // void printPessoa() {
  //   print('\n'
  //       'ID: $_id, \n'
  //       'Nome: $_nome, \n'
  //       'Cpf/Cnpj: $_cpfCnpj, \n'
  //       'Data de Nascimento: $_dataNascimento, \n'
  //       'Email: $_email, \n'
  //       'Telefone: $_telefone, \n'
  //       'Endereço: ${_endereco ?? 'não informado'} \n');
  // }


    void printPessoa() {
    print(sprintf('|%-2d |%-24s |%-18s |%-12s |%-24s |%-14s', [_id,_nome,_cpfCnpj,DateFormat('dd/MM/yyyy').format(_dataNascimento),_email,_telefone]));
  }

}
