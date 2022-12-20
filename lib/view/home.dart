import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  //seleção da opção para o computador
  String _resultado = "";
  String _appImage = "base_quadrado";

  void _jogadaApp(String jogador){
    final List<String> _opcoes = [
      "GUERREIRO",
      "ROBO",
      "ZUMBI"
    ];
    int app = Random().nextInt(3);

    switch (_opcoes[app]) {
      case "GUERREIRO":
        _appImage = "guerreiro";
        if(jogador == "GUERREIRO"){
          setState(() {
            _resultado = "EMPATE!";
          });
        } else if(jogador == "ROBO"){
          setState(() {
            _resultado = "VOCÊ VENCEU!";
          });
        } else {
          setState(() {
            _resultado = "VOCÊ FOI DERROTADO!";
          });
        }
        break;

      case "ROBO":
        _appImage = "robo";
        if(jogador == "GUERREIRO"){
          setState(() {
            _resultado = "VOCÊ FOI DERROTADO!";
          });
        } else if(jogador == "ROBO"){
          setState(() {
            _resultado = "EMPATE!";
          });
        } else {
          setState(() {
            _resultado = "VOCÊ VENCEU!";
          });
        }
        break;

      case "ZUMBI":
        _appImage = "zumbi";
        if(jogador == "GUERREIRO"){
          setState(() {
            _resultado = "VOCÊ VENCEU!";
          });
        } else if(jogador == "ROBO"){
          setState(() {
            _resultado = "VOCÊ FOI DERROTADO!";
          });
        } else {
          setState(() {
            _resultado = "EMPATE!";
          });
        }
        break;

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MUTANTS GENETIC GLADIATORS",
          style: TextStyle(
            fontWeight: FontWeight.w900,
          )
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 116, 116, 116),
        elevation: 15,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        color: const Color.fromARGB(99, 255, 255, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/$_appImage.png"),
            const Text(
              "MAKE YOUR CHOICE!",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _jogadaApp("GUERREIRO"),
                  child: Image.asset("images/guerreiro.png"),
                ),
                GestureDetector(
                  onTap: () => _jogadaApp("ROBO"),
                  child: Image.asset("images/robo.png"),
                ),
                GestureDetector(
                  onTap: () => _jogadaApp("ZUMBI"),
                  child: Image.asset("images/zumbi.png"),
                )
              ],
            ),
            Text(
              _resultado,
              style: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}