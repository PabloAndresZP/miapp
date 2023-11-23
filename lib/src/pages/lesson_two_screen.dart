import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/pages/instructions2_page.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';


class LessonTwoScreen extends StatefulWidget {
  @override
  _LessonTwoScreenState createState() => _LessonTwoScreenState();
}

class _LessonTwoScreenState extends State<LessonTwoScreen> {
  @override
  void initState() {
    super.initState();
    _precacheImages();
  }

  void _precacheImages() async {
    for (var i = 0; i < 24; i++) {
      await precacheImage(AssetImage('assets/images/precarga_000${i.toString().padLeft(2, '0')}.png'), context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFF030328),
        leading: IconButton(
          icon: Image.asset('assets/images/icon_atras.png', height: 24, width: 24),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Lecciones PS',
          style: TextStyle(
            color: Color(0xFF044A1D6),
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.bold,
            fontSize: 23.4,
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
          
          SingleChildScrollView( // Aquí se añade el SingleChildScrollView
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 24, left: 20, right: 20), // Se añadió padding superior de 48px
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Progresa a través de cada lección para dominar completamente las habilidades del nivel.',
                      style: TextStyle(
                        color: Color(0xFF7CF8FF),
                        fontFamily: 'WorkSans',
                        fontSize: 18.7,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 36),
                    Text(
                      '¡Adelante, comienza tu aprendizaje!',
                      style: TextStyle(
                        color: Color(0xFF7CF8FF),
                        fontFamily: 'WorkSans',
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildTextButton('I', context, Instructions2Page(), 'assets/images/lec1_ps.png'),
                        buildTextButton('II', context, null, 'assets/images/lec2_ps.png', active: false),
                      ],
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildTextButton('III', context, null, 'assets/images/lec3_ps.png', active: false),
                      ],
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildTextButton('IV', context, null, 'assets/images/lec4_ps.png', active: false),
                        buildTextButton('V', context, null, 'assets/images/lec5_ps.png', active: false),
                      ],
                    ),
                    // Puedes añadir más widgets si necesitas más contenido aquí
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomFooter(
        currentPageIndex: 5,
        onNotificationDismiss: () {
          // Lógica para despedir la notificación
        },
      ),
    );
  }

  Widget buildTextButton(String label, BuildContext context, Widget? page, String imageAsset, {bool active = true}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (page != null && active) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            }
          },
          child: Column(
            children: [
              Image.asset(imageAsset, height: 100, width: 100),
              SizedBox(height: 12),
              Text(
                label,
                style: TextStyle(
                  color: active ? Color(0xFF7CF8FF) : Color(0xFF044A1D6),
                  fontFamily: 'WorkSans',
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
