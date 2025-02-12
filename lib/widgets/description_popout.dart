import 'package:flutter/material.dart';

class DescriptionPopout extends StatefulWidget {
  @override
  _DescriptionPopoutState createState() => _DescriptionPopoutState();
}

class _DescriptionPopoutState extends State<DescriptionPopout> {
  bool isExpanded = false;
  String fullText =
      "Thanks to REDMAGIC for sponsoring this video! Check out the REDMAGIC 10 Pro.\n\n"
      "Happy New Year! Well, Chinese New Year! To celebrate, we asked our friends from China, Taiwan, and even some BiliBili Creators to send over their gaming setups and battlestations for Jake, Linus, and Andy to roast.";

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6, // Initial size (40% of screen height)
      minChildSize: 0.3, // Minimum size (20% of screen height)
      maxChildSize: 0.9, // Maximum size (90% of screen height)
      expand: false, // Prevent the sheet from expanding to full height by default
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey[600]),
                  SizedBox(height: 20),
                  Text(
                    "Reacting to INSANE Chinese Gaming Setups",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _infoColumn("9,497", "Likes"),
                      _infoColumn("117,445", "Views"),
                      _infoColumn("1h", "Ago"),
                    ],
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 32, 32, 32),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isExpanded ? fullText : fullText.substring(0, 100) + "...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          maxLines: isExpanded ? null : 3, // Limit to 3 lines when not expanded
                          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                        ),
                        if (!isExpanded)
                          GestureDetector(
                            onTap: () => setState(() => isExpanded = true),
                            child: Text(
                              "...more",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _infoColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}