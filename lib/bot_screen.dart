import 'package:flutter/material.dart';
import 'package:prosper/utils/app_colors.dart';
import 'package:prosper/utils/app_images.dart';

class BotScreen extends StatefulWidget {
  static const String screenName = "/bot";
  const BotScreen({super.key});

  @override
  _BotScreenState createState() => _BotScreenState();
}

class _BotScreenState extends State<BotScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleBottomSheet() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

 void _showMessageOverlay(String messageType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.grayPrimaryColor,
            ),
            height: 600,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 5),
                  Text(
                    messageType,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ],
                ),

                const SizedBox(height: 10),
                Expanded(
                  child: messageType == 'Padrão'
                      ? _buildStandardMessage()
                      : _buildCustomMessage(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Ação de envio da mensagem
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 92),
                  ),
                  child: const Text('Enviar', style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

    Widget _buildStandardMessage() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Olá Chico coins, tudo bem?\n\n'
            'Gostaria de lembrar sobre o pagamento pendente de 4.000,00 referente a ultima compra, que venceu em 12/12/2012. '
            'Peço que o pagamento seja efetuado até amanhã ou que entre em contato para discutirmos uma solução.\n\n'
            'Agradeço pela atenção e compreensão.',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomMessage() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: const TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Escreva sua mensagem aqui',
          hintStyle: TextStyle(color: Colors.white54),
        ),
        maxLines: 10,
        minLines: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(AppImages.fundo), 
        fit: BoxFit.cover,
      ), 
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImages.botImg,
              height: 30,
            ),
            const SizedBox(width: 5),
            const Text(
              'BOT',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
          ]
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: const Center( 
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFF3BC10C),
                        radius: 50,
                        child: Image(
                          image: AssetImage(AppImages.person), 
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Chico Moedas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                      ),
                      const SizedBox(height: 16),
                      // Botão "Cobrar"
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ElevatedButton(
                          onPressed: _toggleBottomSheet,
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
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Compras',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Transform.translate(
                  offset: Offset(0, (1 - _animation.value) * 350), // Alteração para mover a aba de acordo com o valor da animação
                  child: Opacity(
                    opacity: _animation.value, // Faz a aba aparecer/desaparecer suavemente
                    child: Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        color: Color(0xff444444),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                    
                                Icon(Icons.arrow_back, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  'Tipos de mensagens',
                                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          _buildMessageTypeButton('Padrão', Icons.message),
                          _buildMessageTypeButton('Personalizada', Icons.edit),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );

  Widget _buildMessageTypeButton(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
      child: ElevatedButton(
        onPressed: () => _showMessageOverlay(text), // Exibir mensagem correspondente
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Row(
          children: [
            const SizedBox(width: 30),
            Icon(icon, color: Colors.white,),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
