import 'package:flutter/material.dart';

class DropDown1 extends StatelessWidget {
  DropDown1({super.key});
  final dropValue = ValueNotifier(''); // [1] Salva a opçao selecionada
  final dropOpcoes = [
    '1',
    '4',
    '10',
    '21'
  ]; // Opções que estarão dentro do dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Já que está usando o ValueNotifier[1]
        child: ValueListenableBuilder(
          valueListenable: dropValue,
          builder: (context, value, _) {
            return SizedBox(
              width: 280,
              child: DropdownButtonFormField(
                // DropdownButton
                decoration: InputDecoration(
                    label: Text('Marca'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                // Expande o DW dentro do container
                isExpanded: true,
                icon: Icon(Icons.loop),
                // set o valor que esta sendo trabalhado no DW
                hint: Text('Loop '), // Texto exibido dentro do DW menu
                // Valor que vai aparecer no DW quando a opção for selecionada
                value: (value.isEmpty) ? null : value,
                // Quando selecionar o item // para poder fazer algo com o valor
                onChanged: (escolha) {
                  dropValue.value = escolha.toString();
                  print(escolha);
                },
                // Itens que serão exibidos
                items: dropOpcoes
                    .map(
                      (op) => DropdownMenuItem(
                        // valor quando o user selecionar
                        value: op,
                        child: Text(op),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
