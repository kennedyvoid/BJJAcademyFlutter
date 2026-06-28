import 'package:flutter/material.dart';

enum Belt {
  white('Branca', 'Base competitiva e segurança', Color(0xFFF5F5F5), Color(0xFF222222)),
  blue('Azul', 'Ampliação técnica controlada', Color(0xFF1565C0), Color(0xFFFFFFFF)),
  purple('Roxa', 'Transições e ataques avançados', Color(0xFF6A1B9A), Color(0xFFFFFFFF)),
  brown('Marrom', 'Repertório quase completo', Color(0xFF6D4C41), Color(0xFFFFFFFF)),
  black('Preta', 'Alto rendimento e domínio técnico', Color(0xFF111111), Color(0xFFFFFFFF));

  final String label;
  final String subtitle;
  final Color color;
  final Color textColor;

  const Belt(this.label, this.subtitle, this.color, this.textColor);
}
