import 'package:flutter/material.dart';
import 'package:my_app/core/entities/store_entity.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/stores_list_component.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';

class ServiceTypeDescriptionScreen extends StatefulWidget {
  const ServiceTypeDescriptionScreen({Key? key}) : super(key: key);

  @override
  _ServiceTypeDescriptionScreenState createState() => _ServiceTypeDescriptionScreenState();
}

class _ServiceTypeDescriptionScreenState extends State<ServiceTypeDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarDefaultWidget(title: 'Serviços'),
          SizedBox(child: Image.asset('assets/backgrounds/pilates_class_banner.png')),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'O que é Pilates?',
                    style: AppTextStyles.defaultTextStyleTitle,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    'O pilates pode ser definido como um conjunto de exercícios para criar uma conexão entre corpo e mente. Pode ser praticado por qualquer pessoa, de qualquer idade – salvo restrições médicas. Diferente de outros exercícios, o pilates respeita os limites corporais de todos os seus alunos.',
                    style: AppTextStyles.defaultTextStyleDescriptionGrey,
                  ),
                ),
              ],
            ),
          ),
          StoresListComponent(
            title: 'Lojas em sua região',
            storeEntities: const [
              StoreEntity(
                description: 'Saúde & Bem-estar',
                name: 'Academia Health Fit',
                imagePath: 'assets/images/stores/store1.png',
              ),
              StoreEntity(
                description: 'Saúde & Bem-estar',
                name: 'Fitness Center',
                imagePath: 'assets/images/stores/store2.png',
              ),
              StoreEntity(
                description: 'Saúde & Bem-estar',
                name: 'Academia Health Fit',
                imagePath: 'assets/images/stores/store1.png',
              ),
              StoreEntity(
                description: 'Saúde & Bem-estar',
                name: 'Fitness Center',
                imagePath: 'assets/images/stores/store2.png',
              ),
              StoreEntity(
                description: 'Saúde & Bem-estar',
                name: 'Academia Health Fit',
                imagePath: 'assets/images/stores/store1.png',
              ),
              StoreEntity(
                description: 'Saúde & Bem-estar',
                name: 'Fitness Center',
                imagePath: 'assets/images/stores/store2.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}