import 'package:flutter/material.dart';
import 'search_farmers.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          height: 400,
          child: Card(child: WelcomeScreenForm()),
        ),
      ),
    );
  }
}

//-----------------------------------------------------------------------------------
class WelcomeScreenForm extends StatefulWidget {
  @override
  _WelcomeFormState createState() => _WelcomeFormState();
}

class _WelcomeFormState extends State<WelcomeScreenForm> {
  void _showSearchFarmersScreen() {
    Navigator.of(context).pushNamed('/search-farmers');
  }

  void _showCreateFarmerScreen() {
    Navigator.of(context).pushNamed('/create-farmer');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Logged in as: ', style: Theme.of(context).textTheme.headline6),
          SizedBox(width: 400, height: 100),
          ButtonTheme(
            minWidth: 200.0,
            child: RaisedButton(
              onPressed: _showSearchFarmersScreen,
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text('Search Farmers',
                    style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
          Text('OR', style: Theme.of(context).textTheme.headline4),
          ButtonTheme(
            minWidth: 200.0,
            child: RaisedButton(
              onPressed: _showCreateFarmerScreen,
              textColor: Colors.white,
              color: Colors.green,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text('Create New Farmer',
                    style: TextStyle(fontSize: 20)),
              ),
            ),
          )
        ],
      ),
    );
  } // end the build method
}
