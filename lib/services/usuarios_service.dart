import 'package:chat_app/global/environment.dart';
import 'package:chat_app/models/usuario_response.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:http/http.dart' as http;


import 'package:chat_app/models/usuario.dart';

class UsuarioService {


  Future<List<Usuario>> getUsuarios() async {
    try {
      final token = await AuthService.getToken();

      final resp = await http.get(Uri.parse('${ Environment.apiUrl}/usuarios'),
        headers: {
          'Content-Type': 'application/json',
          'x-token' : token,
        }
      );

      final usuariosResponse = userResponseFromJson( resp.body );

      return usuariosResponse.usuarios;
    } catch (e) {
      return [];
    }
  }
}