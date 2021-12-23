import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:my_app/core/entities/store_entity.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/stores_list_component.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/features/services_purchase/presentation/stores/service_select_section_amount_store.dart';

import '../../services_purchase_module.dart';

class ServiceDescriptionScreen extends StatefulWidget {
  const ServiceDescriptionScreen({Key? key}) : super(key: key);

  @override
  _ServiceDescriptionScreenState createState() => _ServiceDescriptionScreenState();
}

class _ServiceDescriptionScreenState extends State<ServiceDescriptionScreen> {
  @override
  void initState() {
    initModule(ServicesPurchaseModule());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarDefaultWidget(title: 'Serviços'),
          SizedBox(
            child: Hero(
              tag: 'image_carousel_home',
              child: Image.asset('assets/backgrounds/pilates_class_banner.png'),
            ),
          ),
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
            storeEntities: [
              StoreEntity(
                description: 'Saúde & Bem-estar',
                name: 'Academia Health Fit',
                imagePath: 'assets/images/stores/store1.png',
                onPressed: () {
                  Navigator.of(context).pushNamed('/services-purchase/service-store-offer-description');
                },
              ),
              StoreEntity(
                description: 'Saúde & Bem-estar',
                name: 'Fitness Center',
                imagePath: 'assets/images/stores/store2.png',
                onPressed: () {
                  Navigator.of(context).pushNamed('/services-purchase/service-store-offer-description');
                },
              ),
              StoreEntity(
                description: 'Saúde & Bem-estar',
                name: 'Academia Health Fit',
                imagePath: 'assets/images/stores/store1.png',
                onPressed: () {
                  Navigator.of(context).pushNamed('/services-purchase/service-store-offer-description');
                },
              ),
              StoreEntity(
                description: 'Saúde & Bem-estar',
                name: 'Fitness Center',
                imagePath: 'assets/images/stores/store2.png',
                onPressed: () {
                  Navigator.of(context).pushNamed('/services-purchase/service-store-offer-description');
                },
              ),
              StoreEntity(
                description: 'Saúde & Bem-estar',
                name: 'Academia Health Fit',
                imagePath: 'assets/images/stores/store1.png',
                onPressed: () {
                  Navigator.of(context).pushNamed('/services-purchase/service-store-offer-description');
                },
              ),
              StoreEntity(
                description: 'Saúde & Bem-estar',
                name: 'Fitness Center',
                imagePath: 'assets/images/stores/store2.png',
                onPressed: () {
                  Navigator.of(context).pushNamed('/services-purchase/service-store-offer-description');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
