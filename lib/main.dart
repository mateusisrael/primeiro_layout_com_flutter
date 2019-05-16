// 14 de abril de 2019, Mateus Israel
// Tutorial de layouts, Flutter
// https://flutter.dev/docs/development/ui/layout/tutorial


import 'package:flutter/material.dart';

void main() {
  runApp(WidgetPrincipal());
}


class WidgetPrincipal extends StatelessWidget{
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Layout Demo'),
        ),

        body: ListView(
          children: <Widget>[
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),

            titleSection,
            buttonSection,
            textSection,

          ],
        ),
      ),
    );
  }
}


// Textos de Titulo
Widget titleSection = Container(
  color: Colors.white70,
  padding: EdgeInsets.all(32),
  child: Row(
    children: <Widget>[
      Expanded(
        // 1
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 2
            Container(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
            Text(
              'Kandersteg, Switezerland',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            )

          ],
        ),
      ),
      Icon(
        Icons.star,
        color: Colors.red[500]
      ),
      Text('41'),
      
    ],
  ),
);


// Construtor da linha de ícones
Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,

    children: <Widget>[
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );
}


// Montando a linha de ícones para jogar no widget principal usando apenas o objeto 'buttonSection'
Widget buttonSection = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
      _buildButtonColumn(Colors.blue, Icons.near_me, 'ROUTE'),
      _buildButtonColumn(Colors.blue, Icons.share, 'SHARE'),

    ],
  ),
);


Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text('Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true, ), // Definindo softwrap como true, as linhas de texto preencherão a largura da coluna antes de quebrar em um limite de palavra
);