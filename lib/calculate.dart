import 'dart:math';

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget{
  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator>{

  List listOfUserInputs = [];
  List listOfOperations = [];

  addUserInputAndOperations(user, String operation){
    print('myList');
    listOfUserInputs.add(user);
    listOfOperations.add(operation);
    setState(() {
      print('set');
      userInput = 0;
    });
  }

  finalOutput(){
    if(userInput != 0){
      listOfUserInputs.add(userInput);
    }
    print(listOfUserInputs);
    print(listOfOperations);
    for(int x = 0; x < listOfUserInputs.length; x++){
      if(x == 0){
        answer = listOfUserInputs[x];
      }
      else{
        switch(listOfOperations[x - 1]){
          case '+':
            answer += listOfUserInputs[x];
            break;
          case '-':
            answer -= listOfUserInputs[x];
            break;
          case '*':
            answer *= listOfUserInputs[x];
            break;
          case '/':
            answer /= listOfUserInputs[x];
            break;
        }
      }
    }
    listOfUserInputs.clear();
    listOfOperations.clear();
    setState(() {
      userInput = answer;
    });
  }
  
  double userInput = 0;
  int symbol = 0;
  double answer = 0;

  getKeys(i) {
        return [
          GestureDetector(
            onTap: (){
              print(i);
              setState((){
                userInput = (userInput * 10) + i;
              });

            },
            child: Container(
              height: 70,
              width: 70.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.black12.withOpacity(0.2),
              ),
              child: Align(
                  alignment: Alignment.center,
                  child: Text('$i', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w400),)),
            ),
          ),
        ];
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(30.0),
//              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text('$userInput', style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                ),),
              ),
            ),
            Expanded(

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Wrap(
                      spacing: 20.0,
                      runSpacing: 15.0,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: <Widget>[
                        for(int i = 0; i< 9; i++) ...getKeys(i),
                        GestureDetector(
                          onTap: (){
                            setState((){
                              userInput = (userInput * 10) + 9;
                            });
                          },
                          child: Container(
                            height: 70,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.black12.withOpacity(0.2),
                            ),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text('9', style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.w400, letterSpacing: 5.0),)),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            double myReminder = userInput % 10;

                            print(myReminder);
                            setState((){
                              userInput = (userInput - myReminder) / 10;
                            });
                          },
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.black12.withOpacity(0.2),
                            ),
                            child: Align(
                                alignment: Alignment.center,
                                child: Icon(Icons.backspace)),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: (){
                                setState((){
                                  userInput = 0;
                                });
                              },
                              child: Container(
                                height: 70,
                                width: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.red.withOpacity(0.2),
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text('CLEAR', style: TextStyle(color: Colors.red, fontSize: 25.0, fontWeight: FontWeight.w400, letterSpacing: 5.0),)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Wrap(
                      spacing: 3.0,
                      runSpacing: 15.0,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            print(userInput);
                            addUserInputAndOperations(userInput, '/');

                          },
                          child: Container(
                            height: 70,
                            width: 70.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.orange,
                            ),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text('/', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w400),)),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            print(userInput);
                            addUserInputAndOperations(userInput, '*');
                          },
                          child: Container(
                            height: 70,
                            width: 70.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.orange,
                            ),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text('x', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w400),)),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            print(userInput);
                            addUserInputAndOperations(userInput, '+');
                          },
                          child: Container(
                            height: 70,
                            width: 70.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.orange,
                            ),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text('+', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w400),)),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            print(userInput);
                            addUserInputAndOperations(userInput, '-');
                          },
                          child: Container(
                            height: 70,
                            width: 70.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.orange,
                            ),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text('-', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w400),)),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            finalOutput();
                          },
                          child: Container(
                            height: 70,
                            width: 70.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.green,
                            ),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text('=', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w400),)),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}