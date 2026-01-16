import 'package:equatable/equatable.dart';

class MarketData extends Equatable {
  final String symbol;
  final double price;
  final double? change24h;
  final double? changePercent24h;
  final double? volume24h;
  final double? marketCap;
  final double? high24h;
  final double? low24h;
  final String? lastUpdate;
  final double? circulatingSupply;
  final double? totalSupply;
  final double? maxSupply;

  const MarketData({
    required this.symbol,
    required this.price,
    required this.change24h,
    required this.changePercent24h,
    this.volume24h,
    this.marketCap,
    this.high24h,
    this.low24h,
    this.lastUpdate,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
  });

  //copyWith

  MarketData copyWith({
    String? symbol,
    double? price,
    double? change24h,
    double? changePercent24h,
    double? volume24h,
    double? marketCap,
    double? high24h,
    double? low24h,
    String? lastUpdate,
    double? circulatingSupply,
    double? totalSupply,
    double? maxSupply,
  }) {
    return MarketData(
      symbol: symbol ?? this.symbol,
      price: price ?? this.price,
      change24h: change24h ?? this.change24h,
      changePercent24h: changePercent24h ?? this.changePercent24h,
      volume24h: volume24h ?? this.volume24h,
      marketCap: marketCap ?? this.marketCap,
      high24h: high24h ?? this.high24h,
      low24h: low24h ?? this.low24h,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      circulatingSupply: circulatingSupply ?? this.circulatingSupply,
      totalSupply: totalSupply ?? this.totalSupply,
      maxSupply: maxSupply ?? this.maxSupply,
    );
  }

  @override
  List<Object?> get props => [
    symbol,
    price,
    change24h,
    changePercent24h,
    volume24h,
    marketCap,
    high24h,
    low24h,
    lastUpdate,
    circulatingSupply,
    totalSupply,
    maxSupply,
  ];

  bool get isPositiveChange => (change24h ?? 0) >= 0;
}
