import 'package:flutter/material.dart';

import 'package:josues_plants/watering_can/create/functions/values.dart';
import 'package:josues_plants/watering_can/create/widgets/form_fields.dart';
import 'package:josues_plants/watering_can/create/widgets/help_create_wcan.dart';
import 'package:josues_plants/watering_can/create/widgets/notifications.dart';

class WateringCreateScreen extends StatefulWidget {
  const WateringCreateScreen({Key? key}) : super(key: key);

  @override
  State<WateringCreateScreen> createState() => _WateringCreateScreenState();
}

final GlobalKey<FormState> _registerWcanFormKey = GlobalKey<
    FormState>(); // chave do Form() que valida se foi preenchido corretamente
// essas são as variáveis que irão conter o valor de cada campo preenchido no cadastro da planta
final TextEditingController registerWcanName = TextEditingController();
final TextEditingController registerWcanCap = TextEditingController();

class _WateringCreateScreenState extends State<WateringCreateScreen> {
  @override
  void dispose() {
    super.dispose();
    registerWcanName.clear();
    registerWcanCap.clear();
  }

  @override
  void initState() {
    super.initState();
    checkRain.change(false);
  }

  @override
  Widget build(BuildContext contextMain) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de regador"),
        actions: [
          IconButton(
              onPressed: () {
                helpCreateWcan(context);
              },
              icon: const Icon(Icons.help))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ValueListenableBuilder(
            valueListenable: ctrolLButtonRWcan,
            builder: (context, value, child) {
              return Form(
                key: _registerWcanFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 65),
                      child: Text(
                        "Informações do regador",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 100),
                      child: createWcansFields(contextMain),
                    ),
                    ElevatedButton(
                      onPressed: (ctrolLButtonRWcan.value)
                          ? null
                          : () {
                              if (_registerWcanFormKey.currentState!
                                  .validate()) {
                                notifyRegisterWcanConfimation(contextMain);
                              }
                            },
                      child: (ctrolLButtonRWcan.value)
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
                          fixedSize: const Size(200, 50), primary: Colors.blue),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
