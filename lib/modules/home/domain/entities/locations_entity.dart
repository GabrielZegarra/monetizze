class DistrictEntity {
  final int id;
  final String nome;
  final MunicipioEntity municipio;

  DistrictEntity({
    required this.id,
    required this.nome,
    required this.municipio,
  });
}

class MunicipioEntity {
  final int id;
  final String nome;
  final RegiaoImediataEntity regiaoImediata;
  final MicrorregiaoEntity microrregiao;

  MunicipioEntity({
    required this.id,
    required this.nome,
    required this.regiaoImediata,
    required this.microrregiao,
  });
}

class MicrorregiaoEntity {
  final int id;
  final String nome;
  final MesorregiaoEntity mesorregiao;

  MicrorregiaoEntity({
    required this.id,
    required this.nome,
    required this.mesorregiao,
  });
}

class MesorregiaoEntity {
  final int id;
  final String nome;
  final UFEntity uf;

  MesorregiaoEntity({
    required this.id,
    required this.nome,
    required this.uf,
  });
}

class RegiaoImediataEntity {
  final int id;
  final String nome;
  final RegiaoIntermediariaEntity regiaoIntermediaria;

  RegiaoImediataEntity({
    required this.id,
    required this.nome,
    required this.regiaoIntermediaria,
  });
}

class RegiaoIntermediariaEntity {
  final int id;
  final String nome;
  final UFEntity uf;

  RegiaoIntermediariaEntity({
    required this.id,
    required this.nome,
    required this.uf,
  });
}

class UFEntity {
  final int id;
  final String nome;
  final String sigla;
  final RegiaoEntity regiao;

  UFEntity({
    required this.id,
    required this.nome,
    required this.sigla,
    required this.regiao,
  });
}

class RegiaoEntity {
  final int id;
  final String nome;
  final String sigla;

  RegiaoEntity({
    required this.id,
    required this.nome,
    required this.sigla,
  });
}