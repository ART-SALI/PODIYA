import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/features/event_page/presentation/event_page.dart';
import 'package:pod_i_ya/features/main_app/data/model/event_model.dart';

class EventCard extends StatefulWidget {
  final EventModel eventModel;
  final String city;

  const EventCard({
    super.key,
    required this.eventModel,
    required this.city,
  });

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      height: 183,
      width: 335,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: NetworkImage(widget.eventModel.image!),
            fit: BoxFit.cover,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 12.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0x80676767),
                ),
                height: 24,
                width: 120,
                child: Center(
                  child: Text(
                    DateFormat('dd MMMM yyyy')
                        .format(widget.eventModel.time!)
                        .toString(),
                    style: const Font()
                        .s14
                        .copyWith(color: const Color(0xffffffff)),
                  ),
                ),
              ),
              Container(
                width: 143,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff676767),
                ),
                height: 36,
                width: 36,
                child: Center(
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: Color(0xffffffff),
                          size: 20,
                        ))),
              )
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(10.0)),
              color: Color(0x80505050),
            ),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: 195,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          height: 28,
                          child: Text(
                            widget.eventModel.name!.toString(),
                            style: const Font().s14.w600.copyWith(
                                  color: const Color(0xffffffff),
                                ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )),
                      SizedBox(
                        height: 22,
                        child: Text(
                          "${widget.city} ${DateFormat('h:mm').format(widget.eventModel.time!).toString()}",
                          style: const Font()
                              .s10
                              .copyWith(color: const Color(0xffffffff)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: 140,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff676767)),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EventPage(
                            eventModel: widget.eventModel,
                            city: widget.city,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Від ${widget.eventModel.price!.toStringAsFixed(2)}₴",
                          style: const Font().copyWith(
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
