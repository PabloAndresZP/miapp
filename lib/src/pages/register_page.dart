import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import '../pages/profile_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  String? _name;
  String? _email;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        fontFamily: 'WorkSans',
        fontSize: 18.7,
        color: Color(0xFF7CF8FF),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF00D8BB),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF00D8BB),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      errorStyle: TextStyle(
        color: Colors.red,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
    );
  }

  void _registerUser() {
    setState(() {
      _name = _nameController.text;
      _email = _emailController.text;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(name: _name, email: _email),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( toolbarHeight: 80,
        backgroundColor: Color(0xFF030328),
        leading: IconButton(
          icon: Image.asset('assets/images/icon_atras.png', height: 24, width: 24),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Registro',
          style: TextStyle(
            color: Color(0xFF044A1D6),
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.bold,
            fontSize: 21.5,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/textura_5.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 24.0),
                  TextFormField(
                    controller: _nameController,
                    decoration: _inputDecoration('Nombre completo'),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, introduce tu nombre';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontFamily: 'WorkSans',
                      fontSize: 15,
                      color: Color(0xFFFDFDFD),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 24.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: _inputDecoration('Correo electrónico'),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, introduce tu correo electrónico';
                      }
                      if (!value.contains('@')) {
                        return 'Por favor, introduce un correo electrónico válido';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontFamily: 'WorkSans',
                      fontSize: 15,
                      color: Color(0xFFFDFDFD),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 24.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: _inputDecoration('Contraseña'),
                    obscureText: true,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, introduce tu contraseña';
                      }
                      if (value.length < 6) {
                        return 'La contraseña debe tener al menos 6 caracteres';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontFamily: 'WorkSans',
                      fontSize: 15,
                      color: Color(0xFFFDFDFD),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _registerUser();
                      }
                    },
                    child: Text('Registrarse', style: TextStyle(
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFFFDFDFD),
                    )),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF00D8BB),
                      fixedSize: Size(MediaQuery.of(context).size.width, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomFooter(
        currentPageIndex: 5,
        onNotificationDismiss: () {
          // Coloca aquí la lógica para despedir la notificación en esta página específica
          // Puedes establecer el estado de hasWonCoin1 a falso o realizar cualquier otra acción necesaria.
        },
      ),
    );
  }
}