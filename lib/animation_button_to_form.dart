import 'package:flutter/material.dart';

class ButtonToLoginForm extends StatefulWidget {
  final double formHeight;
  final Widget childWidget;
  final Text buttonText;
  final Color color;
  const ButtonToLoginForm(
      {super.key,
      required this.formHeight,
      required this.childWidget,
      required this.buttonText,
      this.color = Colors.red});

  @override
  State<StatefulWidget> createState() => _ButtonToLoginFormState();
}

class _ButtonToLoginFormState extends State<ButtonToLoginForm> {
  bool selected = false;
  double logoOpacity = 0.0;

  get formHeigh => null;

  Future<void> changeLogoOpacity() async {
    if (selected) {
      await Future.delayed(const Duration(milliseconds: 500));
    }
    setState(() {
      logoOpacity = selected == true ? 1.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = true;
        });
        changeLogoOpacity();
      },
      child: Center(
          child: Stack(alignment: Alignment.center, children: <Widget>[
        AnimatedAlign(
          alignment: selected ? Alignment.center : const Alignment(0, 0.7),
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              width: selected ? 350 : 200,
              height: selected ? widget.formHeight + 60 : 80,
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                  color: widget.color, borderRadius: BorderRadius.circular(10)),
              child: selected
                  ? Stack(alignment: Alignment.center, children: <Widget>[
                      widget.childWidget,
                      teadLogoInAndOutAnimation(),
                      Positioned(
                        top: 5,
                        left: -15,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                selected = false;
                                changeLogoOpacity();
                              });
                            },
                            icon: const Icon(Icons.arrow_back)),
                      )
                    ])
                  : Center(child: widget.buttonText)),
        )
      ])),
    );
  }

  Positioned teadLogoInAndOutAnimation() {
    return Positioned(
      top: 0,
      child: AnimatedOpacity(
        duration: const Duration(seconds: 2),
        opacity: logoOpacity,
        curve: Curves.fastOutSlowIn,
        child: Image.asset(
          'assets/images/arvore_logo_tead_600X600.png',
          width: 90,
          height: 90,
        ),
      ),
    );
  }
}
