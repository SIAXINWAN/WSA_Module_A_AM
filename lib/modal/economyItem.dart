class EconomyItem {
  final String country;
  final String code;
  final String flag;
  final double gdpUsdBn;
  final double growthPct;
  final double tradeBalanceUsdBn;

  EconomyItem({
    required this.country,
    required this.code,
    required this.flag,
    required this.gdpUsdBn,
    required this.growthPct,
    required this.tradeBalanceUsdBn,
  });

  factory EconomyItem.fromJson(Map<String, dynamic> json) {
    return EconomyItem(
      country: json['country'] ?? '',
      code: json['code'] ?? '',
      flag: json['flag'] ?? '',
      gdpUsdBn: (json['gdp_usd_bn'] as num).toDouble(),
      growthPct: (json['growth_pct'] as num).toDouble(),
      tradeBalanceUsdBn: (json['trade_balance_usd_bn'] as num).toDouble(),
    );
  }
}
