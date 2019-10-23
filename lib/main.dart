import 'package:flutter/material.dart'; 
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
    title: 'Lista de Produtos',
    home: ListaProduto(),
    );
  }
}

class ListaProdutoState extends State<ListaProduto>{
  final _suggestions = <String>[
    "Corretivo líquido", "Blush em pó", "Lápis Marrom Cremoso", "Sombra Marrom Opaca", "Fixador de Sombra", "Pó Compacto", "Delineador", "Paleta de Sombras" ];
  final Set<String> _saved = Set<String>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos Maquiagem'),
      ),
      body: buildSuggestions(),
  
  );
 }
  Widget buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          return null;
        }
        return _buildRow(_suggestions[index]);
      });
  }
  Widget _buildRow(String string){
    final bool alreadySaved = _saved.contains(string);
    return ListTile(
      title: Text(string, style: _biggerFont
      ),
      trailing: Icon(
        alreadySaved ? Icons.check_box : Icons.check_box_outline_blank,
        color: alreadySaved ? Colors.greenAccent : null,
      ),
      onTap: () {
        setState((){
           if (alreadySaved) {
             _saved.remove(string);
           } else {
             _saved.add(string);
           }
        });
      }
    );
  }
}
class ListaProduto extends StatefulWidget {
  @override 
  ListaProdutoState createState() => ListaProdutoState();
}