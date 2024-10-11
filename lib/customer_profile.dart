import 'package:flutter/material.dart';
import 'package:prosper/utils/app_colors.dart';
import 'package:prosper/utils/app_images.dart';

class CustomerProfile extends StatefulWidget {
  static const String screenName = '/customerProfile';
  const CustomerProfile({super.key});

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  @override
  Widget build(BuildContext context) => Container(
    
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(AppImages.fundo),
        fit: BoxFit.cover,
      ),
    ),
    child: Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 70),
            child: const Center(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFF3BC10C),
                    radius: 35,
                    child: Image(
                      image: AssetImage(AppImages.person),
                      height: 40,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Menina Veneno',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
          // Adicionamos o Spacer aqui para controlar o espaço superior do Container cinza
          const Spacer(), 
          Container(
            height: 450, // Definimos uma altura específica para o container cinza
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Historico de compras',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Card(
                        color: const Color(0xff454343),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const ListTile(
                          leading: Icon(
                            Icons.shopping_bag,
                            color: Color(0xFF3BC10C),
                            size: 30,
                          ),
                          title: Text(
                            'Perfume',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          trailing: Text(
                            'R\$ 79,90',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text(
                      'Cobrar',
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
