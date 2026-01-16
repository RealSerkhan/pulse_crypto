import 'dart:async';
import 'package:crypto_assessment/base/networking/websocket_client.dart';
import 'package:crypto_assessment/features/market_data/data/models/market_data_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

abstract class MarketDataWebSocketDataSource {
  Stream<MarketDataDto> get marketUpdates;
  void connect();
  void disconnect();
}

@LazySingleton(as: MarketDataWebSocketDataSource)
class MarketDataWebSocketDataSourceImpl implements MarketDataWebSocketDataSource {
  final Logger _logger;
  late final WebSocketClient _wsClient;
  final StreamController<MarketDataDto> _updatesController = StreamController<MarketDataDto>.broadcast();

  MarketDataWebSocketDataSourceImpl(this._logger) {
    _wsClient = WebSocketClient(url: 'ws://localhost:3000', logger: _logger);

    // Listen to WebSocket messages and convert them to MarketDataDto
    _wsClient.messages.listen((message) {
      try {
        if (message['type'] == 'market_update') {
          final data = message['data'] as Map<String, dynamic>;

          // Convert WebSocket data to MarketDataDto format
          final dto = MarketDataDto.fromWebsocket(data);

          _updatesController.add(dto);
          _logger.d('📊 Market update received: ${dto.symbol} - \$${dto.price}');
        }
      } catch (e) {
        _logger.e('❌ Error processing market update: $e');
      }
    });
  }

  @override
  Stream<MarketDataDto> get marketUpdates => _updatesController.stream;

  @override
  void connect() {
    _logger.i('🔌 Connecting to market data WebSocket...');
    _wsClient.connect();
  }

  @override
  void disconnect() {
    _logger.i('🔌 Disconnecting from market data WebSocket...');
    _wsClient.disconnect();
  }

  // @disposeMethod
  // void dispose() {
  //   _logger.i('🗑️ Disposing market data WebSocket...');
  //   _wsClient.dispose();
  //   _updatesController.close();
  // }
}
