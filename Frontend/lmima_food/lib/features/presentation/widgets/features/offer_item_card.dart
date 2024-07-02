import 'package:flutter/material.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../common/field.dart'; // Assuming you have defined CustomField widget

class OfferItemCard extends StatelessWidget {
  final String backgroundImage;
  final double width;
  final double height;
  final double borderRadius;

  const OfferItemCard({
    super.key,
    required this.backgroundImage,
    this.width = 600.0,
    this.height = 600.0,
    this.borderRadius = 0.0, // Adjust as needed
  });

  @override
  Widget build(BuildContext context) {
    ResponsiveSizeAdapter R = ResponsiveSizeAdapter(context);

    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            image: DecorationImage(
              image: AssetImage(backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: CustomField(
            arrangement: FieldArrangement.column,
            padding: EdgeInsets.all(R.size(20)),
            children: [
              Text(
                'Special Offer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: R.size(40),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: R.size(20)),
              Text(
                'Save up to 50% on selected items',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: R.size(24),
                ),
              ),
              SizedBox(height: R.size(40)),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Shop Now',
                  style: TextStyle(fontSize: R.size(20)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
