class Endereco {
  static int _countEndereco = 0;

  int _id;
  String _logradouro;
  String _numero;
  String _bairro;
  String _cidade;
  String _estado;

  Endereco(this._logradouro,this._numero,this._cidade,this._estado,  ) {
            _id = ++Endereco._countEndereco;
  }   

  get id => _id;
  get logradouro => _logradouro;
  get numero => _numero;
  get bairro => _bairro;
  get cidade => _cidade;
  get estado => _estado;

}
