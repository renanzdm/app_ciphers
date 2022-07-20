// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:the_cipher_app/app/core/ui/widgets/loading_widget.dart';

import './login_controller.dart';
import '../../../core/ui/widgets/snack_bar_custom.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
    required LoginController controller,
  })  : _loginController = controller,
        super(key: key);

  final LoginController _loginController;
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController = TextEditingController(text: '');
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/background-cipher.png'), fit: BoxFit.cover, opacity: 0.5),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: 16.0,
            right: 16.0,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return BlocConsumer<LoginController, LoginState>(
                bloc: _loginController,
                listener: (context, state) async {
                  if (state.loading) {
                    LoadingWidget.showLoading(context);
                  } else {
                    LoadingWidget.hideLoading();
                  }
                  if (state.error.isNotEmpty) {
                    SnackBarCustom.showError(context, message: state.error);
                  }
                  if (state.user.jwt.isNotEmpty) {
                    Navigator.of(context).pushNamed('/home');
                  }
                },
                builder: (context, state) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 130,
                            width: 130,
                            child: Image.asset(
                              'assets/images/logo.png',
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          FormsWidget(
                            emailController: emailController,
                            paswordController: passwordController,
                            formKey: formKey,
                          ),
                          const SizedBox(
                            height: 80.0,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState?.validate() ?? false) {
                                await _loginController.login(email: emailController.text, password: passwordController.text);
                              } else {
                                SnackBarCustom.showWarning(context, message: 'Revise os campos de preeencimento');
                              }
                            },
                            style: ElevatedButton.styleFrom(fixedSize: Size(constraints.maxWidth * .7, 45.0), primary: Colors.black),
                            child: const Text('ENTRAR'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              Modular.to.pushNamed('/auth/register');
                            },
                            child: const Text(
                              'Ainda nao possui conta? Realize seu cadastro',
                              style: TextStyle(color: Colors.white, fontSize: 16, decoration: TextDecoration.underline, decorationColor: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class FormsWidget extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController paswordController;
  final GlobalKey<FormState> formKey;

  const FormsWidget({Key? key, required this.emailController, required this.paswordController, required this.formKey}) : super(key: key);

  @override
  State<FormsWidget> createState() => _FormsWidgetState();
}

class _FormsWidgetState extends State<FormsWidget> {
  bool obsecure = true;
  final RegExp regexEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Colors.black26,
          offset: Offset(4.0, 3.0),
        )
      ], color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black, width: 2)),
      child: Form(
        key: widget.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: widget.emailController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Campo Obrigatorio';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'E-MAIL',
                  prefixIcon: Icon(
                    CupertinoIcons.mail,
                  ),
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: widget.paswordController,
                obscureText: obsecure,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Campo Obrigatorio';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: InkWell(
                    child: Icon(obsecure ? CupertinoIcons.eye : CupertinoIcons.eye_slash),
                    onTap: () {
                      setState(() {
                        obsecure = !obsecure;
                      });
                    },
                  ),
                  hintText: 'SENHA',
                  prefixIcon: const Icon(
                    CupertinoIcons.lock,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
