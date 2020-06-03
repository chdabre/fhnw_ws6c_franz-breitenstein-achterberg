
import 'package:flutter/material.dart';
import 'package:movieapp/models/person.dart';
import 'package:movieapp/services/tmdb.dart';

class PersonListTile extends StatelessWidget {
  const PersonListTile({
    Key key,
    @required this.person,
  }) : super(key: key);

  final Person person;

  String _roleLabel() {
    return person.character != null ? person.character : person.job ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: <Widget>[
            if (person.profilePath != null)Image.network(TmdbApi.buildImageUrl(person.profilePath, 'w185'),
              fit: BoxFit.cover,
              width: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(person.name, style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
                  color: Colors.white.withOpacity(0.6),
                  width: 100,
                ),
                Container(
                  child: Text(_roleLabel(), style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.center,),
                  color: Colors.white.withOpacity(0.6),
                  width: 100,
                ),
              ],
            )
          ],
        )
    );
  }
}