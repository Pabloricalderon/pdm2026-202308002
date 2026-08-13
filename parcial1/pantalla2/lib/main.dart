import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


const kFondo = Color(0xFFF7F7F5);
const kTexto = Color(0xFF202020);
const kGris = Color(0xFF777777);
const kTarjeta = Color(0xFFFFFFFF);
const kVerde = Color(0xFFC8F34A);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neobank',
      theme: ThemeData(
        scaffoldBackgroundColor: kFondo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kVerde,
        ),
      ),
      home: const AddMoneyScreen(),
    );
  }
}

class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: kTarjeta,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                  ),
                ),

                const Expanded(
                  child: Center(
                    child: Text(
                      'Add money',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 42),
              ],
            ),

            const SizedBox(height: 28),

            
            const Text(
              'Select card',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 14),

            
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  bankCard(
                    'Debit card',
                    '•••• 4568',
                    true,
                    kVerde,
                  ),
                  const SizedBox(width: 10),
                  bankCard(
                    'Credit card',
                    '•••• 2478',
                    false,
                    const Color(0xFF303030),
                  ),
                  const SizedBox(width: 10),
                  bankCard(
                    'Bank card',
                    '•••• 8912',
                    false,
                    const Color(0xFFE5E5E5),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            
            const Text(
              'Add money to Neobank',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 14),

            
            moneyOption(
              Icons.account_balance,
              'Move your direct deposit',
            ),

            moneyOption(
              Icons.swap_horiz,
              'Transfer from other banks',
            ),

            moneyOption(
              Icons.apple,
              'Apple Pay',
            ),

            moneyOption(
              Icons.credit_card,
              'Debit / Credit Card',
            ),
          ],
        ),
      ),
    );
  }
}


Widget bankCard(
  String title,
  String number,
  bool selected,
  Color backgroundColor,
) {
  return Container(
    width: 145,
    height: 88,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: selected ? Colors.black : Colors.grey.shade300,
        width: selected ? 2 : 1,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: selected ? Colors.black : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
            ),

            const Text(
              'VISA',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ],
        ),

        Text(
          title,
          style: TextStyle(
            fontSize: 10,
            color: selected ? Colors.black : Colors.white,
          ),
        ),

        Text(
          number,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: selected ? Colors.black : Colors.white,
          ),
        ),
      ],
    ),
  );
}


Widget moneyOption(
  IconData icon,
  String title,
) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: kTarjeta,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(
        color: Colors.grey.shade200,
      ),
    ),
    child: ListTile(
      leading: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0ED),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          size: 20,
          color: kTexto,
        ),
      ),

      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),

      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
        color: kGris,
      ),

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 2,
      ),
    ),
  );
}