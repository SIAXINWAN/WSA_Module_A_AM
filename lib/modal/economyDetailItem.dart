class EconomyDetailItem {
  final String country;
  final String flag;
  final double gdpUsdBn;
  final double growthPct;
  final double tradeBalanceUsdBn;
  final List<double> quarterlyGdpSeries;
  final String notes;
  final String descriptionMarquee;

  EconomyDetailItem({
    required this.country,
    required this.flag,
    required this.gdpUsdBn,
    required this.growthPct,
    required this.tradeBalanceUsdBn,
    required this.quarterlyGdpSeries,
    required this.notes,
    required this.descriptionMarquee,
  });

  factory EconomyDetailItem.fromJson(Map<String, dynamic> json) {
    final keyFigures = json['key_figures'] ?? {};
    return EconomyDetailItem(
      country: json['country'] ?? '',
      flag: json['flag'] ?? '',
      gdpUsdBn: (keyFigures['gdp_usd_bn'] ?? 0).toDouble(),
      growthPct: (keyFigures['growth_pct'] ?? 0).toDouble(),
      tradeBalanceUsdBn: (keyFigures['trade_balance_usd_bn'] ?? 0).toDouble(),
      quarterlyGdpSeries: (json['quarterly_gdp_series'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          [],
      notes: json['notes'] ?? '',
      descriptionMarquee: json['description_marquee'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'flag': flag,
      'key_figures': {
        'gdp_usd_bn': gdpUsdBn,
        'growth_pct': growthPct,
        'trade_balance_usd_bn': tradeBalanceUsdBn,
      },
      'quarterly_gdp_series': quarterlyGdpSeries,
      'notes': notes,
      'description_marquee': descriptionMarquee,
    };
  }
}
