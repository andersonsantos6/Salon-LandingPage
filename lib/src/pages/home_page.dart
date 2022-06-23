import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromARGB(255, 242, 154, 46);
    const secondaryColor = Color.fromARGB(255, 242, 200, 121);
    const textPrimaryColor = Color.fromARGB(255, 140, 67, 3);
    var displaySize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        width: displaySize.width,
                        height: 80,
                        child: Image.asset('lib/src/assets/logo.png'),
                      ),
                      const Text(
                        'Você sempre bonita!',
                        style: TextStyle(
                            color: textPrimaryColor,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Image.asset(
                  'lib/src/assets/background.png',
                  fit: BoxFit.cover,
                ),
                width: double.infinity,
                height: displaySize.height * 0.25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Procedimentos',
                        style: TextStyle(
                            color: textPrimaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: primaryColor)),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextWidget(
                                        text: 'Escova',
                                        textPrimaryColor: textPrimaryColor),
                                    TextWidget(
                                        text: 'Prancha',
                                        textPrimaryColor: textPrimaryColor),
                                    TextWidget(
                                        text: 'Corte',
                                        textPrimaryColor: textPrimaryColor),
                                    TextWidget(
                                        text: 'Hidratação',
                                        textPrimaryColor: textPrimaryColor),
                                    TextWidget(
                                        text: 'Cauterização',
                                        textPrimaryColor: textPrimaryColor)
                                  ]),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextWidget(
                                        text: 'Relaxamento',
                                        textPrimaryColor: textPrimaryColor),
                                    TextWidget(
                                        text: 'Tintura',
                                        textPrimaryColor: textPrimaryColor),
                                    TextWidget(
                                        text: 'Selagem',
                                        textPrimaryColor: textPrimaryColor),
                                    TextWidget(
                                        text: 'Mechas',
                                        textPrimaryColor: textPrimaryColor),
                                    TextWidget(
                                        text: 'Botox',
                                        textPrimaryColor: textPrimaryColor)
                                  ]),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextWidget(
                                        text: 'Banho de brilho',
                                        textPrimaryColor: textPrimaryColor),
                                    TextWidget(
                                        text: 'Depilação Corporal',
                                        textPrimaryColor: textPrimaryColor),
                                  ]),
                            ],
                          ),
                        ),
                        height: displaySize.height * 0.18,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Atendimento',
                        style: TextStyle(
                          color: textPrimaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'De Segunda a Sábado, das 8:00h às 19:00h.',
                        style: TextStyle(color: textPrimaryColor),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Localização',
                        style: TextStyle(
                          color: textPrimaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'rua João Durval, n° 496, distrito de Itatiaia do Alto Bonito - São José do Jacuípe - BA.',
                        style: TextStyle(color: textPrimaryColor),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Sobre nós',
                        style: TextStyle(
                          color: textPrimaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'O Salão Capricho tem uma equipe de profissionais capacitados para oferecer o melhor serviço da região, contando com produtos e equipamentos de ponta para entregar o melhor resultado.',
                        style: TextStyle(color: textPrimaryColor),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: (() => _launchUrl(
                      'https://www.instagram.com/anderson.santos.dev/')),
                  child: Container(
                    child: Text(
                      'Desenvolvido por Anderson Santos @anderson.santos.dev',
                      style: TextStyle(color: textPrimaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: const Icon(Icons.message),
          onPressed: () {
            _launchUrl('your link here');
          },
        ),
      ),
    );
  }
}

void _launchUrl(_url) async {
  if (!await launchUrl(Uri.parse(_url))) throw 'Could not launch $_url';
}

class TextWidget extends StatelessWidget {
  late String text;
  late final textPrimaryColor;
  TextWidget({Key? key, required this.text, required this.textPrimaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
          color: textPrimaryColor, fontWeight: FontWeight.bold, fontSize: 12),
    );
  }
}
