import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_game/constants/colors.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  bool oTurn = true;
  List<String> displayXO = ['','','','','','','','','',];
  String resultDeclaration = '';
  int filledBoxes = 0;
  bool winnerFound = false;
  List<int> matchedIndexes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Player O', style: TextStyle(color: MainColor.secondaryColor),),
                    Text('Player X', style: TextStyle(color: MainColor.secondaryColor),)
                  ],
                ),
                const SizedBox(
                  height: 120,
                ),
                resultDeclaration == '' ? const SizedBox(width: 0,) : Text(resultDeclaration.toString(), style: TextStyle(color: MainColor.secondaryColor),),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 100,
                      mainAxisSpacing: 11,
                      crossAxisSpacing: 11
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _onTapped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              width: 5,
                              color: MainColor.primaryColor
                            ),
                          color: matchedIndexes.contains(index)? Colors.red : MainColor.secondaryColor
                        ),
                        child: Center(child: Text(displayXO[index], style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: MainColor.primaryColor),)),
                      ),
                    );
                  },
                ),
              ),
              
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MainColor.secondaryColor, 
        onPressed: (){
          _clearBoard();
        }, 
        child: const Icon(Icons.start_rounded,)
      ),
    );
  }

  void _clearBoard(){
    setState(() {
      for(int i = 0; i < 9; i++){
        displayXO[i] = '';
      }
      resultDeclaration = '';
      matchedIndexes = [];
      oTurn = true;
    });
    filledBoxes = 0;
  }

  void _onTapped(int index){
    if(resultDeclaration == ''){
      setState(() {
        if(oTurn && displayXO[index] == ''){
          displayXO[index] = 'O';
          filledBoxes++;
        }else if(!oTurn && displayXO[index] == ''){
          displayXO[index] = 'X';
          filledBoxes++;
        }
        oTurn = !oTurn;
        _checkWinner();
      });
    }
    
  }

  void _checkWinner(){
    if(displayXO[0] == displayXO[1] && displayXO[0] == displayXO[2] && displayXO[0] != ''){
      setState(() {
        resultDeclaration = 'Player'+displayXO[0] +'Wins!';
        winnerFound = true;
        matchedIndexes.addAll([0, 1, 2]);
      });
      
    }
    // check 2nd row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[3] + ' Wins!';
        winnerFound = true;
        matchedIndexes.addAll([3, 4, 5]);
      });
    }

    // check 3rd row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[6] + ' Wins!';
        winnerFound = true;
        matchedIndexes.addAll([6, 7, 8]);
      });
    }

    // check 1st column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' Wins!';
        winnerFound = true;
        matchedIndexes.addAll([0, 3, 6]);
      });
    }

    // check 2nd column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[1] + ' Wins!';
        winnerFound = true;
        matchedIndexes.addAll([1, 4, 7]);
      });
    }

    // check 3rd column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[2] + ' Wins!';
        winnerFound = true;
        matchedIndexes.addAll([2, 5, 8]);
      });
    }

    // check diagonal
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' Wins!';
        winnerFound = true;
        matchedIndexes.addAll([0, 4, 8]);
      });
    }

    // check diagonal
    if (displayXO[6] == displayXO[4] &&
        displayXO[6] == displayXO[2] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[6] + ' Wins!';
        winnerFound = true;
        matchedIndexes.addAll([6, 4, 2]);
      });
    }

    if(!winnerFound && filledBoxes == 9){
      setState(() {
        resultDeclaration = 'Nobody wins!';
      });
    }
    
  }
}
