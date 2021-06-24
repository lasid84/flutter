import 'package:flutter/material.dart';

// import 'package:get/route_manager.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MyHomePage(title: 'Flutter Demo Home Page'),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  String address = '';
  String nickname = '';

  renderTextFormField({
    required String label,
    required FormFieldSetter onSaved,
    required FormFieldValidator validator,
  }) {
    assert(onSaved != null);
    assert(validator != null);

    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: AutovalidateMode.always,
        ),
        Container(height: 16.0),
      ],
    );
  }

  renderButton() {
    return RaisedButton(
      color: Colors.blue,
      onPressed: () {
        if (this.formKey.currentState != null &&
            this.formKey.currentState!.validate()) {
          // validation 이 성공하면 true 가 리턴돼요!

          // validation 이 성공하면 폼 저장하기
          this.formKey.currentState!.save();

          Get.snackbar(
            '저장완료!',
            '폼 저장이 완료되었습니다!',
            backgroundColor: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      },
      child: Text(
        '저장하기!',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  renderValues() {
    return Column(
      children: [
        Text('name: $name'),
        Text('email: $email'),
        Text(
          'password: $password',
        ),
        Text(
          'address: $address',
        ),
        Text(
          'nickname: $nickname',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: this.formKey,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  renderTextFormField(
                    label: '이름',
                    onSaved: (val) {
                      this.name = val;
                    },
                    validator: (val) {
                      if (val.length < 1) {
                        return '이름은 필수사항입니다.';
                      }

                      if (val.length < 2) {
                        return '이름은 두글자 이상 입력 해주셔야합니다.';
                      }

                      return null;
                    },
                  ),
                  renderTextFormField(
                    label: '이메일',
                    onSaved: (val) {
                      this.email = val;
                    },
                    validator: (val) {
                      if (val.length < 1) {
                        return '이메일은 필수사항입니다.';
                      }

                      if (!RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(val)) {
                        return '잘못된 이메일 형식입니다.';
                      }

                      return null;
                    },
                  ),
                  renderTextFormField(
                    label: '비밀번호',
                    onSaved: (val) {
                      this.password = val;
                    },
                    validator: (val) {
                      if (val.length < 1) {
                        return '비밀번호는 필수사항입니다.';
                      }

                      if (val.length < 8) {
                        return '8자 이상 입력해주세요!';
                      }
                      return null;
                    },
                  ),
                  renderTextFormField(
                    label: '주소',
                    onSaved: (val) {
                      this.address = val;
                    },
                    validator: (val) {
                      if (val.length < 1) {
                        return '주소는 필수사항입니다.';
                      }
                      return null;
                    },
                  ),
                  renderTextFormField(
                    label: '닉네임',
                    onSaved: (val) {
                      this.nickname = val;
                    },
                    validator: (val) {
                      if (val.length < 1) {
                        return '닉네임은 필수사항입니다.';
                      }
                      if (val.length < 8) {
                        return '닉네임은 8자 이상 입력해주세요!';
                      }
                      return null;
                    },
                  ),
                  renderButton(),
                  renderValues(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
