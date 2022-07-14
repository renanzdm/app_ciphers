import 'package:flutter/material.dart';

import './register_controller.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController _controller;

  const RegisterPage({
    Key? key,
    required RegisterController controller,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterPage'),
      ),
      body: Container(),
    );
  }
}

// class RegisterView extends StatelessWidget {
//   RegisterView({Key? key}) : super(key: key);
//   final TextEditingController emailController = TextEditingController(text: '');
//   final TextEditingController paswordController =
//       TextEditingController(text: '');
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => RegisterBloc(
//           registerUseCase: RepositoryProvider.of<RegisterUseCaseImpl>(context)),
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
//                 return BlocConsumer<RegisterBloc, RegisterState>(
//                   listener: (context, state) async {
//                     if (state is RegisterLoading) {
//                       LoadingWidget.showLoading(context);
//                     } else {
//                       LoadingWidget.hideLoading();
//                     }
//                     if (state is RegisterError) {
//                       SnackBarWidget.showError(context, message: state.error);
//                     }
//                     if (state is RegisterSuccess) {}
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
//                             const Text(
//                               'CRIE SUA CONTA E APROVEITE',
//                               style:
//                                   TextStyle(fontSize: 25, color: Colors.white),
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
//                                 context.read<RegisterBloc>().add(RegisterUser(
//                                     email: emailController.text,
//                                     password: paswordController.text));
//                               },
//                               child: const Text('REGISTRAR-SE'),
//                               style: ElevatedButton.styleFrom(
//                                   fixedSize:
//                                       Size(constraints.maxWidth * .7, 45.0),
//                                   primary: Colors.black),
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
//       create: (context) => ValidateRegistersFormsBloc(),
//       child: Container(
//         height: 200.0,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             boxShadow: const <BoxShadow>[
//               BoxShadow(
//                 color: Colors.black26,
//                 offset: Offset(4.0, 3.0),
//               )
//             ],
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(color: Colors.black, width: 2)),
//         child: BlocBuilder<ValidateRegistersFormsBloc,
//             ValidateRegistersFormsState>(builder: (context, state) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: widget.emailController,
//                   onChanged: (value) => context
//                       .read<ValidateRegistersFormsBloc>()
//                       .add(EmailChanged(email: value)),
//                   decoration: InputDecoration(
//                     errorText: state.emailError,
//                     border: InputBorder.none,
//                     hintText: 'E-MAIL',
//                     prefixIcon: const Icon(
//                       CupertinoIcons.mail,
//                     ),
//                   ),
//                 ),
//               ),
//               const Divider(
//                 color: Colors.black,
//                 thickness: 2,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: widget.paswordController,
//                   obscureText: obsecure,
//                   onChanged: (value) => context
//                       .read<ValidateRegistersFormsBloc>()
//                       .add(PasswordChanged(password: value)),
//                   decoration: InputDecoration(
//                     errorText: state.passwordError,
//                     border: InputBorder.none,
//                     suffixIcon: InkWell(
//                       child: Icon(obsecure
//                           ? CupertinoIcons.eye
//                           : CupertinoIcons.eye_slash),
//                       onTap: () {
//                         setState(() {
//                           obsecure = !obsecure;
//                         });
//                       },
//                     ),
//                     hintText: 'SENHA',
//                     prefixIcon: const Icon(
//                       CupertinoIcons.lock,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }),
//       ),
//     );
//   }
// }