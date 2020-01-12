import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:poscomp/widgets/base_outline_button_title.dart';
import 'package:poscomp/widgets/base_raised_button_title.dart';
import 'package:poscomp/widgets/base_title.dart';
import 'package:poscomp/widgets/base_outline_button.dart';
import 'package:poscomp/widgets/base_raised_button.dart';

class BaseDialog extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final Function raiseButton;
  final Function outlineButton;

  BaseDialog(
      {this.title = 'Erro',
      this.description = 'Erro ao efetuar ação!',
      this.icon = Icons.error,
      this.color,
      this.raiseButton,
      this.outlineButton});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 32.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(icon, color: Colors.grey[900], size: 32.0),
                  SizedBox(width: 16.0),
                  BaseTitle(title, margin: EdgeInsets.all(0)),
                ],
              ),
            ),
            SizedBox(height: 32.0),
            Html(data: description),
            SizedBox(height: 32.0),
            Row(
              children: <Widget>[
                Visibility(
                  visible: outlineButton != null,
                  child: Expanded(
                    child: BaseOutlineButton(
                      child: BaseOutlineButtonTitle('Cancelar'),
                      onPressed: () => {raiseButton(), Navigator.pop(context)},
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Visibility(
                  visible: raiseButton != null,
                  child: Expanded(
                    child: BaseRaisedButton(
                        child: BaseRaisedButtonTitle('Confirmar'),
                        onPressed: () => {
                              raiseButton(),
                              Navigator.pop(context),
                            }),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
