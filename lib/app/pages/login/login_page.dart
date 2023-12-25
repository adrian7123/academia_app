import 'package:academia_app/app/services/customer_service.dart';
import 'package:academia_app/app/shared/api_response.dart';
import 'package:academia_app/widgets/alert.dart';
import 'package:academia_app/widgets/text_widgets.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _passVisible = false;
  bool _stayConnected = false;
  bool _loading = false;

  String? errorMessage;

  void validateAndSubmit() async {
    if (_loading) return;

    setState(() {
      errorMessage = null;
    });

    if (_formKey.currentState?.validate() == true) {
      setState(() {
        _loading = true;
      });

      final customerService = CustomerService();

      final loginRes = await customerService.login(
        email: _emailController.text,
        pass: _passController.text,
      );

      if (loginRes.status == ApiResponseStatus.success) {
        TextInput.finishAutofillContext();
        Modular.to.pushReplacementNamed('/home');
      } else {
        setState(() {
          errorMessage = loginRes.message;
        });
      }

      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                'assets/academia/barbell.png',
                width: MediaQuery.of(context).size.width - 100,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: AutofillGroup(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 75,
                        child: H1(
                          'Life Fitness',
                        ),
                      ),
                      Text(
                        'Bem-vindo',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                          letterSpacing: 1.1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      if (errorMessage != null)
                        AlertWidget(
                          icon: const Icon(
                            FeatherIcons.alertTriangle,
                            color: Colors.white,
                          ),
                          child: Text(
                            errorMessage!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      const SizedBox(height: 10),
                      TextFormField(
                        autofillHints: const [
                          AutofillHints.email,
                          AutofillHints.username,
                          AutofillHints.newUsername
                        ],
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Informe seu Email';
                          }

                          if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$')
                              .hasMatch(value)) {
                            return 'Email invalido';
                          }
                          return null;
                        },
                        onChanged: (val) => {},
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        autofillHints: const [AutofillHints.password],
                        autocorrect: false,
                        controller: _passController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Informe sua Senha';
                          }

                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !_passVisible,
                        cursorColor: Theme.of(context).colorScheme.primary,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _passVisible = !_passVisible;
                              });
                            },
                            child: Icon(
                              _passVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(
                          () {
                            _stayConnected = !_stayConnected;
                          },
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: _stayConnected,
                              onChanged: (a) {
                                setState(
                                  () {
                                    _stayConnected = !_stayConnected;
                                  },
                                );
                              },
                            ),
                            const Text('Permanecer Conectado'),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Esqueceu a senha?',
                                style: TextStyle(
                                  color: Colors.indigo,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => validateAndSubmit(),
                              child: SizedBox(
                                height: 50,
                                child: Center(
                                  child: Builder(builder: (context) {
                                    if (_loading) {
                                      return const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 3,
                                        ),
                                      );
                                    }
                                    return const Text(
                                      'Entrar',
                                      style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: 1.1,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
