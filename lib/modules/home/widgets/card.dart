import 'package:flutter/material.dart'; 

class CardFiles extends StatelessWidget {
  const CardFiles({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  final String text;
  final Color color; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 75.0,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(12.0), topLeft: Radius.circular(12.0)), color: Colors.black26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Image.asset(
                    'assets/image/icono.png',
                    width: 42,
                    height: 42,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SizedBox(
                      width: 245.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            text,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w700,
                              fontSize: 15.5,
                            ),
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Container(
            height: 1.4,
            width: double.infinity,
            color: color,
          )
        ],
      ),
    );
  }
}
