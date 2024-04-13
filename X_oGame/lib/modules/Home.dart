
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:xogame/modules/Gamepage.dart';

class MyApp extends StatefulWidget {

   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String activePlayer='x';

  bool gameOver=false;

  int turn =0;

  String result ='';

   Game g =Game();

   bool isSwitched =false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor:const Color(0xFF00061a),
        shadowColor: const Color(0xFF001456),
        splashColor: const Color(0xFF4169e8),

      ),
      home:Scaffold(
        backgroundColor:const  Color(0xFF00062a),
        body: SafeArea(
           child:Column(
             children: [
               SwitchListTile.adaptive(
                 title:const Text('Turn On/Off two PLayer ',style: TextStyle(
                   color: Colors.white,
                   fontSize: 28,
                 ),
                 textAlign: TextAlign.center,
                 ),
                   value: isSwitched,
                   onChanged: (bool newValue){
                   setState(() {
                     isSwitched=newValue;

                   });
                   }),
                Text("It's  $activePlayer turn  ".toUpperCase(),
                   style:const  TextStyle(
                   color: Colors.white,
                    fontSize: 52,
        ),
                    textAlign:TextAlign.center ),


               Expanded(
                   child:GridView.count(
                     padding: const EdgeInsets.all(16),
                      crossAxisCount: 3,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                       childAspectRatio: 1.0,
                      children:List.generate(9, (index) =>InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: gameOver ? null:()=> _onTap(index),
                        child: Container(
                          decoration: BoxDecoration(
                            color:const Color(0xFF001456),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(Player.playerX.contains(index)?'x':Player.playerO.contains(index)?'o':'',
                              style: TextStyle(
                              color: Player.playerX.contains(index)
                                  ?Colors.blue
                                  :Colors.pink,
                              fontSize: 52,),
                            ),
                          ),
                        ),
                      )
                      ),
                   )
               ),





               Text(result,
                   style:const  TextStyle(
                     color: Colors.white,
                     fontSize: 42,
                   ),
               textAlign:TextAlign.center ,),
               ElevatedButton.icon(onPressed: (){
                 setState(() {
                   Player.playerX=[];
                   Player.playerO=[];
                   activePlayer='x';
                    gameOver=false;
                    turn =0;
                    result ='';
                 });
               },
                   icon: const Icon(Icons.replay),
                   label:const Text('Repeat the game '),
                   style:ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(Theme.of(context).splashColor),
                   ),

               ),

             ],
           ),
        ),
      ),
    );
  }

  _onTap(int index) async{

    if((Player.playerX.isEmpty||!Player.playerX.contains(index))&&
        (Player.playerO.isEmpty||!Player.playerO.contains(index))) {
      g.playGame(index, activePlayer);
      updateState();
      if(!isSwitched&&!gameOver&& turn!=9){
        await g.utoPlay(activePlayer);
       updateState();
      }
    }
  }

  void updateState(){
    setState(() {
      activePlayer =(activePlayer=='x')?'o':'x';
      turn++;
      String winnerPlayer=g.checkWinner();
    if(winnerPlayer!=''){
      gameOver=true;
     result="$winnerPlayer is the winner ";
    }
    else if(!gameOver&&turn==9){
      result="it's Draw!";
    }

    });
  }
}
