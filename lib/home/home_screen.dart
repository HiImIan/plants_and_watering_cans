import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:josues_plants/home/widgets/icon_help.dart';
import 'package:josues_plants/home/widgets/plants_modal.dart';
import 'package:josues_plants/home/widgets/wcan_modal.dart';
import 'package:josues_plants/firebase/connect.dart' as userneed;
import 'package:josues_plants/routine/main_screen.dart';

// Pagina principal que encaminha para outras funções do aplicativo
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    userneed.dbconnect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Tela inicial")),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.exit_to_app)),
        actions: [
          IconButton(
              onPressed: () {
                helpInitial(context);
              },
              icon: const Icon(Icons.help))
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: GestureDetector(
            onTap: () {
              plantsModal(context);
            },
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: const Image(
                        image: AssetImage(
                      'assets/plant.jpg',
                    ))),
                const Padding(
                    padding: EdgeInsets.only(),
                    child: Center(
                      child: Text("Plantas", style: TextStyle(fontSize: 24)),
                    )),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
            onTap: () {
              wCanModal(context);
            },
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: const Image(
                        image: AssetImage(
                      'assets/Wcan.jpg',
                    ))),
                const Center(
                  child: Text("Regadores", style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const RoutineCreateScreen()));
            },
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: const Image(
                        image: AssetImage(
                      'assets/routine.jpg',
                    ))),
                const Center(
                  child: Text("Rotinas", style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
