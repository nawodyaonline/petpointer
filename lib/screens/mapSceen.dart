import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petpointer/components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;

class MapScreen extends StatefulWidget {
  static String id = "Map_Screen";
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  //=====
  String broker = 'http;//www.maqiatoo.com/';
  int port = 13370;
  String username = 'cgayan10@gmail.com/petpointer';
  String passwd = 'cgayan@gmail.com';
  String clientIdentifier = 'android';

  mqtt.MqttClient client;
  mqtt.MqttConnectionState connectionState;

  double latitute;
  double longitude;

  StreamSubscription subscription;

  void _subscribeToTopic(String topic) {
    if (connectionState == mqtt.MqttConnectionState.connected) {
      print('[MQTT client] Subscribing to ${topic.trim()}');
      client.subscribe(topic, mqtt.MqttQos.exactlyOnce);
    }
  }

  void _connect() async {
    client = mqtt.MqttClient(broker, '');
    client.port = port;

    client.logging(on: true);

    client.keepAlivePeriod = 30;

    client.onDisconnected = _onDisconnected;

    final mqtt.MqttConnectMessage connMess = mqtt.MqttConnectMessage()
        .withClientIdentifier(clientIdentifier)
        .startClean()
        .keepAliveFor(30)
        .withWillQos(mqtt.MqttQos.atMostOnce);
    print('[MQTT client] MQTT client connecting....');
    client.connectionMessage = connMess;

    try {
      await client.connect(username, passwd);
    } catch (e) {
      print(e);
      _disconnect();
    }

    if (client.connectionState == mqtt.MqttConnectionState.connected) {
      print('[MQTT client] connected');
      setState(() {
        connectionState = client.connectionState;
      });
    } else {
      print('[MQTT client] ERROR: MQTT client connection failed - '
          'disconnecting, state is ${client.connectionState}');
      _disconnect();
    }

    subscription = client.updates.listen(_onMessage);

    _subscribeToTopic("temp");
  }

  void _disconnect() {
    print('[MQTT client] _disconnect()');
    client.disconnect();
    _onDisconnected();
  }

  void _onDisconnected() {
    print('[MQTT client] _onDisconnected');
    setState(() {
      connectionState = client.connectionState;
      client = null;
      subscription.cancel();
      subscription = null;
    });
    print('[MQTT client] MQTT client disconnected');
  }

  void _onMessage(List<mqtt.MqttReceivedMessage> event) {
    print(event.length);
    final mqtt.MqttPublishMessage recMess =
        event[0].payload as mqtt.MqttPublishMessage;
    final String message =
        mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

    print('[MQTT client] MQTT message: topic is <${event[0].topic}>, '
        'payload is <-- ${message} -->');
    print(client.connectionState);
    print("[MQTT client] message with topic: ${event[0].topic}");
    print("[MQTT client] message with message: ${message}");
    setState(() {
      var string =message;
      string.split(",");

      latitute = double.parse(string[0]);
      longitude = double.parse(string[1]);
    });
  }

  //=====
  List<Marker> allMarkers = [];

  @override
  void initState() {
    super.initState();
    allMarkers.add(
      Marker(
        markerId: MarkerId("Mymarker"),
        draggable: false,
        onTap: () {
          print("Marker Tapped!");
        },
        position: LatLng(latitute, longitude),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rexy's Location ",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: kBgColor,
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            color: kBtnColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          markers: Set.from(allMarkers),
          initialCameraPosition:
              CameraPosition(target: LatLng(latitute, longitude), zoom: 13),
        ),
      ),
    );
  }
}
