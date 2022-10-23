// to launch local auth
import 'package:app_finanzas_bakapp/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerPrintAuth extends StatefulWidget {
  const FingerPrintAuth({Key? key}) : super(key: key);

  @override
  _FingerPrintAuthState createState() => _FingerPrintAuthState();
}

class _FingerPrintAuthState extends State<FingerPrintAuth> {
  bool authenticated = false;
  void authenticate() async {
    try {
      var localAuth = LocalAuthentication();
      authenticated = await localAuth.authenticate(
        localizedReason: 'Por favor debe auntenticarse para continuar',
        // biometricOnly: true,
        //useErrorDialogs: true,
      );
      if (authenticated) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } else {
        setState(() {});
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "ERROR",
          ),
          content: const Text(
            "¡Debe configurar la autenticación con PIN o con huella digital para poder usar esta aplicación!\nHago esto por su seguridad 🙂",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Ok",
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    authenticate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Autenticación"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.white54,
              ),
              child: Icon(
                Icons.lock_outline_rounded,
                color: Theme.of(context).primaryColor,
                size: 150.0,
              ),
            ),
            //
            const SizedBox(
              height: 15.0,
            ),
            //
            if (!authenticated)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "¡Ay, chasquido! Necesita autenticarse para seguir adelante.",
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  //
                  SizedBox(
                    height: 15.0,
                  ),
                  //
                  TextButton(
                    onPressed: () {
                      authenticate();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Intentar otra vez",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        //
                        SizedBox(
                          width: 5.0,
                        ),
                        //
                        Icon(
                          Icons.replay_rounded,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
