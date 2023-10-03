import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import '../pages/register_page.dart';

class ProfilePage extends StatelessWidget {
  final String? name;
  final String? email;
  final bool isRegistered;

  ProfilePage({required this.name, required this.email, this.isRegistered = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF030328),
        leading: IconButton(
          icon: Image.asset('assets/images/icon_atras.png', height: 24, width: 24),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Perfil',
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  isRegistered ? 'assets/images/Nuevo_perfil_grande2.png' : 'assets/images/Nuevo_perfil_grande.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 20),
                Text(
                  'Nombre: $name',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'WorkSans',
                    color: Color(0xFF7CF8FF),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Correo Electrónico: $email',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'WorkSans',
                    color: Color(0xFF7CF8FF),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width - 32,
                  child: ElevatedButton(
                    onPressed: () {
                      // Implementar la lógica para iniciar sesión aquí
                    },
                    child: Text('Iniciar Sesión', style: TextStyle(
                      color: Color(0xFFFDFDFD),
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF00D8BB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width - 32,
                        60,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width - 32,
                  child: ElevatedButton(
                    onPressed: () {
                      // Implementar la lógica para ir a la página de registro aquí
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text('Registrarse', style: TextStyle(
                      color: Color(0xFFFDFDFD),
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF00D8BB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width - 32,
                        60,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomFooter(
        currentPageIndex: 0,
        onNotificationDismiss: () {
          // Coloca aquí la lógica para despedir la notificación en esta página específica
        },
      ),
    );
  }
}