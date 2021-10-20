import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' show Placemark;
import 'package:my_app/components/button_back.dart';
import 'package:my_app/components/button_1.dart';
import 'package:my_app/components/text_style.dart';
import 'package:my_app/config/style.dart';
import 'package:location/location.dart';
import 'package:my_app/models/register/user.dart';
import 'package:my_app/services/cep_to_address.dart';
import 'package:my_app/services/location_to_address.dart';

class AddressOrLocationPage extends StatelessWidget {
  const AddressOrLocationPage({Key? key}) : super(key: key);

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
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.spaceAround,
          ),
        );
        return;
      }
    }

    _locationData = await location.getLocation();

    Placemark address =
        await getAddress(_locationData.latitude, _locationData.longitude);
    dynamic cepAddress =
        await cepToAddress(address.postalCode?.replaceAll('-', ''));

    RegisterUser.instance.estado = cepAddress['uf'];
    RegisterUser.instance.cidade = cepAddress['localidade'];
    RegisterUser.instance.bairro = cepAddress['bairro'];
    RegisterUser.instance.cep = cepAddress['cep'];
    RegisterUser.instance.numero = address.subThoroughfare;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: VivassimoTheme.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Hero(
              tag: 'registerAppBar',
              child: Container(
                height: 130,
                color: VivassimoTheme.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonBack(),
                        // texto
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text(
                            'Criar uma conta',
                            style: customTextStyle(
                              FontWeight.w700,
                              18,
                              VivassimoTheme.purpleActive,
                            ),
                          ),
                        )
                      ],
                    )
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
                      'Agora para que possamos fazer as suas entregas e oferecer os serviços mais proximos de você, precisamos que nos informe seu endereço ou autorizar usarmos sua localização.',
                      style: customTextStyle(
                        FontWeight.w700,
                        18,
                        VivassimoTheme.purpleActive,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 324,
                      height: 60,
                      child: CustomButton1(
                        label: 'Informar endereço',
                        primary: VivassimoTheme.green,
                        onPrimary: VivassimoTheme.white,
                        borderColor: VivassimoTheme.white,
                        onPressed: () {
                          Navigator.of(context).pushNamed('/register/cep');
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 324,
                      height: 60,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          getLocation(context);
                          Navigator.of(context).pushNamed('/register/cep');
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
