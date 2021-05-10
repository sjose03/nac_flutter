import 'package:lista_cursos/models/roupas_model.dart';

import 'database.dart';

class RoupasRepository {
  Future<List<RoupasModel>> findAllAsync() async {
    var db = Database();
    await db.createDatabase();

    List<RoupasModel> roupas = new List<RoupasModel>();

    if (db.created) {
      roupas = new List<RoupasModel>();
      roupas.add(
        new RoupasModel(
          id: 1,
          nome: 'Casaco de Pelo',
          temporada: 'Inverno',
          descricao:
              'O casaco de pelo complementa os looks mais estilosos de inverno e é um item pra lá de sofisticado. Além de te deixar aquecida nos dias mais frios, os diversos modelos e cores da peça permitem composições autênticas e nada óbvias.',
        ),
      );
      roupas.add(
        RoupasModel(
          id: 2,
          nome: 'Camisas Estampadas',
          temporada: 'Verão',
          descricao:
              'Uma das melhores e maiores tendências de moda masculina para 2019 é usar camisas masculinas estampadas.Elas chegarão com tudo e em vários estilos diferentes; as de manga curta, entretanto, serão as melhores opções para o verão e para os dias mais quentes!.',
        ),
      );
      roupas.add(
        RoupasModel(
          id: 3,
          nome: 'Boné',
          temporada: 'Todas',
          descricao:
              'O boné é um dos acessórios mais tradicionais da moda masculina. Mas até hoje, ele ainda divide opiniões.Se você quer um look mais casual — com camiseta, calça jeans, etc — o boné de aba curva é uma excelente opção. Quanto mais minimalista, melhor. Pode até ser monocromático, no máximo com algum detalhe frontal. A cor preta é a mais versátil, porque combina com qualquer outfit.',
        ),
      );
    }

    return new Future.value(roupas);
  }
}
