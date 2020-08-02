import 'package:flutter/material.dart';

///----------------------- THE STATELESS WIDGET ----------------------------------------------
class FarmerCreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[200],
      /*body: SingleChildScrollView(
          child: Center(
              child: FarmerCreateForm()
          ),
        )*/
      /*body: Center(
        child: SingleChildScrollView(
          child: Card(
              child: FarmerCreateForm()
          ),
        )
      )*/
      /*body: Center(
          child: SingleChildScrollView(
            child: FarmerCreateForm
          )
        )*/

      // Orig
      body: Center(
        child: SizedBox(
          width: 400,
          height: 650,
          child: Card(child: FarmerCreateForm()),
        ),
      ),
    );
  }
}

///----------------------------- THE STATEFUL WIDGET-----------------------------------------
class FarmerCreateForm extends StatefulWidget {
  @override
  _FarmerCreateFormState createState() => _FarmerCreateFormState();
}

class _FarmerCreateFormState extends State<FarmerCreateForm> {
  final _farmerFirstNameTextController = TextEditingController();
  final _farmerLastNameTextController = TextEditingController();
  final _farmerIDTextController = TextEditingController();
  final _farmerPhoneTextController = TextEditingController();

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
          SizedBox(width: 400, height: 20),
          /*Text('Enter farmer details below then press "Create" ', style: Theme
              .of(context)
              .textTheme
              .headline6),*/
          Text(
            'Enter farmer details below then press "Create"',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(width: 400, height: 20),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _farmerFirstNameTextController,
              decoration: InputDecoration(hintText: 'First Name'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _farmerLastNameTextController,
              decoration: InputDecoration(hintText: 'Last Name'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _farmerIDTextController,
              decoration: InputDecoration(hintText: 'ID Number'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _farmerPhoneTextController,
              decoration: InputDecoration(hintText: 'Phone Number'),
            ),
          ),
          SizedBox(width: 400, height: 20),
          ButtonTheme(
            minWidth: 200.0,
            child: RaisedButton(
              onPressed: () {},
              textColor: Colors.white,
              color: Colors.green,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text('Create', style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
          SizedBox(width: 400, height: 20)
        ],
      ),
    );
  } // end the build method
}
