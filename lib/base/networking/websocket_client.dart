import 'dart:async';
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// WebSocket client for real-time updates
class WebSocketClient {
  final String url;
  final Logger logger;

  WebSocketChannel? _channel;
  final StreamController<Map<String, dynamic>> _messageController = StreamController<Map<String, dynamic>>.broadcast();
  Timer? _reconnectTimer;
  bool _isDisposed = false;
  int _reconnectAttempts = 0;
  static const int _maxReconnectAttempts = 5;
  static const Duration _reconnectDelay = Duration(seconds: 3);

  WebSocketClient({required this.url, required this.logger});

  /// Stream of incoming messages
  Stream<Map<String, dynamic>> get messages => _messageController.stream;

  /// Check if WebSocket is connected
  bool get isConnected => _channel != null;

  /// Connect to WebSocket server
  void connect() {
    if (_isDisposed) return;

    try {
      logger.i('🔌 Connecting to WebSocket: $url');

      _channel = WebSocketChannel.connect(Uri.parse(url));

      _channel!.stream.listen(
        (message) {
          try {
            final data = jsonDecode(message as String) as Map<String, dynamic>;
            logger.d('📨 WebSocket message received: ${data['type']}');
            _messageController.add(data);
            _reconnectAttempts = 0; // Reset on successful message
          } catch (e) {
            logger.e('❌ Error parsing WebSocket message: $e');
          }
        },
        onError: (error) {
          logger.e('❌ WebSocket error: $error');
          _handleDisconnection();
        },
        onDone: () {
          logger.w('⚠️ WebSocket connection closed');
          _handleDisconnection();
        },
      );

      logger.i('✅ WebSocket connected successfully');
    } catch (e) {
      logger.e('❌ WebSocket connection failed: $e');
      _handleDisconnection();
    }
  }

  /// Handle disconnection and attempt reconnect
  void _handleDisconnection() {
    if (_isDisposed) return;

    _channel = null;

    if (_reconnectAttempts < _maxReconnectAttempts) {
      _reconnectAttempts++;
      logger.i('🔄 Reconnecting in ${_reconnectDelay.inSeconds}s (attempt $_reconnectAttempts/$_maxReconnectAttempts)');

      _reconnectTimer?.cancel();
      _reconnectTimer = Timer(_reconnectDelay, () {
        connect();
      });
    } else {
      logger.e('❌ Max reconnection attempts reached. Giving up.');
    }
  }

  /// Send a message through WebSocket
  void send(Map<String, dynamic> message) {
    if (_channel != null) {
      try {
        _channel!.sink.add(jsonEncode(message));
        logger.d('📤 WebSocket message sent: ${message['type']}');
      } catch (e) {
        logger.e('❌ Error sending WebSocket message: $e');
      }
    } else {
      logger.w('⚠️ Cannot send message: WebSocket not connected');
    }
  }

  /// Disconnect from WebSocket
  void disconnect() {
    logger.i('🔌 Disconnecting WebSocket');
    _reconnectTimer?.cancel();
    _channel?.sink.close();
    _channel = null;
  }

  /// Dispose resources
  void dispose() {
    _isDisposed = true;
    disconnect();
    _messageController.close();
    logger.i('🗑️ WebSocket client disposed');
  }
}
