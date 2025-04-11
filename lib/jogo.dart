import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var imagemApp = AssetImage('imagens/padrao.png');
  var mensagem = "Escolha uma opção abaixo";
  opcaoSelec(String escolaUsuario){
   

    var opcoes = ['pedra', 'papel', 'tesoura'];
    var num = Random().nextInt(3);
    var escolhaAPP = opcoes[num];
   


    switch(escolhaAPP){
      case 'pedra':
      setState(() {
        this.imagemApp =  AssetImage('imagens/pedra.png');
      });
      break;
      case 'papel':
      setState(() {
        this.imagemApp =  AssetImage('imagens/papel.png');
      });
      break;
      case 'tesoura':
      setState(() {
        this.imagemApp =  AssetImage('imagens/tesoura.png');
      });
      break;
    }
    if(
      (escolaUsuario == 'pedra' && escolhaAPP == 'tesoura') ||
      (escolaUsuario == 'tesoura' && escolhaAPP == 'papel') ||
      (escolaUsuario == 'papel' && escolhaAPP == 'pedra') 
    ){
      setState(() {
         this.mensagem = "PARABENS, VOCÊ GANHOU !!";
      });
     
    }else if (
      (escolaUsuario == 'tesoura' && escolhaAPP == 'pedra') ||
      (escolaUsuario == 'papel' && escolhaAPP == 'tesoura') ||
      (escolaUsuario == 'pedra' && escolhaAPP == 'papel') 
    ){
      this.mensagem = "Não foi dessa vez -_-";
       
    }else {
      this.mensagem = "Empate";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image:imagemApp, height: 110,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this.mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              GestureDetector(
                onTap: () => opcaoSelec('pedra'),
                child:Image.asset("imagens/pedra.png", height: 100) ,
              ),
              GestureDetector(
                onTap: () => opcaoSelec("papel"),
                child:  Image.asset("imagens/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => opcaoSelec("tesoura"),
                child:  Image.asset("imagens/tesoura.png", height: 100,),
              ),
              /*
              Image.asset("imagens/pedra.png", height: 100,),
              Image.asset("imagens/papel.png", height: 100,),
              Image.asset("imagens/tesoura.png", height: 100,)
              */
            ],
          )
        ],
      ),
    );
  }
}
