import 'package:flutter/cupertino.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventTime,
    required this.eventLocation,
    required this.color,
    required this.textColor,
  });

  final String eventDescription;
  final String eventTitle;
  final String eventTime;
  final String eventLocation;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10,
          width: MediaQuery.sizeOf(context).width,
          decoration:  BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
        ),
        Container(
          height: 87,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: color.withOpacity(0.3),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventTitle,
                  style:  TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  eventDescription,
                  style:  TextStyle(
                    color: textColor,
                    fontFamily: "Poppins",
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),

                /// Title
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.time_solid,
                      color: textColor,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      eventTime,
                      style:  TextStyle(
                        color: textColor,
                        fontFamily: "Poppins",
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      CupertinoIcons.location_solid,
                      color: textColor,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      eventLocation,
                      style:  TextStyle(
                        color: textColor,
                        fontFamily: "Poppins",
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}