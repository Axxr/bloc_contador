import 'dart:async';

import 'package:bloc_app/contador_evento.dart';



class BlocContador{
  int _counter = 0;
  final _counterStateController = StreamController<int>();

  StreamSink<int> get _inCounter => _counterStateController.sink;

  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<ContadorEvento>();
  Sink<ContadorEvento> get counterEventSink => _counterEventController.sink;

  BlocContador(){
    _counterEventController.stream.listen(_mapEventToState);
  }
  void _mapEventToState(ContadorEvento evento){
    if (evento is EventoIncremento) {
      _counter ++;
    } else {
      _counter --;
    }
    _inCounter.add(_counter);
  }

  void dispose(){
    _counterStateController.close();
    _counterEventController.close();
  }

}