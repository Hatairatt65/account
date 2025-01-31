import 'package:account/formScreen.dart';
import 'package:account/model/transaction.dart';
import 'package:account/provider/transactionProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Finance Tracker',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8E44AD)), // สีม่วงหรูหรา
          useMaterial3: true,
          fontFamily: 'Montserrat', // ใช้ฟอนต์ที่ดูโมเดิร์นขึ้น
        ),
        home: const MyHomePage(title: 'การบันทึกธุรกรรม'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TransactionProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart, color: Colors.white),
            onPressed: () {
              // อนาคตอาจเพิ่มหน้า Dashboard หรือสถิติ
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FormScreen()));
            },
          ),
        ],
      ),
      body: provider.transactions.isEmpty
          ? const Center(
              child: Text(
                "ไม่มีข้อมูลธุรกรรม",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: provider.transactions.length,
                itemBuilder: (context, index) {
                  Transaction data = provider.transactions[index];
                  return Card(
                    elevation: 5,
                    shadowColor: Colors.purple.withOpacity(0.3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      title: Text(
                        data.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Text(
                        "${data.date.day}/${data.date.month}/${data.date.year}",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      leading: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [Colors.purple, Colors.deepPurpleAccent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 25,
                          child: Text(
                            data.amount.toStringAsFixed(0),
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.purpleAccent),
                      onTap: () {
                        // อนาคตอาจเพิ่มหน้าแสดงรายละเอียด
                      },
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => FormScreen()));
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
