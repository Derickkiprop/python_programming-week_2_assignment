// Function to calculate the total price with optional tax parameter
double calculateTotal(List<double> prices, {double taxRate = 0}) {
  double subtotal = prices.fold(0, (sum, price) => sum + price);
  double tax = subtotal * taxRate;
  return subtotal + tax;
}

// Anonymous function to filter items based on a minimum price threshold
List<double> filterItems(List<double> prices, double minPrice) {
  return prices.where((price) => price >= minPrice).toList();
}

// Higher-order function to apply a discount using a discount function
List<double> applyDiscount(List<double> prices, double Function(double) discountFunc) {
  return prices.map((price) => discountFunc(price)).toList();
}

// Recursive function to calculate a special discount based on factorial
int calculateFactorialDiscount(int n) {
  if (n <= 1) return 1;
  return n * calculateFactorialDiscount(n - 1);
}

// Main function to simulate the shopping cart system
void main() {
  List<double> cartPrices = [15.0, 50.0, 7.0, 25.0, 100.0];

  // Step 1: Filter out items below the price threshold (e.g., $10)
  List<double> filteredPrices = filterItems(cartPrices, 10.0);
  print("Filtered Prices (items >= \$10): $filteredPrices");

  // Step 2: Apply a discount function to each item in the filtered cart
  double discountPercent = 10; // e.g., 10% discount
  List<double> discountedPrices = applyDiscount(filteredPrices, (price) {
    return price - (price * (discountPercent / 100));
  });
  print("Prices after applying $discountPercent% discount: $discountedPrices");

  // Step 3: Calculate the total with tax (e.g., 5% tax)
  double taxRate = 0.05;
  double subtotal = calculateTotal(discountedPrices, taxRate: taxRate);
  print("Subtotal after tax: \$${subtotal.toStringAsFixed(2)}");

  // Step 4: Apply the special factorial discount on the subtotal
  int itemCount = filteredPrices.length;
  int factorialDiscountPercent = calculateFactorialDiscount(itemCount);
  double finalTotal = subtotal - (subtotal * (factorialDiscountPercent / 100));
  print("Final Total after $factorialDiscountPercent% factorial discount: \$${finalTotal.toStringAsFixed(2)}");
}
