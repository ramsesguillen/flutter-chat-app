import 'package:chat_app/global/environment.dart';
import 'package:chat_app/models/mensajes_response.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chat_app/models/usuario.dart';



class ChatService with ChangeNotifier {

  Usuario usuarioPara;


  Future<List<Mensaje>> getChat( String usuarioID ) async {
    try {
      final token = await AuthService.getToken();

      final resp = await http.get(Uri.parse('${ Environment.apiUrl}/mensajes/$usuarioID'),
        headers: {
          'Content-Type': 'application/json',
          'x-token' : token,
        }
      );

      final mensajesResponse = mensajesResponseFromJson( resp.body );

      return mensajesResponse.mensajes;
    } catch (e) {
      print(e);
      return [];
    }

  }
}


