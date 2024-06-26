import 'dart:math';

class Player{
static const x='X';
static const o='O';
static const empty ='';
static List playerX= [];
static List playerO=[];
}
extension ContainsAll on List{
  bool containsAll(int x, int y, [z]){
    if(z==null) {
      return contains(x) && contains(y) && contains(z);
    }
    else{
      return contains(x) && contains(y);

    }
    }
}
class Game{
  void playGame(int index, String activePlayer) {
    if(activePlayer=='x'){
      Player.playerX.add(index);

    }
    else{
      Player.playerO.add(index);

    }

  }
 String checkWinner(){
    String winner='';

    if(Player.playerX.containsAll(0,1,2)||
        Player.playerX.containsAll(3,4,5)||
        Player.playerX.containsAll(6,7,8)||
        Player.playerX.containsAll(0,3,6)||
        Player.playerX.containsAll(1,4,7)||
        Player.playerX.containsAll(2,5,8)||
        Player.playerX.containsAll(0,4,8)||
        Player.playerX.containsAll(2,4,6)){winner='x';}

    else if(Player.playerO.containsAll(0,1,2)||
        Player.playerO.containsAll(3,4,5)||
        Player.playerO.containsAll(6,7,8)||
        Player.playerO.containsAll(0,3,6)||
        Player.playerO.containsAll(1,4,7)||
        Player.playerO.containsAll(2,5,8)||
        Player.playerO.containsAll(0,4,8)||
        Player.playerO.containsAll(2,4,6)){winner='o';}
    else{
      winner='';
    }
    return winner;
}
  Future <void> utoPlay(activePlayer)async {
    int index = 0;
    List<int> emptyCells = [];
    for (var i = 0; i < 9; i++) {
      if (!(Player.playerX.contains(index) || Player.playerO.contains(index))) {
        emptyCells.add(i);
      }
    }
    //start and center :
    if (Player.playerX.containsAll(0, 1) && emptyCells.contains(2)) {
      index = 2;
    }
    else if(Player.playerX.containsAll(3,4) && emptyCells.contains(5)) {
      index = 5;}
    else if(Player.playerX.containsAll(6,7) && emptyCells.contains(8)) {
      index = 8;}
    else if(Player.playerX.containsAll(0,3) && emptyCells.contains(6)) {
      index = 6;}
    else if(Player.playerX.containsAll(1,4) && emptyCells.contains(7)) {
      index = 7;}
    else if(Player.playerX.containsAll(2,5) && emptyCells.contains(8)) {
      index = 8;}
    else if(Player.playerX.containsAll(0, 4) && emptyCells.contains(8)) {
      index = 8;}
    else if(Player.playerX.containsAll(2,4) && emptyCells.contains(6)) {
      index = 6;}
// start and end:
    if (Player.playerX.containsAll(0, 2) && emptyCells.contains(1)) {
      index = 1;
    }
    else if(Player.playerX.containsAll(3,5) && emptyCells.contains(4)) {
      index = 4;}
    else if(Player.playerX.containsAll(6,8) && emptyCells.contains(7)) {
      index = 7;}
    else if(Player.playerX.containsAll(0,6) && emptyCells.contains(3)) {
      index = 3;}
    else if(Player.playerX.containsAll(1,7) && emptyCells.contains(4)) {
      index = 4;}
    else if(Player.playerX.containsAll(2,8) && emptyCells.contains(5)) {
      index = 5;}
    else if(Player.playerX.containsAll(0, 8) && emptyCells.contains(4)) {
      index = 4;}
    else if(Player.playerX.containsAll(2,6) && emptyCells.contains(4)) {
      index = 4;}
    //center and end:
    if (Player.playerX.containsAll(1, 2) && emptyCells.contains(0)) {
      index = 0;
    }
    else if(Player.playerX.containsAll(4,5) && emptyCells.contains(3)) {
      index = 3;}
    else if(Player.playerX.containsAll(7,8) && emptyCells.contains(6)) {
      index = 6;}
    else if(Player.playerX.containsAll(3,6) && emptyCells.contains(0)) {
      index = 0;}
    else if(Player.playerX.containsAll(4,7) && emptyCells.contains(1)) {
      index = 1;}
    else if(Player.playerX.containsAll(5,8) && emptyCells.contains(2)) {
      index = 2;}
    else if(Player.playerX.containsAll(4, 8) && emptyCells.contains(0)) {
      index = 0;}
    else if(Player.playerX.containsAll(4,6) && emptyCells.contains(2)) {
      index = 2;}

//the other player :
    if (Player.playerO.containsAll(0, 1) && emptyCells.contains(2)) {
      index = 2;
    }
    else if(Player.playerO.containsAll(3,4) && emptyCells.contains(5)) {
      index = 5;}
    else if(Player.playerO.containsAll(6,7) && emptyCells.contains(8)) {
      index = 8;}
    else if(Player.playerO.containsAll(0,3) && emptyCells.contains(6)) {
      index = 6;}
    else if(Player.playerO.containsAll(1,4) && emptyCells.contains(7)) {
      index = 7;}
    else if(Player.playerO.containsAll(2,5) && emptyCells.contains(8)) {
      index = 8;}
    else if(Player.playerO.containsAll(0, 4) && emptyCells.contains(8)) {
      index = 8;}
    else if(Player.playerO.containsAll(2,4) && emptyCells.contains(6)) {
      index = 6;}

    // the final
    if (Player.playerO.containsAll(0, 2) && emptyCells.contains(1)) {
      index = 1;
    }
    else if(Player.playerO.containsAll(3,5) && emptyCells.contains(4)) {
      index = 4;}
    else if(Player.playerO.containsAll(6,8) && emptyCells.contains(7)) {
      index = 7;}
    else if(Player.playerO.containsAll(0,6) && emptyCells.contains(3)) {
      index = 3;}
    else if(Player.playerO.containsAll(1,7) && emptyCells.contains(4)) {
      index = 4;}
    else if(Player.playerO.containsAll(2,8) && emptyCells.contains(5)) {
      index = 5;}
    else if(Player.playerO.containsAll(0, 8) && emptyCells.contains(4)) {
      index = 4;}
    else if(Player.playerO.containsAll(2,6) && emptyCells.contains(4)) {
      index = 4;}
    //center and end:
    if (Player.playerO.containsAll(1, 2) && emptyCells.contains(0)) {
      index = 0;
    }
    else if(Player.playerO.containsAll(4,5) && emptyCells.contains(3)) {
      index = 3;}
    else if(Player.playerO.containsAll(7,8) && emptyCells.contains(6)) {
      index = 6;}
    else if(Player.playerO.containsAll(3,6) && emptyCells.contains(0)) {
      index = 0;}
    else if(Player.playerO.containsAll(4,7) && emptyCells.contains(1)) {
      index = 1;}
    else if(Player.playerO.containsAll(5,8) && emptyCells.contains(2)) {
      index = 2;}
    else if(Player.playerO.containsAll(4, 8) && emptyCells.contains(0)) {
      index = 0;}
    else if(Player.playerO.containsAll(4,6) && emptyCells.contains(2)) {
      index = 2;}
    else {
      Random rand = Random();
      int randomIndex = rand.nextInt(emptyCells.length); //3
      index = emptyCells[randomIndex];
    }
      playGame(index, activePlayer);

  }
}