import 'package:flutter/material.dart';
import 'package:tour_app/models/user.dart';
import 'package:tour_app/services/database.dart';
import 'package:tour_app/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/shared/loading_widget.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  // form values
  String _currentName;
  bool _currentSex;
  String _currentDescription;
  String _currentAvatar;
  String _currentBackUrl;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user == null
        ? Container()
        : StreamBuilder<UserData>(
            stream: DatabaseService(uid: user.uid).userDataStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserData userData = snapshot.data;
                return Scaffold(
                  appBar: AppBar(
                    title: Text(
                      'Settings',
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  body: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 50.0),
                      child: ListView(
                        children: [
                          SizedBox(height: 20.0),
                          Text(
                            'Update your information',
                            style: TextStyle(fontSize: 18.0),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            initialValue: userData.name,
                            decoration: boxInputDecoration.copyWith(
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                  color: Colors.lightBlueAccent,
                                )),
                            validator: (val) =>
                                val.isEmpty ? 'Please enter a name' : null,
                            onChanged: (val) => _currentName = val,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio(
                                value: true,
                                groupValue: _currentSex ?? userData.sex,
                                onChanged: (value) {
                                  setState(() {
                                    _currentSex = value;
                                  });
                                },
                                // 选中的颜色
                                activeColor: Colors.lightBlueAccent,
                              ),
                              Text('girl'),
                              SizedBox(width: 30.0),
                              Radio(
                                value: false,
                                onChanged: (value) {
                                  setState(() {
                                    _currentSex = value;
                                  });
                                },
                                groupValue: _currentSex ?? userData.sex,
                                // 选中的颜色
                                activeColor: Colors.lightBlueAccent,
                              ),
                              Text('boy'),
                            ],
                          ),
                          TextFormField(
                              initialValue: userData.description,
                              keyboardType: TextInputType.multiline,
                              maxLines: 3,
                              decoration: boxInputDecoration.copyWith(
                                  labelText: 'Description',
                                  labelStyle: TextStyle(
                                    color: Colors.lightBlueAccent,
                                  )),
                              validator: (val) =>
                                  val.isEmpty ? 'Please enter something' : null,
                              onChanged: (val) => _currentDescription = val),
                          SizedBox(height: 10.0),
                          TextFormField(
                            initialValue: userData.avatar,
                            decoration: boxInputDecoration.copyWith(
                                labelText: 'AvatarUrl',
                                labelStyle: TextStyle(
                                  color: Colors.lightBlueAccent,
                                )),
                            validator: (val) =>
                                val.isEmpty ? 'Please enter an Url' : null,
                            onChanged: (val) => _currentAvatar = val,
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            initialValue: userData.backUrl,
                            decoration: boxInputDecoration.copyWith(
                                labelText: 'BackGroundUrl',
                                labelStyle: TextStyle(
                                  color: Colors.lightBlueAccent,
                                )),
                            validator: (val) =>
                                val.isEmpty ? 'Please enter an Url' : null,
                            onChanged: (val) => _currentBackUrl = val,
                          ),
                          SizedBox(height: 20.0),
                          RaisedButton(
                            color: Colors.lightBlueAccent,
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                await DatabaseService(uid: user.uid)
                                    .updateUserData(
                                        name: _currentName ?? userData.name,
                                        description: _currentDescription ??
                                            userData.description,
                                        sex: _currentSex ?? userData.sex,
                                        backUrl:
                                            _currentBackUrl ?? userData.backUrl,
                                        avatar:
                                            _currentAvatar ?? userData.avatar,
                                );
                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              'Update',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return loadingWidget();
              }
            });
  }
}
