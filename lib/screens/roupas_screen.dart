import 'package:flutter/material.dart';
import 'package:nac_flutter/models/roupas_model.dart';
import 'package:nac_flutter/repository/roupas_repository.dart';

class RoupasScreen extends StatefulWidget {
  @override
  _RoupasScreenState createState() => _RoupasScreenState();
}

class _RoupasScreenState extends State<RoupasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247, 127, 0, .9),
        title: Text("Tipos de Roupas"),
      ),
      body: FutureBuilder<List<RoupasModel>>(
        future: RoupasRepository().findAllAsync(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildListView(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView buildListView(List<RoupasModel> roupas) {
    return ListView.builder(
      itemCount: roupas == null ? 0 : roupas.length,
      itemBuilder: (BuildContext ctx, int index) {
        return cardRoupa(roupas[index]);
      },
    );
  }

  Card cardRoupa(RoupasModel roupas) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ((roupas.id == 1
              ? Color.fromRGBO(0, 48, 73, .9)
              : roupas.id == 2
                  ? Color.fromRGBO(214, 40, 40, .9)
                  : Color.fromRGBO(252, 191, 73, .9))),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          title: Text(
            roupas.nome,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(left: 1.0),
                  child: Text(
                    "Temporada:",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 1.0),
                  child: Text(
                    roupas.temporada,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              "/roupas_detalhes",
              arguments: roupas,
            );
          },
        ),
      ),
    );
  }
}
