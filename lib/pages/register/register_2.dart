import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:my_app/core/ui/widgets/button_back.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/ui/component_styles/input_decoration.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/models/register/user.dart';

class Register2Page extends StatefulWidget {
  const Register2Page({Key? key}) : super(key: key);

  @override
  _Register2PageState createState() => _Register2PageState();
}

class _Register2PageState extends State<Register2Page> {
  final _formKey = GlobalKey<FormState>();

  String? _gender;
  bool _genderError = false;

  isValidGender() {
    return null != _gender;
  }

  isValidBirthday(String? birthDateString) {
    if (birthDateString == null || birthDateString.isEmpty) {
      return false;
    }
    String datePattern = "dd/MM/yyyy";

    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);

    DateTime today = DateTime.now();

    if (birthDate.isAfter(today) || birthDate.year < 1900) {
      return false;
    }
    return true;
  }

  var birthdayFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

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
                    color: VivassimoTheme.blue,
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
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  width: 300,
                  child: Text(
                    'Qual sua data de nascimento e gênero?',
                    style: customTextStyle(
                      FontWeight.w700,
                      23,
                      VivassimoTheme.purpleActive,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 324,
                        height: 90,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [birthdayFormatter],
                          onSaved: (value) {
                            RegisterUser.instance.birthday =
                                birthdayFormatter.getUnmaskedText();
                          },
                          validator: (value) {
                            if (!isValidBirthday(value)) {
                              return 'Data de nascimento inválido';
                            }
                            return null;
                          },
                          decoration:
                              customInputDecoration1('Digite a data aqui'),
                          textAlign: TextAlign.center,
                          style: customTextStyle(
                            FontWeight.w700,
                            18,
                            VivassimoTheme.purpleActive,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 324,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: _genderError
                                ? VivassimoTheme.redActive
                                : VivassimoTheme.yellow,
                            width: 2,
                          ),
                          color: VivassimoTheme.yellow,
                        ),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 10, right: 10),
                            filled: true,
                            fillColor: VivassimoTheme.yellow,
                            hintText: 'Gênero',
                            hintStyle: customTextStyle(
                              FontWeight.w700,
                              20,
                              VivassimoTheme.purpleActive,
                            ),
                          ),
                          style: customTextStyle(
                            FontWeight.w700,
                            20,
                            VivassimoTheme.purpleActive,
                          ),
                          dropdownColor: VivassimoTheme.yellow,
                          iconEnabledColor: VivassimoTheme.purple,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: VivassimoTheme.purple,
                          ),
                          iconSize: 30,
                          isExpanded: true,
                          items: ['Masculino', 'Feminino', 'Outro']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {
                            setState(() {
                              _gender = _.toString();
                              _genderError = false;
                            });
                          },
                          onSaved: (value) {
                            RegisterUser.instance.gender = value.toString();
                          },
                        ),
                      ),
                      Container(
                        width: 324,
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          _genderError ? 'Gênero não selecionado' : '',
                          textAlign: TextAlign.start,
                          style: customTextStyle(
                            FontWeight.w700,
                            18,
                            VivassimoTheme.redActive,
                          ),
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
                child: ButtonConfirm(
                  label: 'Continuar',
                  primary: VivassimoTheme.green,
                  onPrimary: VivassimoTheme.white,
                  borderColor: VivassimoTheme.white,
                  onPressed: () async {
                    if (isValidGender()) {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.of(context).pushNamed('/register/address1');
                      }
                    } else {
                      _formKey.currentState!.validate();
                      setState(() {
                        _genderError = true;
                      });
                    }
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
