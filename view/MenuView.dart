import 'package:intl/intl.dart';
import 'dart:io';
import '../model/entities/Pessoa.dart';
import '../controller/ControllerFactory.dart';
import 'package:dart_console/dart_console.dart';

class MenuView {
  static void start() {
    var iController = ControllerFactory.createPessoaController();
    var opcao;
    _clearScreen();

    do {
      _loadMenu();
      opcao = stdin.readLineSync();
      switch (opcao) {
        case '1':
          {
            MenuView._clearScreen();
            _screenInsert();
            print('Informe nome e sobrenome:');
            var nome = stdin.readLineSync();
            _clearScreen();
            _screenInsert();
            print('Informe cpf/cnpj:');
            var cpfCnpj = stdin.readLineSync();
            _clearScreen();
            _screenInsert();
            print('Informe data de Nascimento (ex: 23/11/2015) ');
            dynamic dataNascimento = stdin.readLineSync();
            var dateFormat = DateFormat('dd/MM/yyyy');
            dataNascimento = dateFormat.parse(dataNascimento);
            _clearScreen();
            _screenInsert();
            print('Informe email:');
            var email = stdin.readLineSync();
            _clearScreen();
            _screenInsert();
            print('Informe telefone:');
            var telefone = stdin.readLineSync();
            var newPessoa =
                Pessoa(nome, cpfCnpj, email, dataNascimento, telefone);
            iController.insert(newPessoa);
            _clearScreen();
            print('ID: ${newPessoa.id} cadastrado com Sucesso!');
            break;
          }
        case '2':
          {
            MenuView._clearScreen();
            _screenList();
            var pessoas = iController.findAll();
            if (pessoas != null) {
              pessoas.forEach((element) => {element.printPessoa()});
            } else {
              print('Não existem pessoas cadastradas.');
            }
            // print('_______________________________________________\n');
            break;
          }
        case '3':
          {
            MenuView._clearScreen();
            _screenUpdate();
            var pessoas = iController.findAll();
            if (pessoas != null) {
              pessoas.forEach((element) => {element.printPessoa()});
            } else {
              print('Não existem pessoas cadastradas.');
              break;
            }
            print('\nInforme o ID da pessoa para alteração.');
            var id = int.parse(stdin.readLineSync());
            var pessoa = iController.findById(id);
            if (pessoa != null) {
              _clearScreen();
              _screenUpdate();
              pessoa.printPessoa();
              var optionField;
              do {
                optionField = _menuFieldsToEdit();
                switch (optionField) {
                  case '1':
                    {
                      var edited = _editField('nome', pessoa);
                      if (edited) {
                        print('Nome Atualizado com Sucesso!');
                      } else {
                        print('Ocorreu falha na Atualizacao!');
                      }
                      break;
                    }
                  case '2':
                    {
                      var edited = _editField('cpf/cnpj', pessoa);
                      if (edited) {
                        print('Cpf/Cnpj Atualizado com Sucesso!');
                      } else {
                        print('Ocorreu falha na Atualizacao!');
                      }
                      break;
                    }
                  case '3':
                    {
                      var edited = _editField('data de nascimento', pessoa);
                      if (edited) {
                        print('Data de Nascimento Atualizado com Sucesso!');
                      } else {
                        print('Ocorreu falha na Atualizacao!');
                      }
                      break;
                    }
                  case '4':
                    {
                      var edited = _editField('email', pessoa);
                      if (edited) {
                        print('Email Atualizado com Sucesso!');
                      } else {
                        print('Ocorreu falha na Atualizacao!');
                      }
                      break;
                    }
                  case '5':
                    {
                      var edited = _editField('telefone', pessoa);
                      if (edited) {
                        print('Telefone Atualizado com Sucesso!');
                      } else {
                        print('Ocorreu falha na Atualizacao!');
                      }
                      break;
                    }
                  default:
                    {
                      _clearScreen();
                      break;
                    }
                }
              } while (optionField != '0');
            } else {
              _clearScreen();
              print('ID - $id não localizado.');
            }
            break;
          }
        case '4':
          {
            MenuView._clearScreen();
            _screenDelete();
            var pessoas = iController.findAll();
            if (pessoas == null || pessoas.isEmpty) {
              print('Não existem pessoas cadastradas.');
              break;
            }
            pessoas.forEach((element) => {element.printPessoa()});
            print('\n_____________________________________________');
            print('Informe o ID da pessoa para remover cadastro.');
            var id = int.parse(stdin.readLineSync());
            var pessoa = iController.findById(id);
            MenuView._clearScreen();
            if (iController.deleteById(id)) {
              print(
                  'ID: $id ${pessoa != null ? '- ${pessoa.nome}.' : ''} Removido com Sucesso!');
            } else {
              print('ID: $id não encontrado!');
            }
            break;
          }
        default:
          {
            print('\nSaindo...');
            break;
          }
      }
    } while (opcao != '0');
  }

  static void _loadMenu() {
    print('_______________________________________________________');
    print('Digite o número correspondente a operação desejada:\n');
    print('1 - Cadastrar pessoa');
    print('2 - Listar pessoas');
    print('3 - Alterar uma pessoa');
    print('4 - Deletar uma pessoa');
    print('0 - Sair');
    print('------');
    // print('\n');
  }

  static String _menuFieldsToEdit() {
    print('_________________________________________________');
    print('Digite o número do campo que deseja editar:');
    print('1 - Nome');
    print('2 - Cpf/Cnpj');
    print('3 - Data de Nascimento');
    print('4 - Email');
    print('5 - Telefone');
    print('0 - Encerrar');
    return stdin.readLineSync();
  }

  static bool _editField(String nameField, Pessoa pessoa) {
    var iController = ControllerFactory.createPessoaController();
    _clearScreen();
    _screenUpdate();
    pessoa.printPessoa();
    print('\nInforme $nameField para alteração:');
    var newNameField = stdin.readLineSync();
    print('Deseja Confirmar?');
    print('1 - (Sim) , 2 - (Não)');
    var save = stdin.readLineSync();
    if (save == '1') {
      switch (nameField) {
        case 'nome':
          {
            pessoa.nome = newNameField;
            break;
          }
        case 'cpf/cnpj':
          {
            pessoa.cpfCnpj = newNameField;
            break;
          }
        case 'data de nascimento':
          {
            pessoa.dataNascimento =
                DateFormat('dd/MM/yyyy').parse(newNameField);
            break;
          }
        case 'email':
          {
            pessoa.email = newNameField;
            break;
          }
        case 'telefone':
          {
            pessoa.telefone = newNameField;
            break;
          }
      }
      if (iController.update(pessoa)) {
        _clearScreen();
        _screenUpdate();
        pessoa.printPessoa();
        return true;
      }
    }
    return false;
  }

  static void _clearScreen() {
    final console = Console();
    console.clearScreen();
    print('|---------------------------------------|');
    print('|   PROGRAMA PARA CADASTRO DE PESSOAS   |');
    print('|---------------------------------------|\n');
  }

  static void _screenInsert() {
    print('Selected option: 1');
    print('----------------------------');
    print('-- ENTRADA DE INFORMAÇÕES --\n');
    // print('----------------------\n');
  }

  static void _screenList() {
    print('Selected option: 2');
    print('----------------------');
    print('-- LISTA DE PESSOAS --\n');
    // print('----------------------');
  }

  static void _screenUpdate() {
    print('Selected option: 3');
    print('---------------------');
    print('--  EDITAR PESSOA  --\n');
  }

  static void _screenDelete() {
    print('Selected option: 4');
    print('----------------------');
    print('--  REMOVER PESSOA  --\n');
  }
}
