
import 'package:flutter/material.dart';
import 'package:registration_login/utils/navigation_router.dart';


class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => new _RegistrationScreenState();
}

class _LoginData {
  String name = '';
  String login = '';
  String password = '';
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String dropdownValue = 'Клиент';
  _LoginData _data = new _LoginData();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Registration'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(20.0),

          child: new Form(

            child: new ListView(
              children: <Widget>[
                dropDownm(),
                new Container(
                    padding: new EdgeInsets.all(20.0),
                    child:new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlutterLogo(
                          size: 100.0,
                        ),
                      ],
                    )
                ),
                new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new TextFormField(
                        keyboardType: TextInputType.text, // Use email input type for emails.
                        decoration: new InputDecoration(
                          hintText: 'User Name',
                          labelText: 'Enter your user name',
                          icon: new Icon(Icons.person),
                        ),
                        onSaved: (String value) {
                          this._data.name = value;
                        }
                    )
                ),
                new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new TextFormField(
                        keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                        decoration: new InputDecoration(
                            hintText: 'you@example.com',
                            labelText: 'E-mail Address',
                            icon: new Icon(Icons.email)),
                        onSaved: (String value) {
                          this._data.login = value;
                        }
                    )
                ),
                new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new TextFormField(
                        keyboardType: TextInputType.phone, // Use email input type for emails.
                        decoration: new InputDecoration(
                            hintText: '+77777777777',
                            labelText: 'Number phone',
                            icon: new Icon(Icons.phone)),
                        onSaved: (String value) {
                          this._data.login = value;
                        }
                    )
                ),
                new Container(
                  padding: const EdgeInsets.only(top:10.0),
                  child:  new TextFormField(
                      obscureText: true, // Use secure text for passwords.
                      decoration: new InputDecoration(
                          hintText: 'Password',
                          labelText: 'Enter your password',
                          icon: new Icon(Icons.lock)),
                      onSaved: (String value) {
                        this._data.password = value;
                      }
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.only(top:10.0),
                  child:  new TextFormField(
                      obscureText: true, // Use secure text for passwords.
                      decoration: new InputDecoration(
                          hintText: 'Confirm Password',
                          labelText: 'Enter your confirm password',
                          icon: new Icon(Icons.lock)

                      )
                  ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      height:50.0,
                      width: 210.0,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40.0),
                      child: new RaisedButton(
                        child: new Text(
                          'Register',
                          style: new TextStyle(
                              color: Colors.white
                          ),
                        ),
                        onPressed: () => _performLogin(),
                        color: Colors.deepPurple,
                      ),

                    ),

                  ],
                ),

              ],
            ),
          )
      ),
    );
  }

  dropDownm(){
    return Scaffold(
      body: Center(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(
              color: Colors.deepPurple
          ),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>['Клиент', 'Водитель', 'Диспетчер', 'Администратор']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          })
              .toList(),
        ),
      ),
    );
  }
  _performLogin() {

  }

  _navigateRegistration() {
    NavigationRouter.switchToRegistration(context);
  }
}
