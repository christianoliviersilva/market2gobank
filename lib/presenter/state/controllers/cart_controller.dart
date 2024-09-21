import 'package:get/get.dart';
import 'package:marketapp/domain/model/item.dart';

class CartController extends GetxController {
  var cartItems = <Item>[].obs;
  
  // Adiciona o item ao carrinho
  void addItem(Item item) {
    cartItems.add(item);
  }

  // Função para calcular o total com as promoções
  double calculateTotal() {
    var total = 0.0;
    var itemCount = <String, int>{};

    // Conta quantas unidades de cada item tem no carrinho
    for (var item in cartItems) {
      itemCount[item.sku] = (itemCount[item.sku] ?? 0) + 1;
    }

    // Aplica promoções
    // Promoção: 2 "B" por R$1.25
    if (itemCount.containsKey('B')) {
      int bCount = itemCount['B']!;
      total += (bCount ~/ 2) * 1.25 + (bCount % 2) * 0.75;
    }

    // Promoção: 1 "D" + 1 "E" por R$3.00
    if (itemCount.containsKey('D') && itemCount.containsKey('E')) {
      int dCount = itemCount['D']!;
      int eCount = itemCount['E']!;
      int promoPairs = dCount < eCount ? dCount : eCount;
      total += promoPairs * 3.00;
      itemCount['D'] = dCount - promoPairs;
      itemCount['E'] = eCount - promoPairs;
    }

    // Aplica os preços normais para os itens restantes "D" e "E"
    total += (itemCount['D'] ?? 0) * 1.50;
    total += (itemCount['E'] ?? 0) * 2.00;

    // Promoção: 3 "C" ganha 1 grátis
    if (itemCount.containsKey('C')) {
      int cCount = itemCount['C']!;
      total += ((cCount ~/ 4) * 3 + (cCount % 4)) * 0.25;
    }

    // Promoção: 3 "A" por R$1.30

    if (itemCount.containsKey('A')) {
      int cCount = itemCount['A']!;
      total += (cCount ~/ 3) * 1.30 + (cCount % 3) * 0.50;
    }
    return total;
  }
}
