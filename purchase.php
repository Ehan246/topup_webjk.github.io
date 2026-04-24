<?php
/**
 * purchase.php — UC Purchase / Checkout Page
 * Handles package selection, player ID input, payment method selection,
 * and mock purchase flow with JS-driven confirmation modal.
 */

require_once 'includes/packages.php';

$page_title = 'Buy PUBG Mobile UC — Checkout';

// Pre-select a package if passed via URL
$selected_pkg_id = isset($_GET['pkg']) ? htmlspecialchars($_GET['pkg']) : 'uc_1800';
$selected_pkg = get_package($selected_pkg_id) ?? UC_PACKAGES[3];

require_once 'includes/header.php';
?>

<!-- Page Header -->
<div style="background:var(--bg-surface);border-bottom:1px solid var(--border-light);padding:1.25rem 0;position:relative;z-index:1;">
  <div class="container">
    <nav aria-label="Breadcrumb">
      <small style="color:var(--text-muted);font-family:var(--font-condensed);font-size:.8rem;letter-spacing:.06em;">
        <a href="index.php" style="color:var(--text-muted);text-decoration:none;">HOME</a>
        <span style="margin:0 .4rem;">›</span>
        <span style="color:var(--accent-gold);">BUY UC</span>
      </small>
    </nav>
    <h1 style="font-size:1.5rem;margin-top:.35rem;">
      PUBG Mobile <span style="color:var(--accent-gold);">UC Purchase</span>
    </h1>
  </div>
</div>

<div class="container" style="position:relative;z-index:1;">
  <div class="purchase-layout">

    <!-- ════════════════════════════════
         LEFT — Purchase Form
    ════════════════════════════════ -->
    <div>

      <!-- Warning Alert -->
      <div class="alert alert-warning" style="margin-top:1.5rem;">
        <span>⚠️</span>
        <span>Does <strong>not</strong> support PUBG Korea / Japan / Taiwan / Vietnam servers. Only 5-digit UIDs supported.</span>
      </div>

      <form id="purchaseForm" method="POST" action="process.php" novalidate>
        <!-- CSRF token (mock) -->
        <input type="hidden" name="csrf_token" value="<?= bin2hex(random_bytes(16)) ?>">
        <input type="hidden" name="uc_amount" id="hiddenUcAmount" value="<?= $selected_pkg['uc'] ?>">
        <input type="hidden" name="uc_price" id="hiddenUcPrice" value="<?= $selected_pkg['price'] ?>">

        <!-- ── STEP 1: Select UC Amount ── -->
        <div class="purchase-form-wrap" style="margin-top:1.5rem;">
          <div class="form-section-title">
            <span style="color:var(--accent-gold);margin-right:.4rem;">01</span> Select UC Amount
          </div>

          <!-- UC Package Options -->
          <div class="uc-selector" id="ucError" style="display:none;" role="alert">
            <div class="alert alert-error" style="margin-bottom:.75rem;">Please select a UC package.</div>
          </div>

          <div class="uc-options" role="radiogroup" aria-label="UC Package options">
            <?php foreach (UC_PACKAGES as $pkg):
              $pct = discount_pct($pkg['original'], $pkg['price']);
              $is_sel = ($pkg['id'] === $selected_pkg['id']);
            ?>
            <div
              class="uc-option <?= $is_sel ? 'selected' : '' ?>"
              role="radio"
              aria-checked="<?= $is_sel ? 'true' : 'false' ?>"
              tabindex="0"
              data-uc="<?= $pkg['uc'] ?>"
              data-price="<?= $pkg['price'] ?>"
              data-original="<?= $pkg['original'] ?>"
              data-bonus="<?= $pkg['bonus'] ?>"
              aria-label="<?= number_format($pkg['uc']) ?> UC for $<?= number_format($pkg['price'],2) ?>"
            >
              <input type="radio" name="uc_package" value="<?= $pkg['id'] ?>" <?= $is_sel ? 'checked' : '' ?> style="position:absolute;opacity:0;">
              <?php if ($pkg['hot']): ?>
                <div style="font-size:.62rem;font-weight:700;color:var(--accent-red);font-family:var(--font-condensed);letter-spacing:.06em;text-transform:uppercase;margin-bottom:.15rem;">🔥 HOT</div>
              <?php elseif ($pkg['popular']): ?>
                <div style="font-size:.62rem;font-weight:700;color:var(--accent-gold);font-family:var(--font-condensed);letter-spacing:.06em;text-transform:uppercase;margin-bottom:.15rem;">⭐ TOP</div>
              <?php else: ?>
                <div style="height:.9rem;"></div>
              <?php endif; ?>
              <div class="uc-option-amount"><?= number_format($pkg['uc']) ?> UC</div>
              <?php if ($pkg['bonus'] > 0): ?>
                <div class="uc-option-bonus">+<?= $pkg['bonus'] ?> Bonus</div>
              <?php else: ?>
                <div style="height:.85rem;"></div>
              <?php endif; ?>
              <div class="uc-option-price">$<?= number_format($pkg['price'],2) ?></div>
              <?php if ($pkg['original'] > $pkg['price']): ?>
                <div class="uc-option-original">$<?= number_format($pkg['original'],2) ?></div>
              <?php endif; ?>
            </div>
            <?php endforeach; ?>
          </div>

          <div class="divider"></div>

          <!-- ── STEP 2: Player Information ── -->
          <div class="form-section-title" style="margin-top:1.5rem;">
            <span style="color:var(--accent-gold);margin-right:.4rem;">02</span> Player Information
          </div>

          <div class="alert alert-info" style="margin-bottom:1.25rem;">
            <span>ℹ️</span>
            <span>To find your Player ID: Open PUBG Mobile → Settings → Profile. Your UID is in the top-right corner.</span>
          </div>

          <div class="form-group">
            <label class="form-label" for="player_id">PUBG Mobile Player ID (UID) <span style="color:var(--accent-red);">*</span></label>
            <input
              type="text"
              id="player_id"
              name="player_id"
              class="form-control"
              placeholder="Enter your 5-digit Player ID"
              inputmode="numeric"
              pattern="\d{5,15}"
              maxlength="15"
              autocomplete="off"
              required
              aria-required="true"
              aria-describedby="playerIdError"
            >
            <small class="form-hint">Example: 51234567 — Must be a 5–15 digit numeric ID</small>
            <span class="form-error" id="playerIdError" role="alert">Please enter a valid numeric Player ID (5–15 digits).</span>
          </div>

          <div class="form-row">
            <div class="form-group">
              <label class="form-label" for="email">Email Address <span style="color:var(--accent-red);">*</span></label>
              <input
                type="email"
                id="email"
                name="email"
                class="form-control"
                placeholder="your@email.com"
                required
                aria-required="true"
                aria-describedby="emailError"
              >
              <small class="form-hint">Order confirmation will be sent here</small>
              <span class="form-error" id="emailError" role="alert">Please enter a valid email address.</span>
            </div>
            <div class="form-group">
              <label class="form-label" for="nickname">In-Game Nickname (optional)</label>
              <input type="text" id="nickname" name="nickname" class="form-control" placeholder="Your PUBG nickname" maxlength="40">
              <small class="form-hint">Helps us verify your account</small>
            </div>
          </div>

          <div class="divider"></div>

          <!-- ── STEP 3: Payment Method ── -->
          <div class="form-section-title" style="margin-top:1.5rem;">
            <span style="color:var(--accent-gold);margin-right:.4rem;">03</span> Payment Method
          </div>

          <div id="paymentError" style="display:none;" role="alert">
            <div class="alert alert-error" style="margin-bottom:.75rem;">Please select a payment method.</div>
          </div>

          <div class="payment-methods" role="radiogroup" aria-label="Payment method">
            <?php
            $payments = [
              ['id'=>'visa',       'icon'=>'💳','name'=>'Visa / MC'],
              ['id'=>'paypal',     'icon'=>'🅿️','name'=>'PayPal'],
              ['id'=>'crypto',     'icon'=>'₿', 'name'=>'Crypto'],
              ['id'=>'gcash',      'icon'=>'📱','name'=>'GCash'],
              ['id'=>'bkash',      'icon'=>'📲','name'=>'bKash'],
            ];
            foreach ($payments as $pm): ?>
            <label class="payment-option" aria-label="Pay with <?= $pm['name'] ?>">
              <input type="radio" name="payment_method" value="<?= $pm['id'] ?>">
              <div class="payment-icon" aria-hidden="true"><?= $pm['icon'] ?></div>
              <div class="payment-name"><?= $pm['name'] ?></div>
            </label>
            <?php endforeach; ?>
          </div>

          <div class="divider"></div>

          <!-- ── Terms checkbox ── -->
          <div style="margin-bottom:1.25rem;">
            <label style="display:flex;align-items:flex-start;gap:.6rem;cursor:pointer;">
              <input type="checkbox" id="agreeToS" name="agree_tos" value="1" style="margin-top:.2rem;accent-color:var(--accent-gold);" aria-required="true">
              <span style="font-size:.85rem;color:var(--text-secondary);">
                I agree to the <a href="terms.php" target="_blank" style="color:var(--accent-gold);">Terms &amp; Conditions</a>
                and <a href="privacy.php" target="_blank" style="color:var(--accent-gold);">Privacy Policy</a>.
                I confirm that I am 18+ or have parental consent.
              </span>
            </label>
            <span class="form-error" id="tosError" role="alert" style="display:none;">You must agree to the Terms &amp; Conditions to continue.</span>
          </div>

          <!-- ── Submit ── -->
          <button type="submit" id="submitBtn" class="btn btn-primary btn-lg btn-full" aria-label="Complete purchase">
            🔒 Complete Purchase
          </button>

          <p style="font-size:.75rem;color:var(--text-muted);text-align:center;margin-top:.75rem;">
            This is a mock transaction. No real payment will be processed.
          </p>
        </div>

      </form>
    </div>

    <!-- ════════════════════════════════
         RIGHT — Order Summary
    ════════════════════════════════ -->
    <div class="purchase-sidebar">

      <!-- Sticky Order Card -->
      <div class="order-summary" style="margin-top:1.5rem;">
        <h3>Order Summary</h3>

        <div class="order-item">
          <div class="order-item-icon" aria-hidden="true">💎</div>
          <div class="order-item-info">
            <div class="name" id="orderItemName"><?= number_format($selected_pkg['uc']) ?> UC</div>
            <div class="qty" id="orderItemQty">PUBG Mobile Global</div>
          </div>
          <div class="order-item-price" id="orderItemPriceDisplay">$<?= number_format($selected_pkg['price'],2) ?></div>
        </div>

        <div class="order-totals">
          <div class="order-row">
            <span>Package</span>
            <span id="summaryUC"><?= number_format($selected_pkg['uc']) ?> UC</span>
          </div>
          <div class="order-row">
            <span>Original Price</span>
            <span id="summaryPrice">$<?= number_format($selected_pkg['original'],2) ?></span>
          </div>
          <div class="order-row" style="color:var(--accent-green);">
            <span>💰 Discount</span>
            <span id="summaryDiscount">-$<?= number_format($selected_pkg['original'] - $selected_pkg['price'],2) ?></span>
          </div>
          <div class="order-row total">
            <span>Total</span>
            <span class="amount" id="summaryTotal">$<?= number_format($selected_pkg['price'],2) ?></span>
          </div>
        </div>

        <a href="purchase.php" class="btn btn-primary btn-full" style="margin-top:1rem;" onclick="document.getElementById('submitBtn')?.click();return false;">
          🛒 Buy Now
        </a>
      </div>

      <!-- Security Info -->
      <div style="background:var(--bg-card);border:1px solid var(--border-light);border-radius:var(--radius-lg);padding:1.25rem;margin-top:1rem;">
        <div style="font-family:var(--font-condensed);font-size:.75rem;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:var(--text-muted);margin-bottom:.9rem;">Security &amp; Guarantee</div>
        <?php
        $assurances = [
          ['🔒','SSL Encrypted checkout'],
          ['⚡','Instant UC delivery'],
          ['🔄','Delivery issue? We fix it'],
          ['🆔','No password required'],
          ['🌍','PUBG Global server only'],
        ];
        foreach ($assurances as [$icon, $text]): ?>
        <div style="display:flex;align-items:center;gap:.5rem;padding:.3rem 0;font-size:.83rem;color:var(--text-secondary);">
          <span style="color:var(--accent-gold);"><?= $icon ?></span> <?= $text ?>
        </div>
        <?php endforeach; ?>
      </div>

      <!-- Server Selection Note -->
      <div class="alert alert-warning" style="margin-top:1rem;font-size:.8rem;">
        <span>⚠️</span>
        <span>Make sure your PUBG account is on the <strong>Global</strong> server before purchasing.</span>
      </div>

    </div>

  </div>
</div>

<!-- ════════════════════════════════
     SUCCESS MODAL
════════════════════════════════ -->
<div class="modal-overlay" id="successModal" role="dialog" aria-modal="true" aria-labelledby="modalTitle" aria-describedby="modalDesc">
  <div class="modal">
    <span class="modal-icon" aria-hidden="true">🎉</span>
    <h2 id="modalTitle">Purchase Successful!</h2>
    <p id="modalDesc">
      Your UC has been submitted for processing. It will be credited to your PUBG Mobile account within <strong>1–5 minutes</strong>.
      A confirmation email has been sent to your provided address.
    </p>
    <div class="modal-order-id" aria-label="Order ID">
      Order ID: <span id="modalOrderId">—</span>
    </div>
    <div style="display:flex;gap:.75rem;justify-content:center;flex-wrap:wrap;">
      <button class="btn btn-primary" id="closeModal">Done</button>
      <a href="index.php" class="btn btn-secondary">Back to Home</a>
    </div>
  </div>
</div>

<!-- Keyboard nav for UC options -->
<script>
document.querySelectorAll('.uc-option').forEach(opt => {
  opt.addEventListener('keydown', e => {
    if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); opt.click(); }
  });
  opt.addEventListener('click', () => {
    document.querySelectorAll('.uc-option').forEach(o => { o.classList.remove('selected'); o.setAttribute('aria-checked','false'); });
    opt.classList.add('selected');
    opt.setAttribute('aria-checked','true');
  });
});
document.querySelectorAll('.payment-option').forEach(opt => {
  opt.addEventListener('click', () => {
    document.querySelectorAll('.payment-option').forEach(o => o.classList.remove('selected'));
    opt.classList.add('selected');
  });
});
</script>

<?php require_once 'includes/footer.php'; ?>
