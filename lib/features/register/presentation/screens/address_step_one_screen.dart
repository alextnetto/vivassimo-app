import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geocoding/geocoding.dart' show Placemark;
import 'package:my_app/core/app_services/location_handler/location_handler.dart';
import 'package:my_app/core/app_services/location_handler/models/cep_response_model.dart';
import 'package:my_app/core/ui/app_masks/app_masks.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/ui/widgets/loading_indicator.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:location/location.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/presentation/stores/address_step_one_store.dart';

class AddressStepOneScreen extends StatefulWidget {
  const AddressStepOneScreen({Key? key, required this.registerUserRequestModel})
      : super(key: key);
  final RegisterUserRequestModel registerUserRequestModel;

  @override
  _AddressStepOneScreenState createState() => _AddressStepOneScreenState();
}

class _AddressStepOneScreenState extends State<AddressStepOneScreen> {
  RegisterUserRequestModel get registerUserRequestModel =>
      widget.registerUserRequestModel;

  AddressStepOneStore addressStepOneStore = Modular.get<AddressStepOneStore>();

  getLocation(context) async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Permissão negada pelo usuário'),
            content:
                Text('Agora somente autorizando nas configurações do celular.'),
            contentPadding: EdgeInsets.all(20),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        // if user do not authorize the app, do not continue
        return;
      }
    }

    LoadingIndicator.show(context);

    _locationData = await location.getLocation();

    Placemark placemark = await LocationHandler.getAddressByCoordinates(
        _locationData.latitude, _locationData.longitude);

    CepResponseModel cepResponseModel = await LocationHandler.getAddressByCep(
        placemark.postalCode?.replaceAll('-', ''));

    LoadingIndicator.hide(context);

    if (!cepResponseModel.success) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Localização falhou'),
          content: Text(
              'Não conseguimos o seu CEP através da localização, preencha manualmente'),
          contentPadding: EdgeInsets.all(20),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    Navigator.of(context).pushNamed(
      '/register/address2',
      arguments: {
        'registerUserRequestModel': registerUserRequestModel,
        'cepResponseModel': cepResponseModel
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: VivassimoTheme.white,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Column(
              children: [
                Hero(
                  tag: 'registerAppBar',
                  child: Container(
                    height: 130,
                    color: VivassimoTheme.white,
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 40,
                        ),
                        AppBarDefaultWidget(title: 'Criar uma conta'),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Muito bem!',
                        style: customTextStyle(
                          FontWeight.w800,
                          26,
                          VivassimoTheme.purpleActive,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 324,
                        child: Text(
                          'Para oferecermos os serviços mais próximos de você, precisamos que nos informe seu endereço ou autorizar usarmos sua localização.',
                          style: customTextStyle(
                            FontWeight.w700,
                            18,
                            VivassimoTheme.purpleActive,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 324,
                        height: 60,
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            await getLocation(context);
                          },
                          icon: Icon(
                            Icons.room,
                            color: VivassimoTheme.purpleActive,
                            size: 32,
                          ),
                          label: Text(
                            'Usar localização',
                            style: customTextStyle(
                              FontWeight.w700,
                              23,
                              VivassimoTheme.purpleActive,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: VivassimoTheme.yellow,
                            side: BorderSide(
                              width: 2.0,
                              color: VivassimoTheme.red,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          'ou',
                          style: customTextStyle(
                            FontWeight.w700,
                            18,
                            VivassimoTheme.purpleActive,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          height: 90,
                          child: Observer(builder: (_) {
                            return AppTextField(
                              label: 'Digite seu CEP',
                              onChanged: addressStepOneStore.setCep,
                              errorText: addressStepOneStore.getCepError,
                              inputFormatters: [AppMasks.cep],
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Hero(
              tag: 'registerButtonConfirm',
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Observer(
                  builder: (_) {
                    return ButtonConfirm(
                      label: 'Continuar',
                      primary: VivassimoTheme.green,
                      textColor: VivassimoTheme.white,
                      borderColor: VivassimoTheme.white,
                      onPressed: addressStepOneStore.enableButton
                          ? () {
                              Navigator.pushNamed(
                                context,
                                '/register/address2',
                                arguments: {
                                  'registerUserRequestModel':
                                      registerUserRequestModel,
                                  'cepResponseModel':
                                      addressStepOneStore.cepResponseModel
                                },
                              );
                            }
                          : null,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
