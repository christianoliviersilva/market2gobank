import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketapp/domain/model/item.dart';
import 'package:marketapp/presenter/state/controllers/cart_controller.dart';
import 'package:marketapp/utils/app_button.dart';
class CartScreen extends StatelessWidget {
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Kata'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 90,
            child: Obx(() => ListView.builder(
              itemCount: controller.cartItems.length,
              itemBuilder: (context, index) {
                final item = controller.cartItems[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text('Item: ${item.sku}',  style: const TextStyle(fontWeight: FontWeight.bold),),
                      trailing: Text(item.sku == "A" 
                      ? 'PROMOÇÃO LEVE 3 POR R\$1.30!!!'
                      : item.sku == "B" 
                      ? "PROMOÇÃO LEVE 2 POR R\$1.25!!!"
                      : item.sku == "C"
                      ? "COMPRE TRÊS E GANHE 1 DE "
                      "\n GRAÇA NA PRÓXIMA COMPRA "
                      : item.sku == "D"
                      ? "COMPRE UM ITEM D + E "
                      "\n E PAGUE R\$3.00!!! "
                      : item.sku == "E"
                      ? "COMPRE UM ITEM E + D "
                      "\n E PAGUE R\$3.00!!! "
                      : "Sem Promoção",
                       style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                       ),
                      subtitle: Text('Preço: R\$${item.unitPrice}', 
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 235, 31, 31)),
                      ),
                    ),
                    const Divider(thickness: 0.50,),
                  ],
                );
              },
            )
          ),
        ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              final total = controller.calculateTotal();
              return Text(
                'Total: \$${total.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24),
              );
            }),
          ),
          Expanded(flex: 10,
            child: ListView(
              scrollDirection: Axis.horizontal,
                shrinkWrap: true,    
                children: [
                  elevationButton(
                    () {
                    controller.addItem(Item(sku: 'A', unitPrice: 0.50));
                  }, 'Add A'),
                  const SizedBox(width: 5,),
                  elevationButton(
                    () {
                    controller.addItem(Item(sku: 'B', unitPrice: 0.75));
                  }, 'Add B'),
                  const SizedBox(width: 5,),
                  elevationButton(
                    () {
                    controller.addItem(Item(sku: 'C', unitPrice: 0.25));
                  }, 'Add C'),
                  const SizedBox(width: 5,),
                  elevationButton(
                    () {
                   controller.addItem(Item(sku: 'D', unitPrice: 1.50));
                  }, 'Add D'),
                  const SizedBox(width: 5,),
                  elevationButton(
                    () {
                    controller.addItem(Item(sku: 'E', unitPrice: 2.00));
                  }, 'Add E'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}