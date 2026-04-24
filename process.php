<?php
/**
 * process.php — Mock Purchase Processor
 * Handles form submission, validates inputs server-side,
 * simulates the purchase and returns a JSON response.
 *
 * IMPORTANT: This is a DEMO. No real payment is processed.
 * In production, integrate with a real payment gateway (Stripe, PayPal, etc.)
 * and implement proper server-side security.
 */

// ── Security Headers ──
header('X-Content-Type-Options: nosniff');
header('X-Frame-Options: DENY');
header('Referrer-Policy: strict-origin-when-cross-origin');

// Only accept POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    header('Location: purchase.php');
    exit;
}

// If called from JS as AJAX (mock=1), return JSON
$is_ajax = isset($_POST['mock']) && $_POST['mock'] === '1';

if ($is_ajax) {
    header('Content-Type: application/json');
    echo json_encode(['status' => 'ok', 'message' => 'Mock order logged']);
    exit;
}

// ── Server-side Validation ──
require_once 'includes/packages.php';

$errors = [];

// Sanitize inputs
$player_id  = preg_replace('/[^0-9]/', '', $_POST['player_id'] ?? '');
$email      = filter_var(trim($_POST['email'] ?? ''), FILTER_SANITIZE_EMAIL);
$nickname   = htmlspecialchars(trim($_POST['nickname'] ?? ''), ENT_QUOTES, 'UTF-8');
$uc_package = htmlspecialchars(trim($_POST['uc_package'] ?? ''), ENT_QUOTES, 'UTF-8');
$payment    = htmlspecialchars(trim($_POST['payment_method'] ?? ''), ENT_QUOTES, 'UTF-8');
$agree_tos  = isset($_POST['agree_tos']) ? true : false;

// Validate Player ID
if (empty($player_id) || strlen($player_id) < 5 || strlen($player_id) > 15) {
    $errors[] = 'Please provide a valid PUBG Player ID (5–15 digits).';
}

// Validate Email
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $errors[] = 'Please provide a valid email address.';
}

// Validate Package
$package = get_package($uc_package);
if (!$package) {
    $errors[] = 'Invalid UC package selected.';
}

// Validate Payment
$valid_payments = ['visa', 'paypal', 'crypto', 'gcash', 'bkash'];
if (!in_array($payment, $valid_payments, true)) {
    $errors[] = 'Please select a valid payment method.';
}

// Validate ToS
if (!$agree_tos) {
    $errors[] = 'You must agree to the Terms & Conditions.';
}

// ── Handle Errors ──
if (!empty($errors)) {
    // In a real app, redirect back with session flash messages
    // For demo, display simple error page
    http_response_code(400);
    ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Error — UCTopUp Global</title>
      <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
      <div style="max-width:600px;margin:4rem auto;padding:2rem;">
        <div class="alert alert-error">
          <div>
            <strong>Please fix the following errors:</strong>
            <ul style="margin:.5rem 0 0 1rem;list-style:disc;">
              <?php foreach ($errors as $err): ?>
                <li style="margin:.3rem 0;"><?= htmlspecialchars($err) ?></li>
              <?php endforeach; ?>
            </ul>
          </div>
        </div>
        <a href="javascript:history.back()" class="btn btn-secondary">← Go Back</a>
      </div>
    </body>
    </html>
    <?php
    exit;
}

// ── Mock Purchase Processing ──
// In production: charge via Stripe/PayPal API, verify, then deliver UC via game API

// Generate mock order ID
$order_id = 'ORD-' . strtoupper(bin2hex(random_bytes(6))) . '-PUBG';

// Simulate processing time (in production, this would be async)
// Log order for demo (in production use a database)
$log_entry = [
    'timestamp'  => date('Y-m-d H:i:s'),
    'order_id'   => $order_id,
    'player_id'  => $player_id,
    'email'      => $email,        // would be hashed/encrypted in production
    'nickname'   => $nickname,
    'uc_package' => $uc_package,
    'uc_amount'  => $package['uc'],
    'price'      => $package['price'],
    'payment'    => $payment,
    'status'     => 'MOCK_SUCCESS',
];

// In production: INSERT INTO orders ... or queue for processing
// For demo: write to a log file (not for sensitive data in real apps)
$log_dir = __DIR__ . '/logs';
if (!is_dir($log_dir)) {
    @mkdir($log_dir, 0750, true);
    // Deny direct web access to logs
    file_put_contents($log_dir . '/.htaccess', "Deny from all\n");
}
@file_put_contents(
    $log_dir . '/orders.log',
    json_encode($log_entry) . "\n",
    FILE_APPEND | LOCK_EX
);

// ── Success Page ──
$page_title = 'Order Confirmed';
$uc_amount  = number_format($package['uc']);
$price_paid = number_format($package['price'], 2);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Order Confirmed — UCTopUp Global</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@400;600;700&family=Exo+2:wght@300;400;500;600&family=Barlow+Condensed:wght@600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
  <!-- Navbar (minimal) -->
  <nav class="navbar">
    <div class="container navbar-inner">
      <a href="index.php" class="navbar-logo">
        <div class="logo-icon">🎮</div>
        UC<span>TopUp</span>
      </a>
    </div>
  </nav>

  <div class="container" style="max-width:600px;margin:4rem auto;padding-bottom:4rem;position:relative;z-index:1;">

    <!-- Success Card -->
    <div style="background:var(--bg-card);border:1px solid rgba(46,204,113,.35);border-radius:var(--radius-lg);padding:2.5rem;text-align:center;">

      <div style="font-size:4rem;margin-bottom:1rem;">🎉</div>

      <h1 style="font-size:1.8rem;margin-bottom:.5rem;">Order Confirmed!</h1>
      <p style="color:var(--text-secondary);margin-bottom:1.5rem;">
        Your UC top-up has been submitted successfully and will be delivered to your account within <strong style="color:var(--text-primary);">1–5 minutes</strong>.
      </p>

      <!-- Order Details -->
      <div style="background:var(--bg-surface);border:1px solid var(--border-light);border-radius:var(--radius);padding:1.25rem;text-align:left;margin-bottom:1.5rem;">
        <div style="font-family:var(--font-condensed);font-size:.75rem;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:var(--text-muted);margin-bottom:1rem;">Order Details</div>
        <?php
        $details = [
          'Order ID'   => $order_id,
          'UC Amount'  => $uc_amount . ' UC',
          'Player ID'  => $player_id,
          'Email'      => $email,
          'Amount Paid'=> '$' . $price_paid . ' (Simulated)',
          'Status'     => '✅ Delivered (Mock)',
        ];
        foreach ($details as $label => $value): ?>
        <div style="display:flex;justify-content:space-between;align-items:center;padding:.45rem 0;border-bottom:1px solid var(--border-light);font-size:.87rem;">
          <span style="color:var(--text-muted);"><?= $label ?></span>
          <span style="color:var(--text-primary);font-weight:600;font-family:var(--font-condensed);"><?= htmlspecialchars($value) ?></span>
        </div>
        <?php endforeach; ?>
      </div>

      <div class="alert alert-info" style="text-align:left;margin-bottom:1.5rem;">
        <span>📧</span>
        <span>A confirmation email has been sent to <strong><?= htmlspecialchars($email) ?></strong>. Check your spam folder if you don't see it.</span>
      </div>

      <div style="display:flex;gap:.75rem;justify-content:center;flex-wrap:wrap;">
        <a href="index.php" class="btn btn-primary">← Back to Home</a>
        <a href="purchase.php" class="btn btn-secondary">Buy More UC</a>
      </div>

      <p style="font-size:.75rem;color:var(--text-muted);margin-top:1.5rem;">
        ⚠️ This is a <strong>demonstration site</strong>. No real money was charged and no real UC was delivered.
      </p>
    </div>

  </div>
</body>
</html>
