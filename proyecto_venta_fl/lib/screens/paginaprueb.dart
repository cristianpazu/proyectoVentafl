import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Column(
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 100,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(30)
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 300, top: 10),
                child: Container(
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('data')
                    ],
                  ),
                ),
              ),
              //
               Padding(
                padding: const EdgeInsets.only(right: 200, bottom: 50),
                child: Container(
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('data')
                    ],
                  ),
                ),
              ),
              //

              
            ],
          ),
          
          
          ),
        )
        




        ],
      ),
    );
  }
}
