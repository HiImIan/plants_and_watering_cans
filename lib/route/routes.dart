import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:josues_plants/home/home_screen.dart';

class Routes extends StatefulWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  _RoutesState createState() => _RoutesState();
}

// Essa classe espera a conexão com o banco de dados ser feita para então iniciar a aplicação
class _RoutesState extends State<Routes> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }

          if (snapshot.hasData) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(primaryColor: Colors.blue),
                initialRoute: '/',
                routes: {
                  '/': (context) => const HomePage(),
                });
          }

          if (snapshot.connectionState == ConnectionState.none) {
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.4,
              child: const Center(child: Text("Sem conexão com A internet")),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
