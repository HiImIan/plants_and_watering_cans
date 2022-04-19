import 'package:flutter/material.dart';
import 'package:josues_plants/plants/create/functions/notification.dart';
import 'package:josues_plants/plants/create/functions/values.dart';
import 'package:josues_plants/plants/create/widgets/form_fields.dart';
import 'package:josues_plants/plants/create/widgets/help_create_plant.dart';

class PlantsCreateScreen extends StatefulWidget {
  const PlantsCreateScreen({Key? key}) : super(key: key);

  @override
  State<PlantsCreateScreen> createState() => _PlantsCreateScreenState();
}

// chave usada para validar o Form()
final GlobalKey<FormState> _registerPlantFormKey = GlobalKey<FormState>();

// essas são as variáveis que irão conter o valor de cada campo preenchido no cadastro da planta
final TextEditingController registerPlantName = TextEditingController();
final TextEditingController registerWaterNeed = TextEditingController();
final TextEditingController registerWaterTimesADay = TextEditingController();

class _PlantsCreateScreenState extends State<PlantsCreateScreen> {
  @override
  void dispose() {
    super.dispose();
    registerPlantName.clear();
    registerWaterNeed.clear();
    registerWaterTimesADay.clear();
  }

  @override
  Widget build(BuildContext contextMain) {
// Esse é o corpo base do cadastro das plantas, do qual pede e fornece todas as informações para tal
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de planta"),
        actions: [
          IconButton(
              onPressed: () {
                helpCreatePlant(context);
              },
              icon: const Icon(Icons.help))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ValueListenableBuilder(
            valueListenable: ctrolLButtonRPlant,
            builder: (context, value, child) {
              return Form(
                key: _registerPlantFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Text(
                        "Informações da planta",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: createPlantsFields(contextMain),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: ElevatedButton(
                        onPressed: (ctrolLButtonRPlant.value)
                            ? null
                            : () {
                                if (_registerPlantFormKey.currentState!
                                    .validate()) {
                                  notifyRegisterConfimation(contextMain);
                                }
                              },
                        child: (ctrolLButtonRPlant.value)
                            ? const SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  strokeWidth: 5,
                                ),
                              )
                            : const Text(
                                "Cadastrar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            fixedSize: const Size(200, 50)),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
