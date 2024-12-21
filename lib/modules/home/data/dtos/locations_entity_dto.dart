import '../../domain/entities/locations_entity.dart';

// Model
class DistrictModel extends DistrictEntity {
  DistrictModel({
    required int id,
    required String nome,
    required MunicipioModel municipio,
  }) : super(id: id, nome: nome, municipio: municipio);

  factory DistrictModel.fromMap(Map<String, dynamic> map) {
    return DistrictModel(
      id: map['id'],
      nome: map['nome'],
      municipio: MunicipioModel.fromMap(map['municipio']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'municipio': (municipio as MunicipioModel).toMap(),
    };
  }
}

class MunicipioModel extends MunicipioEntity {
  MunicipioModel({
    required int id,
    required String nome,
    required RegiaoImediataModel regiaoImediata,
    required MicrorregiaoModel microrregiao,
  }) : super(
    id: id,
    nome: nome,
    regiaoImediata: regiaoImediata,
    microrregiao: microrregiao,
  );

  factory MunicipioModel.fromMap(Map<String, dynamic> map) {
    return MunicipioModel(
      id: map['id'],
      nome: map['nome'],
      regiaoImediata: RegiaoImediataModel.fromMap(map['regiao-imediata']),
      microrregiao: MicrorregiaoModel.fromMap(map['microrregiao']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'regiao-imediata': (regiaoImediata as RegiaoImediataModel).toMap(),
      'microrregiao': (microrregiao as MicrorregiaoModel).toMap(),
    };
  }
}

class MicrorregiaoModel extends MicrorregiaoEntity {
  MicrorregiaoModel({
    required int id,
    required String nome,
    required MesorregiaoModel mesorregiao,
  }) : super(id: id, nome: nome, mesorregiao: mesorregiao);

  factory MicrorregiaoModel.fromMap(Map<String, dynamic> map) {
    return MicrorregiaoModel(
      id: map['id'],
      nome: map['nome'],
      mesorregiao: MesorregiaoModel.fromMap(map['mesorregiao']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'mesorregiao': (mesorregiao as MesorregiaoModel).toMap(),
    };
  }
}

class MesorregiaoModel extends MesorregiaoEntity {
  MesorregiaoModel({
    required int id,
    required String nome,
    required UFModel uf,
  }) : super(id: id, nome: nome, uf: uf);

  factory MesorregiaoModel.fromMap(Map<String, dynamic> map) {
    return MesorregiaoModel(
      id: map['id'],
      nome: map['nome'],
      uf: UFModel.fromMap(map['UF']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'UF': (uf as UFModel).toMap(),
    };
  }
}

class RegiaoImediataModel extends RegiaoImediataEntity {
  RegiaoImediataModel({
    required int id,
    required String nome,
    required RegiaoIntermediariaModel regiaoIntermediaria,
  }) : super(id: id, nome: nome, regiaoIntermediaria: regiaoIntermediaria);

  factory RegiaoImediataModel.fromMap(Map<String, dynamic> map) {
    return RegiaoImediataModel(
      id: map['id'],
      nome: map['nome'],
      regiaoIntermediaria: RegiaoIntermediariaModel.fromMap(map['regiao-intermediaria']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'regiao-intermediaria': (regiaoIntermediaria as RegiaoIntermediariaModel).toMap(),
    };
  }
}

class RegiaoIntermediariaModel extends RegiaoIntermediariaEntity {
  RegiaoIntermediariaModel({
    required int id,
    required String nome,
    required UFModel uf,
  }) : super(id: id, nome: nome, uf: uf);

  factory RegiaoIntermediariaModel.fromMap(Map<String, dynamic> map) {
    return RegiaoIntermediariaModel(
      id: map['id'],
      nome: map['nome'],
      uf: UFModel.fromMap(map['UF']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'UF': (uf as UFModel).toMap(),
    };
  }
}

class UFModel extends UFEntity {
  UFModel({
    required int id,
    required String nome,
    required String sigla,
    required RegiaoModel regiao,
  }) : super(id: id, nome: nome, sigla: sigla, regiao: regiao);

  factory UFModel.fromMap(Map<String, dynamic> map) {
    return UFModel(
      id: map['id'],
      nome: map['nome'],
      sigla: map['sigla'],
      regiao: RegiaoModel.fromMap(map['regiao']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'sigla': sigla,
      'regiao': (regiao as RegiaoModel).toMap(),
    };
  }
}

class RegiaoModel extends RegiaoEntity {
  RegiaoModel({
    required int id,
    required String nome,
    required String sigla,
  }) : super(id: id, nome: nome, sigla: sigla);

  factory RegiaoModel.fromMap(Map<String, dynamic> map) {
    return RegiaoModel(
      id: map['id'],
      nome: map['nome'],
      sigla: map['sigla'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'sigla': sigla,
    };
  }
}


