import 'package:flutter/material.dart';

import './login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller;

  const LoginPage({
    Key? key,
    required LoginController controller,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginPage'),
      ),
      body: Container(),
    );
  }
}


// class LoginView extends StatelessWidget {
//   LoginView({Key? key}) : super(key: key);

//   final TextEditingController emailController = TextEditingController(text: '');
//   final TextEditingController paswordController =
//       TextEditingController(text: '');
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LoginBloc(
//           RepositoryProvider.of<LoginWithEmailAndPasswordUseCaseImpl>(context)),
//       child: Scaffold(
//         backgroundColor: Theme.of(context).primaryColor,
//         body: Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage('assets/images/background-cipher.png'),
//                 fit: BoxFit.cover,
//                 opacity: 0.5),
//           ),
//           child: Padding(
//             padding: EdgeInsets.only(
//               top: MediaQuery.of(context).padding.top,
//               left: 16.0,
//               right: 16.0,
//             ),
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 return BlocConsumer<LoginBloc, LoginState>(
//                   listener: (context, state) async {
//                     if (state is LoginLoading) {
//                     } else {
//                       LoadingWidget.hideLoading();
//                     }

//                     if (state is LoginError) {
//                       SnackBarWidget.showError(context, message: state.error);
//                     }
//                     if (state is LoginSuccess) {
//                       Loggers.showMessage('Sucesso');
//                     }
//                   },
//                   builder: (context, state) {
//                     return SingleChildScrollView(
//                       physics: const BouncingScrollPhysics(),
//                       child: ConstrainedBox(
//                         constraints: BoxConstraints(
//                           minHeight: constraints.maxHeight,
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               height: 130,
//                               width: 130,
//                               child: Image.asset(
//                                 'assets/images/logo.png',
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 30,
//                             ),
//                             const SizedBox(
//                               height: 50,
//                             ),
//                             FormsWidget(
//                                 emailController: emailController,
//                                 paswordController: paswordController),
//                             const SizedBox(
//                               height: 80.0,
//                             ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 context.read<LoginBloc>().add(LoginUser(
//                                     email: emailController.text,
//                                     password: paswordController.text));
//                               },
//                               child: const Text('ENTRAR'),
//                               style: ElevatedButton.styleFrom(
//                                   fixedSize:
//                                       Size(constraints.maxWidth * .7, 45.0),
//                                   primary: Colors.black),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 GoRouter.of(context).push('/register-view');
//                               },
//                               child: const Text(
//                                 'Ainda nao possui conta? Realize seu cadastro',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     decoration: TextDecoration.underline,
//                                     decorationColor: Colors.white),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class FormsWidget extends StatefulWidget {
//   final TextEditingController emailController;
//   final TextEditingController paswordController;
//   const FormsWidget(
//       {Key? key,
//       required this.emailController,
//       required this.paswordController})
//       : super(key: key);

//   @override
//   State<FormsWidget> createState() => _FormsWidgetState();
// }

// class _FormsWidgetState extends State<FormsWidget> {
//   bool obsecure = true;
//   final RegExp regexEmail = RegExp(
//       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ValidateLoginFormsBloc(),
//       child: BlocBuilder<ValidateLoginFormsBloc, ValidateLoginFormsState>(
//         builder: (context, state) {
//           return Container(
//             height: 200.0,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//                 boxShadow: const <BoxShadow>[
//                   BoxShadow(
//                     color: Colors.black26,
//                     offset: Offset(4.0, 3.0),
//                   )
//                 ],
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: Colors.black, width: 2)),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     onChanged: (value) => context
//                         .read<ValidateLoginFormsBloc>()
//                         .add(EmailChanged(email: value)),
//                     controller: widget.emailController,
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: 'E-MAIL',
//                       errorText: state.emailError,
//                       prefixIcon: const Icon(
//                         CupertinoIcons.mail,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Divider(
//                   color: Colors.black,
//                   thickness: 2,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     controller: widget.paswordController,
//                     obscureText: obsecure,
//                     onChanged: (value) => context
//                         .read<ValidateLoginFormsBloc>()
//                         .add(PasswordChanged(password: value)),
//                     decoration: InputDecoration(
//                       errorText: state.passwordError,
//                       border: InputBorder.none,
//                       suffixIcon: InkWell(
//                         child: Icon(obsecure
//                             ? CupertinoIcons.eye
//                             : CupertinoIcons.eye_slash),
//                         onTap: () {
//                           setState(() {
//                             obsecure = !obsecure;
//                           });
//                         },
//                       ),
//                       hintText: 'SENHA',
//                       prefixIcon: const Icon(
//                         CupertinoIcons.lock,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }