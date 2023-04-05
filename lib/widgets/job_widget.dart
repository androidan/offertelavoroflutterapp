import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class JobWidget extends StatelessWidget {
  //final Coin coin;

  const JobWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        title: const Text(
          'Mobile Junior Developer ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: const Text(
          'Azienda: Gruppo Maggioli',
        ),
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            //color: Theme.of(context).primaryColor,
          ),
          // child: Icon(
          //   Icons.star_border_outlined,
          //   color: Theme.of(context).colorScheme.secondary,
          // ),
          child: Center(
              child: Text(
            '👨‍💻',
            style: TextStyle(fontSize: 30),
          )),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 70,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: AutoSizeText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  'Junior',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: 70,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade100,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: AutoSizeText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  'Full time',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
