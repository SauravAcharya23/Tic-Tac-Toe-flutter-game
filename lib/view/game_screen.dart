import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/constants/colors.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

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
                    Text('Player 1', style: TextStyle(color: MainColor.secondaryColor),),
                    Text('Player 2', style: TextStyle(color: MainColor.secondaryColor),)
                  ],
                ),
                const SizedBox(
                  height: 150,
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
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              width: 5,
                              color: MainColor.primaryColor
                            ),
                          color: MainColor.secondaryColor
                        ),
                        child: const Center(child: Text('0', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: MainColor.secondaryColor, onPressed: (){}, child: const Icon(Icons.start_rounded,)),
    );
  }
}
