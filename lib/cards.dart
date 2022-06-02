import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class cardsState extends StatefulWidget {
  String title;
  String images;

  cardsState({Key? key, required this.title, required this.images})
      : super(key: key);

  @override
  State<cardsState> createState() => _cardsStateState();
}

class _cardsStateState extends State<cardsState> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16, left: 16, bottom: 32),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 05),
                  blurRadius: 6,
                  spreadRadius: 3),
            ],
            image: DecorationImage(
                image: AssetImage(widget.images), fit: BoxFit.cover)),
        width: 200,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black, Colors.transparent]),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: RatingBar(
                      onRatingUpdate: (rating) {},
                      itemSize: 16,
                      itemPadding: EdgeInsets.only(right: 4),
                      ratingWidget: RatingWidget(
                        full: Icon(
                          Icons.start,
                          color: Colors.white,
                        ),
                        half: Icon(
                          Icons.star_half,
                          color: Colors.white,
                        ),
                        empty: Icon(
                          Icons.star_border_outlined,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
