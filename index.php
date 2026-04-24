<?php
/**
 * index.php — Homepage
 * Showcases PUBG Mobile UC packages with hero section, package grid, how-it-works
 */

require_once 'includes/packages.php';

$page_title = 'Buy PUBG Mobile UC — Best Price, Instant Delivery';
require_once 'includes/header.php';

$default_pkg = UC_PACKAGES[3]; // 1800 UC as featured default
?>

<!-- ═══════════════════════════════════════════════
     HERO SECTION
═══════════════════════════════════════════════ -->
<section class="hero" aria-label="Hero">
  <div class="hero-bg" aria-hidden="true"></div>

  <!-- Decorative background art -->
  <div class="hero-img-wrap" aria-hidden="true">
    <div style="font-size:18rem;line-height:1;text-align:center;opacity:.6;">🎮</div>
  </div>

  <div class="container hero-content">
    <div class="hero-badge">
      <span>⚡</span> Instant Delivery Guaranteed
    </div>

    <h1>
      PUBG Mobile<br>
      <span class="gold">UC Top-Up</span><br>
      Global
    </h1>

    <p class="hero-desc">
      Purchase Unknown Cash (UC) instantly at the best prices.
      Credited directly to your account within minutes. Safe, secure, and trusted by players worldwide.
    </p>

    <div class="hero-stats">
      <div class="hero-stat">
        <div class="val">827K+</div>
        <div class="lbl">Orders Fulfilled</div>
      </div>
      <div class="hero-stat">
        <div class="val">Up to 23%</div>
        <div class="lbl">Off Retail Price</div>
      </div>
      <div class="hero-stat">
        <div class="val">5★</div>
        <div class="lbl">Avg. Rating</div>
      </div>
    </div>

    <div class="hero-cta">
      <a href="purchase.php" class="btn btn-primary btn-lg">
        🛒 Buy UC Now
      </a>
      <a href="#how-it-works" class="btn btn-secondary btn-lg">
        How It Works
      </a>
    </div>
  </div>
</section>

<!-- ═══════════════════════════════════════════════
     NOTICE BANNER
═══════════════════════════════════════════════ -->
<div class="container" style="padding-top:1.5rem;position:relative;z-index:1;">
  <div class="alert alert-warning">
    <span>⚠️</span>
    <span>
      <strong>Important:</strong> This service does not support PUBG Korea / Japan / Taiwan / Vietnam servers.
      Only supports 5-digit UIDs. Accounts with UIDs beginning with '6' cannot be recharged.
    </span>
  </div>
</div>

<!-- ═══════════════════════════════════════════════
     UC PACKAGES GRID
═══════════════════════════════════════════════ -->
<section class="uc-packages-section" aria-labelledby="packagesHeading">
  <div class="container">

    <div class="packages-header reveal">
      <div>
        <h2 class="section-title" id="packagesHeading">
          Choose Your <span>UC Package</span>
        </h2>
        <p class="section-subtitle">Select the right amount of Unknown Cash for your needs</p>
      </div>
      <div class="packages-filters">
        <button class="filter-btn active" data-filter="all">All</button>
        <button class="filter-btn" data-filter="starter">Starter</button>
        <button class="filter-btn" data-filter="popular">Popular</button>
        <button class="filter-btn" data-filter="value">Value</button>
        <button class="filter-btn" data-filter="premium">Premium</button>
      </div>
    </div>

    <!-- Package Grid -->
    <div class="packages-grid">
      <?php foreach (UC_PACKAGES as $pkg):
        $pct = discount_pct($pkg['original'], $pkg['price']);
        $is_default = ($pkg['id'] === $default_pkg['id']);
      ?>
      <a
        href="purchase.php?pkg=<?= urlencode($pkg['id']) ?>"
        class="package-card reveal <?= $is_default ? 'selected' : '' ?>"
        data-selectable
        data-category="<?= htmlspecialchars($pkg['category']) ?>"
        aria-label="Buy <?= $pkg['uc'] ?> UC for $<?= number_format($pkg['price'],2) ?>"
      >
        <!-- Badge -->
        <?php if ($pkg['hot']): ?>
          <span class="card-badge badge-hot">🔥 Hot</span>
        <?php elseif ($pkg['popular']): ?>
          <span class="card-badge badge-sale">⭐ Popular</span>
        <?php elseif ($pct >= 20): ?>
          <span class="card-badge badge-sale">-<?= $pct ?>% OFF</span>
        <?php endif; ?>

        <!-- Image / Icon -->
        <div class="card-img-wrap">
          <div class="uc-icon-placeholder" aria-hidden="true">
            <?= $pkg['icon'] ?>
          </div>
        </div>

        <!-- Body -->
        <div class="card-body">
          <div class="card-uc-amount"><?= number_format($pkg['uc']) ?> UC</div>
          <?php if ($pkg['bonus'] > 0): ?>
            <div class="card-uc-bonus">+<?= $pkg['bonus'] ?> Bonus UC</div>
          <?php else: ?>
            <div style="height:1.1rem;"></div>
          <?php endif; ?>
          <div class="card-pricing">
            <span class="card-price">$<?= number_format($pkg['price'],2) ?></span>
            <?php if ($pkg['original'] > $pkg['price']): ?>
              <span class="card-original">$<?= number_format($pkg['original'],2) ?></span>
              <span class="card-discount-pct">-<?= $pct ?>%</span>
            <?php endif; ?>
          </div>
        </div>
      </a>
      <?php endforeach; ?>
    </div>

  </div>
</section>

<!-- ═══════════════════════════════════════════════
     HOW IT WORKS
═══════════════════════════════════════════════ -->
<section class="section" id="how-it-works" aria-labelledby="howHeading">
  <div class="container">
    <div class="text-center reveal" style="margin-bottom:2.5rem;">
      <h2 class="section-title" id="howHeading">How To <span>Top Up</span></h2>
      <p class="section-subtitle">Complete your UC purchase in just 4 simple steps</p>
    </div>

    <div class="steps-row">
      <?php
      $steps = [
        ['num'=>'1','icon'=>'🎯','title'=>'Select UC Amount','desc'=>'Browse our packages and select the UC amount that suits your needs and budget.'],
        ['num'=>'2','icon'=>'🆔','title'=>'Enter Player ID','desc'=>'Input your 5-digit PUBG Mobile Player ID. Find it in Settings → Profile in-game.'],
        ['num'=>'3','icon'=>'💳','title'=>'Choose Payment','desc'=>'Pick from multiple secure payment methods and complete your checkout safely.'],
        ['num'=>'4','icon'=>'⚡','title'=>'Receive UC','desc'=>'UC is credited directly to your account within minutes of confirmed payment.'],
      ];
      foreach ($steps as $step): ?>
      <div class="step-item reveal">
        <div class="step-num"><?= $step['num'] ?></div>
        <h4><?= $step['title'] ?></h4>
        <p><?= $step['desc'] ?></p>
      </div>
      <?php endforeach; ?>
    </div>

    <div class="text-center" style="margin-top:2.5rem;">
      <a href="purchase.php" class="btn btn-primary btn-lg">
        Start Buying UC →
      </a>
    </div>
  </div>
</section>

<!-- ═══════════════════════════════════════════════
     WHY CHOOSE US
═══════════════════════════════════════════════ -->
<section class="section" style="padding-top:0;" aria-labelledby="whyHeading">
  <div class="container">
    <div class="text-center reveal" style="margin-bottom:2rem;">
      <h2 class="section-title" id="whyHeading">Why <span>Choose Us</span></h2>
    </div>

    <div class="info-grid">
      <?php
      $features = [
        ['icon'=>'⚡','title'=>'Instant Delivery','desc'=>'UC is credited directly to your PUBG Mobile account immediately after payment confirmation — no delays.'],
        ['icon'=>'🔒','title'=>'Secure & Safe','desc'=>'All transactions are SSL-encrypted. We never ask for your game password. Your account stays safe.'],
        ['icon'=>'💰','title'=>'Best Prices','desc'=>'We offer competitive rates with up to 23% savings compared to in-game store prices. Real value for your money.'],
        ['icon'=>'🌍','title'=>'Global Coverage','desc'=>'Supporting global PUBG Mobile servers worldwide. Available in USD, with multi-currency support coming soon.'],
        ['icon'=>'🎧','title'=>'24/7 Support','desc'=>'Our customer service team is available around the clock to help with any questions or issues.'],
        ['icon'=>'✅','title'=>'Verified Service','desc'=>'Trusted by over 827,000 players. Consistent delivery record with 99.7% success rate on all orders.'],
      ];
      foreach ($features as $f): ?>
      <div class="info-card reveal">
        <div class="info-card-icon" aria-hidden="true"><?= $f['icon'] ?></div>
        <h3><?= $f['title'] ?></h3>
        <p><?= $f['desc'] ?></p>
      </div>
      <?php endforeach; ?>
    </div>
  </div>
</section>

<!-- ═══════════════════════════════════════════════
     FAQ
═══════════════════════════════════════════════ -->
<section class="section" id="faq" style="padding-top:0;" aria-labelledby="faqHeading">
  <div class="container">
    <div class="text-center reveal" style="margin-bottom:2rem;">
      <h2 class="section-title" id="faqHeading">Frequently Asked <span>Questions</span></h2>
    </div>

    <div style="max-width:720px;margin:0 auto;" class="reveal">
      <style>
        .faq-item { border:1px solid var(--border-light); border-radius:var(--radius); margin-bottom:.6rem; background:var(--bg-card); overflow:hidden; }
        .faq-question { width:100%; text-align:left; padding:1rem 1.25rem; background:none; border:none; cursor:pointer; color:var(--text-primary); font-family:var(--font-body); font-size:.93rem; font-weight:500; display:flex; justify-content:space-between; align-items:center; transition:color var(--transition); }
        .faq-question:hover { color:var(--accent-gold); }
        .faq-question .arrow { transition:transform var(--transition); font-size:1rem; color:var(--text-muted); }
        .faq-item.open .faq-question .arrow { transform:rotate(180deg); }
        .faq-answer { max-height:0; overflow:hidden; transition:max-height .3s ease; }
        .faq-item.open .faq-answer { max-height:200px; }
        .faq-answer p { padding:.25rem 1.25rem 1rem; font-size:.87rem; color:var(--text-secondary); line-height:1.7; }
      </style>

      <?php
      $faqs = [
        ['q'=>'How long does it take to receive UC?','a'=>'UC is delivered instantly to your account within 1–5 minutes after payment confirmation. In rare cases it may take up to 15 minutes during peak hours.'],
        ['q'=>'Do I need to share my game account password?','a'=>'Absolutely not. We only require your PUBG Mobile Player ID (UID). Never share your password with anyone.'],
        ['q'=>'Which servers are supported?','a'=>'We support the PUBG Mobile Global server. We do NOT support Korea, Japan, Taiwan, or Vietnam regional servers.'],
        ['q'=>'What if I entered the wrong Player ID?','a'=>'Double-check your Player ID before purchase. If you entered an incorrect ID, contact our support immediately. We will attempt to recover, but cannot guarantee a refund once UC is delivered.'],
        ['q'=>'What payment methods do you accept?','a'=>'We accept major credit/debit cards (Visa, Mastercard), PayPal, cryptocurrency, and popular regional payment methods.'],
        ['q'=>'Is there a purchase limit?','a'=>'There is no strict daily limit. However, very large orders may require additional verification for security purposes.'],
      ];
      foreach ($faqs as $faq): ?>
      <div class="faq-item">
        <button class="faq-question" aria-expanded="false">
          <?= htmlspecialchars($faq['q']) ?>
          <span class="arrow" aria-hidden="true">▾</span>
        </button>
        <div class="faq-answer" role="region">
          <p><?= htmlspecialchars($faq['a']) ?></p>
        </div>
      </div>
      <?php endforeach; ?>
    </div>
  </div>
</section>

<!-- Reveal animation CSS -->
<style>
  .reveal { opacity:0; transform:translateY(18px); transition:opacity .5s ease, transform .5s ease; }
  .reveal.revealed { opacity:1; transform:translateY(0); }
</style>

<?php require_once 'includes/footer.php'; ?>
