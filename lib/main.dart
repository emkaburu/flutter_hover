import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'create_farmer.dart';
import 'search_farmers.dart';
import 'welcome_screen.dart';

void main() => runApp(FarmSuiteApp());

class FarmSuiteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FarmSuite",
      routes: {
        '/': (context) => LoginScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/search-farmers': (context) => FarmerSearchScreen(),
        '/create-farmer': (context) => FarmerCreateScreen()
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snack bar'),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _userNameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  /// HOVER OPS
  ///

  static const ussd_channel = const MethodChannel('farmsuite.use.hover/ussd');
  String _actionResponse = 'Waiting for Response...';

  Future<dynamic> loginUser(var username, password) async {
    var sendMap = <String, dynamic>{
      'username': username,
      'password': password,
    };

    /// response waits for result from java code
    String response = "";
    try {
      final String result =
          await ussd_channel.invokeMethod('loginUser', sendMap);
      response = result;
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
    }

    // _ActionResponse = response;
    setState(() {
      _actionResponse = response;
    });
  }

  /*static const platform = const MethodChannel('samples.flutter.dev/battery');
  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }*/

  ///
  /// HOVER OPS

  double _formProgress = 0;

  void _updateFormProgress() {
    var progress = 0.0;
    var controllers = [_userNameTextController, _passwordTextController];

    for (var controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  void _showWelcomeScreen() {
    Navigator.of(context).pushNamed('/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(image: AssetImage('logo.png'), height: 150, width: 250),
          LinearProgressIndicator(value: _formProgress),
          Text('Login', style: Theme.of(context).textTheme.headline4),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _userNameTextController,
              decoration: InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(),
                labelText: 'Username',
                suffixIcon: Icon(Icons.supervised_user_circle),
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(50),
              ],
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your Username';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: TextFormField(
              controller: _passwordTextController,
              decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.lock)),
              inputFormatters: [
                LengthLimitingTextInputFormatter(15),
              ],
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your Password';
                }
                return null;
              },
              obscureText: true,
              obscuringCharacter: '*',
            ),
          ),
          FlatButton(
            color: Colors.green,
            textColor: Colors.white,
            // onPressed: _formProgress == 1 ? _showWelcomeScreen : null,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                loginUser(
                    _userNameTextController.text, _passwordTextController.text);
              }
              /*if (_formKey.currentState.validate()) {
                _getBatteryLevel();
              }*/
            },
            child: Text('Login'),
          ),
          // Text(_batteryLevel),
        ],
      ),
    );
  } // end the build method
}
