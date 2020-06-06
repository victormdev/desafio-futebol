class Time {
  final int ano, id;
  String nome;
  String estado;
  Time(this.id, this.nome, this.estado, this.ano);
  factory Time.fromJson(Map<String, dynamic> time) =>
      Time(_toInt(time['id']), time['nome'], time['estado'], time['ano']);
      Map toJson() => {'id': id, 'nome': nome, 'estado': estado, 'ano': ano};
}
int _toInt(id) => id is int ? id : int.parse(id);