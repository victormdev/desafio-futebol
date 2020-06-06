class Time {
  final int id, ano;
  String nome;
  String estado;
  Time(this.id, this.estado, this.nome, this.ano);
  factory Time.fromJson(Map<String, dynamic> time) =>
      Time(_toInt(time['id']), time['estado'], time['nome'], time['ano']);
  Map toJson() => {'id': id, 'estado': estado, 'nome': nome, 'ano': ano};
}
int _toInt(id) => id is int ? id : int.parse(id);