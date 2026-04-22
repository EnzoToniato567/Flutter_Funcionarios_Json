import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> funcionarios = [];
  int indice = 0;

  @override
  void initState() {
    super.initState();
    carregarJSON();
  }

  Future<void> carregarJSON() async {
    String dados = await rootBundle.loadString('mockup/funcionarios.json');

    setState(() {
      funcionarios = json.decode(dados);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Funcionários")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[300],
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    offset: Offset(0, 4),
                    color: Colors.black26,
                  ),
                ],
              ),
              child: DropdownButton<dynamic>(
                isExpanded: true,
                underline: const SizedBox.shrink(),
                value: funcionarios.isNotEmpty ? funcionarios[indice] : null,
                items: funcionarios.map((f) {
                  return DropdownMenuItem(value: f, child: Text(f['nome']));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    indice = funcionarios.indexOf(value);
                  });
                },
              ),
            ),

            Text(
              funcionarios.isNotEmpty ? funcionarios[indice]['nome'] : "Nome",
              style: Theme.of(context).textTheme.titleMedium,
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    offset: Offset(0, 4),
                    color: Colors.black26,
                  ),
                ],
              ),
              child: Column(
                spacing: 10,
                children: [
                  funcionarios.isNotEmpty
                      ? Image.asset(funcionarios[indice]['avatar'], width: 150)
                      : Image.asset('assets/icone.png', width: 150),

                  Text(
                    funcionarios.isNotEmpty
                        ? funcionarios[indice]['cargo']
                        : "Cargo",
                  ),

                  Text(
                    funcionarios.isNotEmpty
                        ? "R\$ ${funcionarios[indice]['salario'].toStringAsFixed(2).replaceAll('.', ',')}"
                        : "R\$ 0,00",
                  ),

                  Text(
                    funcionarios.isNotEmpty
                        ? funcionarios[indice]['dataContratacao']
                        : "Data",
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: indice > 0 ? () => setState(() => indice--) : null,
                  child: Text("Anterior"),
                ),
                ElevatedButton(
                  onPressed: indice < funcionarios.length - 1
                      ? () => setState(() => indice++)
                      : null,
                  child: Text("Próximo"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
