import '../../core.dart';

const defaultGridColor = Color.fromARGB(50, 255, 0, 0);

class GridOverlay extends StatefulWidget {
  final Widget child;
  final int gridSize;
  final int gridThickness;
  final Color gridColor;
  GridOverlay(
    this.child, {
    this.gridSize = 8,
    this.gridThickness = 1,
    this.gridColor = defaultGridColor,
    Key? key,
  }) : super(key: key);

  @override
  State<GridOverlay> createState() => _GridOverlayState();
}

class _GridOverlayState extends State<GridOverlay> {
  bool gridVisible = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        widget.child,
        if (gridVisible)
          SizedBox(
            width: screenSize.width,
            height: screenSize.height,
            child: CustomPaint(
              painter: GridPainter(
                gridColor: widget.gridColor,
                gridSize: widget.gridSize,
                gridThickness: widget.gridThickness,
              ),
            ),
          ),
        SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  gridVisible = !gridVisible;
                });
              },
              child: const Text("toggle grid"),
            ),
          ),
        ),
      ],
    );
  }
}

class GridPainter extends CustomPainter {
  final int gridSize;
  final int gridThickness;
  final Color gridColor;
  GridPainter({
    this.gridSize = 8,
    this.gridThickness = 1,
    this.gridColor = defaultGridColor,
  }) : super();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = gridColor
      ..strokeWidth = gridThickness.toDouble();

    // canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), paint);
    for (var i = 0; i < (size.width + 1) / gridSize; i++) {
      canvas.drawLine(Offset(gridSize * i.toDouble(), 0),
          Offset(gridSize * i.toDouble(), size.height), paint);
    }
    for (var i = 0; i < (size.height + 1) / gridSize; i++) {
      canvas.drawLine(
          Offset(0, gridSize * i.toDouble()),
          Offset(
            size.width,
            gridSize * i.toDouble(),
          ),
          paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
