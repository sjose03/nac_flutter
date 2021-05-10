import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_cursos/models/roupas_model.dart';

class RoupasDetalhesScreen extends StatelessWidget {
  RoupasModel roupasModel;

  @override
  Widget build(BuildContext context) {
    roupasModel = ModalRoute.of(context).settings.arguments;
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 80.0),
        SizedBox(height: 10.0),
        Text(
          roupasModel.nome,
          style: TextStyle(
            color: Colors.white,
            fontSize: 45.0,
          ),
        ),
        SizedBox(height: 22.7),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Expanded(
            //   flex: 1,
            //   child: levelIndicator,
            // ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  roupasModel.temporada,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: roupasModel.id == 1
                  ? new AssetImage("casaco.PNG")
                  : roupasModel.id == 2
                      ? new AssetImage("camisa_estampada.jpg")
                      : new AssetImage("bone.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: ((roupasModel.id == 1
                  ? Color.fromRGBO(0, 48, 73, .5)
                  : roupasModel.id == 2
                      ? Color.fromRGBO(214, 40, 40, .5)
                      : Color.fromRGBO(252, 191, 73, .5)))),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      roupasModel.descricao,
      style: TextStyle(fontSize: 18.0),
      textAlign: TextAlign.justify,
    );
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            bottomContentText,
          ],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          topContent,
          bottomContent,
        ],
      ),
    );
  }
}
