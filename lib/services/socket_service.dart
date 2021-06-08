import 'package:chat_app/global/environment.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


enum ServerStatus {
  Online,
  Offline,
  Connecting
}



class SocketService with ChangeNotifier {

  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;

  get serverStatus => this._serverStatus;
  IO.Socket get socket => this._socket;
  Function get emit => this._socket.emit;



  void connect() async {

    final token = await AuthService.getToken();

    this._socket = IO.io( Environment.socketUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true,
      'extraHeaders': {
        'x-token': token
      }
    });

    // Dart client
    this._socket.on('connect', (_) {
      print('connect');
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    this._socket.on('disconnect', (_) {
      print('disconect');
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
  }


  void disconnect() {
    this._socket.disconnect();
  }
}