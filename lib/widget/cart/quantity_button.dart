import 'package:flutter/material.dart';
import 'package:movie2/helper/color.dart';

class QuantityButton extends StatefulWidget {
  final Function(int) onChanged; // Callback để gửi giá trị ra ngoài
  final int initialCount;

  const QuantityButton({
    Key? key,
    required this.onChanged,
    required this.initialCount,
  }) : super(key: key);

  @override
  _QuantityButtonState createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount; // Gán giá trị khởi tạo
  }

  void _increment() {
    setState(() {
      count++;
      widget.onChanged(count); // Gửi giá trị mới qua callback
    });
  }

  void _decrement() {
    setState(() {
      count = count > 0 ? count - 1 : 0; // Đảm bảo không âm
      widget.onChanged(count); // Gửi giá trị mới qua callback
    });
  }

  void _showInputDialog() async {
    TextEditingController controller = TextEditingController();
    int? newCount = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nhập số lượng mong muốn'),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Nhập số lượng'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop(); // Đóng hộp thoại
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                int? input = int.tryParse(controller.text);
                Navigator.of(context).pop(input); // Trả về số lượng mới
              },
            ),
          ],
        );
      },
    );

    if (newCount != null && newCount >= 0) {
      setState(() {
        count = newCount;
        widget.onChanged(count); // Gửi giá trị mới qua callback
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _decrement,
          child: Container(
            height: 25,
            width: 25,
            decoration: GradientStyles.colorbuttomitemGradient(context: context),
            child: const Icon(Icons.remove, color: Colors.black54, size: 20),
          ),
        ),
        GestureDetector(
          onTap: _showInputDialog, // Hiện hộp thoại khi nhấp vào số lượng
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '$count',
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
        GestureDetector(
          onTap: _increment,
          child: Container(
            height: 25,
            width: 25,
            decoration: GradientStyles.colorbuttomitemGradient(context: context),
            child: const Icon(Icons.add, color: Colors.black54, size: 20),
          ),
        ),
      ],
    );
  }
}