import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Color(0xff7B80AD))),
        child: ListTile(
          leading: Container(
            height: 50,
            width: 50,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: 50,
                    width: 50,
                    child: SvgPicture.asset('assets/icons/banner_ayat.svg')),
                Text(
                  '1',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ),
          title: Text(
            'data 2',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'data 3.1'.toUpperCase(),
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff7B80AD)),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.circle,
                color: Color(0xff7B80AD),
                size: 8,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'data 3.2'.toUpperCase(),
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff7B80AD)),
              ),
            ],
          ),
          trailing: Text(
            'data 4',
            style: TextStyle(
              fontFamily: 'Amiri',
              fontSize: 20,
              color: Color(0xffA44AFF),
            ),
          ),
        ));
  }
}
