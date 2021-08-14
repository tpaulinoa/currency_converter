class Currency {
  final String name;
  final double brl;
  final double usd;
  final double eur;

  Currency({required this.name, required this.brl, required this.usd, required this.eur});

  static List<Currency> getCurrencies() {
    return <Currency>[
      Currency(name: 'BRL', brl: 1.0, usd: 0.19, eur: 0.16),
      Currency(name: 'USD', brl: 5.25, usd: 1.0, eur: 0.85),
      Currency(name: 'EUR', brl: 6.19, usd: 1.18, eur: 1.0),
    ];
  }
}
