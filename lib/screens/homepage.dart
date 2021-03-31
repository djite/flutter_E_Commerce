import 'package:flutter/material.dart';

class HonePage extends StatelessWidget{
  final GlobalKey<ScaffoldState> _key = GlobalKey <ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          "E-Commerce",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xFF2980b9),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black
          ),
          onPressed: (){
            _key.currentState.openDrawer();
          },
        ),
        actions:<Widget> [
          IconButton(
              icon: Icon(
                  Icons.notifications_none,
                  color: Colors.black
              ),
              onPressed: (){

              },
          ),
          IconButton(
            icon: Icon(
                Icons.send,
                color: Colors.black
            ),
            onPressed: (){

            },
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin:EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children:<Widget> [
            Container(
              height: 110,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "En Vedette ",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                          "Voit Tout",
                        style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                    Card(
                      child: Column(
                        children:<Widget> [
                          Container(
                            height:250,
                            width: 180,
                            //color: Colors.blue,
                            child: Column(
                              children:<Widget>[
                                Container(
                                  height: 190,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("images/a.png"),
                                    )
                                  ),
                                ),
                                Text(
                                  "\$ 30",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
}