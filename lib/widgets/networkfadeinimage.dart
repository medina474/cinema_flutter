import 'package:flutter/material.dart';

class NetworkFadeInImage extends StatefulWidget {
  final String imageUrl;
  final String placeholder;
  final double width;
  final double height;

  const NetworkFadeInImage({
    required this.imageUrl,
    required this.placeholder,
    required this.width,
    required this.height,
    super.key,
  });

  @override
  State<NetworkFadeInImage> createState() => _NetworkFadeInImageState();
}

class _NetworkFadeInImageState extends State<NetworkFadeInImage>
    with SingleTickerProviderStateMixin {
  bool _isLoaded = false;
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          widget.placeholder,
          fit: BoxFit.cover,
          width: widget.width,
          height: widget.height,
        ),
        if (!_hasError)
          AnimatedOpacity(
            opacity: _isLoaded ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 600),
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
              width: widget.width,
              height: widget.height,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  // L'image est chargée avec succès
                  if (!_isLoaded) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) {
                        setState(() => _isLoaded = true);
                      }
                    });
                  }
                  return child;
                } else {
                  return const SizedBox.shrink();
                }
              },
              errorBuilder: (context, error, stackTrace) {
                if (!_hasError) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) {
                      setState(() => _hasError = true);
                    }
                  });
                }
                return const SizedBox.shrink();
              },
            ),
          ),
      ],
    );
  }
}
