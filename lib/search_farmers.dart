import 'package:flutter/material.dart';

///----------------------- THE STATELESS WIDGET ----------------------------------------------
class FarmerSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          height: 400,
          child: Card(child: FarmerSearchForm()),
        ),
      ),
    );
  }
}

///----------------------------- THE STATEFUL WIDGET-----------------------------------------
class FarmerSearchForm extends StatefulWidget {
  @override
  _FarmerSearchFormState createState() => _FarmerSearchFormState();
}

class _FarmerSearchFormState extends State<FarmerSearchForm> {
  final _farmerNameTextController = TextEditingController();

  /*double _formProgress = 0;

  void _updateFormProgress(){
    var progress = 0.0;
    var controllers = [
      _userNameTextController, _passwordTextController
    ];

    for (var controller in controllers){
      if(controller.value.text.isNotEmpty){
        progress += 1/controllers.length;
      }
    }

    setState((){
      _formProgress = progress;
    });
  }*/

  /*void _showFarmerResultsScreen(){
    Navigator.of(context).pushNamed('/farmer-results');
  }*/

  @override
  Widget build(BuildContext context) {
    return Form(
      // onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // LinearProgressIndicator(value: _formProgress),
          Text('Enter farmer name below then press "Search"',
              style: Theme.of(context).textTheme.headline6),
          SizedBox(width: 400, height: 50),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _farmerNameTextController,
              decoration: InputDecoration(hintText: 'Farmer Name'),
            ),
          ),
          SizedBox(width: 400, height: 50),
          ButtonTheme(
            minWidth: 200.0,
            child: RaisedButton(
              onPressed: () {},
              textColor: Colors.white,
              color: Colors.green,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text('Search', style: TextStyle(fontSize: 20)),
              ),
            ),
          )
        ],
      ),
    );
  } // end the build method
}
