import 'package:flutter/material.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  String _selectedAsset = 'EUR/USD';
  final TextEditingController _amountController =
      TextEditingController(text: '100');
  final TextEditingController _timeController = TextEditingController(text: '00:30');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Binary Options Trading',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBalanceCard(),
              const SizedBox(height: 24),
              _buildAssetSelector(),
              const SizedBox(height: 24),
              _buildChartPlaceholder(),
              const SizedBox(height: 24),
              _buildTradeControls(),
              const SizedBox(height: 32),
              _buildTradeHistory(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.grey[900],
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Balance',
                    style: TextStyle(color: Colors.white70, fontSize: 16)),
                SizedBox(height: 8),
                Text('\$10,000.00',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Icon(Icons.account_balance_wallet,
                color: Colors.amber, size: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetSelector() {
    return DropdownButtonFormField<String>(
      value: _selectedAsset,
      onChanged: (String? newValue) {
        setState(() {
          _selectedAsset = newValue!;
        });
      },
      decoration: InputDecoration(
        labelText: 'Asset',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey[850],
      ),
      dropdownColor: Colors.grey[850],
      items: <String>['EUR/USD', 'BTC/USD', 'AAPL', 'GOLD']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildChartPlaceholder() {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[800]!),
      ),
      child: const Center(
        child: Text(
          'Trading Chart Placeholder',
          style: TextStyle(color: Colors.white54, fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildTradeControls() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _timeController,
                decoration: InputDecoration(
                  labelText: 'Time',
                  prefixIcon: const Icon(Icons.timer_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.grey[850],
                ),
                keyboardType: TextInputType.datetime,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  prefixIcon: const Icon(Icons.attach_money),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.grey[850],
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle Put/Down action
                },
                icon: const Icon(Icons.arrow_downward),
                label: const Text('PUT', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle Call/Up action
                },
                icon: const Icon(Icons.arrow_upward),
                label: const Text('CALL', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTradeHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Trade History',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3, // Placeholder
          itemBuilder: (context, index) {
            return Card(
              color: Colors.grey[850],
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Icon(
                  index % 2 == 0 ? Icons.arrow_upward : Icons.arrow_downward,
                  color: index % 2 == 0 ? Colors.green : Colors.red,
                ),
                title: Text('EUR/USD - \$${100 + index * 10}'),
                subtitle: const Text('10:35:15 AM'),
                trailing: Text(
                  index % 2 == 0 ? '+ \$${85 + index * 10}' : '- \$${100 + index * 10}',
                  style: TextStyle(
                    color: index % 2 == 0 ? Colors.greenAccent : Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _timeController.dispose();
    super.dispose();
  }
}
