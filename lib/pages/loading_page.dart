///[]
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/usuarios_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


///[]


///[]
class LoadingPage extends StatelessWidget {

///[]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkloginState(context),
        builder: (context, snapshot) {
          return Center(
            child: Text('Espere...'),
          );
        },
      )
    );
  }


  Future checkloginState( BuildContext context ) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final socketService = Provider.of<SocketService>(context, listen: false);
    final autenticado = await authService.isLoggedIn();

    if ( autenticado ) {
      // Navigator.pushReplacementNamed(context, 'usuarios');
      socketService.connect();
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => UsuariosPage(),
          transitionDuration: Duration(milliseconds: 0)
        )
      );
    } else {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => LoginPage(),
          transitionDuration: Duration(milliseconds: 0)
        )
      );
      // Navigator.pushReplacementNamed(context, 'login');
    }
  }
}
