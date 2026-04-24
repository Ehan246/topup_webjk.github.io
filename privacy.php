<?php
/**
 * privacy.php — Privacy Policy
 */

$page_title = 'Privacy Policy';
require_once 'includes/header.php';
?>

<div class="container" style="position:relative;z-index:1;">
  <div class="legal-content">

    <h1>Privacy Policy</h1>
    <p class="legal-updated">Last updated: <?= date('F j, Y') ?> | Effective: <?= date('F j, Y') ?></p>

    <div class="alert alert-info">
      <span>🔒</span>
      <span>
        UCTopUp Global is committed to protecting your privacy. This policy explains what data we collect,
        how we use it, and your rights. We comply with applicable data protection regulations.
      </span>
    </div>

    <h2>1. Who We Are</h2>
    <p>
      UCTopUp Global ("we," "us," "our") operates this website as a demonstration PUBG Mobile UC top-up service platform.
      For questions about this policy, contact us at: <a href="mailto:privacy@uctopup.example.com">privacy@uctopup.example.com</a>.
    </p>

    <h2>2. Information We Collect</h2>
    <p>We collect information in the following categories:</p>

    <p><strong>2.1 Information You Provide Directly</strong></p>
    <ul>
      <li><strong>PUBG Mobile Player ID (UID):</strong> Required to deliver UC to your account. Not linked to other personal data stored elsewhere.</li>
      <li><strong>Email Address:</strong> Used to send order confirmations, support communications, and optional marketing (with consent).</li>
      <li><strong>In-Game Nickname:</strong> Optional field used to help verify account ownership during support requests.</li>
      <li><strong>Payment Information:</strong> We do <em>not</em> store full credit card details. Payment data is handled by our PCI-compliant third-party payment processors (e.g., Stripe, PayPal).</li>
    </ul>

    <p><strong>2.2 Information Collected Automatically</strong></p>
    <ul>
      <li><strong>Log Data:</strong> IP address, browser type, pages visited, time and date of visit, referring URL, and other standard web server logs.</li>
      <li><strong>Cookies and Similar Technologies:</strong> Session cookies for site functionality, analytics cookies (if enabled), and preference cookies. See Section 7 for details.</li>
      <li><strong>Device Information:</strong> Operating system, screen resolution, and device type for responsive design optimization.</li>
    </ul>

    <p><strong>2.3 Information from Third Parties</strong></p>
    <ul>
      <li>Payment processors may share transaction status and fraud risk signals with us.</li>
      <li>Analytics providers (e.g., Google Analytics) may provide aggregated usage statistics.</li>
    </ul>

    <h2>3. How We Use Your Information</h2>
    <p>We use the information we collect for the following purposes:</p>
    <ul>
      <li><strong>Order Fulfillment:</strong> To process your purchase and deliver UC to your PUBG Mobile account.</li>
      <li><strong>Communication:</strong> To send order confirmations, receipts, and transactional emails.</li>
      <li><strong>Customer Support:</strong> To respond to inquiries, resolve disputes, and handle refund requests.</li>
      <li><strong>Security &amp; Fraud Prevention:</strong> To detect, prevent, and investigate fraudulent transactions and unauthorized access.</li>
      <li><strong>Service Improvement:</strong> To analyze usage patterns, fix bugs, and improve the user experience.</li>
      <li><strong>Legal Compliance:</strong> To comply with applicable laws, regulations, court orders, and law enforcement requests.</li>
      <li><strong>Marketing:</strong> To send promotional offers — only with your explicit consent, and you can opt out at any time.</li>
    </ul>

    <h2>4. Legal Basis for Processing (GDPR)</h2>
    <p>For users in the European Economic Area (EEA), we process personal data under the following legal bases:</p>
    <ul>
      <li><strong>Contract Performance:</strong> Processing your order requires handling your Player ID and email.</li>
      <li><strong>Legitimate Interests:</strong> Fraud prevention, security monitoring, and service improvement.</li>
      <li><strong>Legal Obligation:</strong> Compliance with applicable laws and regulations.</li>
      <li><strong>Consent:</strong> For marketing communications and non-essential cookies.</li>
    </ul>

    <h2>5. Data Sharing and Disclosure</h2>
    <p>We do not sell your personal data. We may share your information in the following circumstances:</p>
    <ul>
      <li><strong>Payment Processors:</strong> Stripe, PayPal, or other processors to facilitate transactions. They are PCI-DSS compliant and subject to their own privacy policies.</li>
      <li><strong>Service Providers:</strong> Cloud hosting, email delivery, and analytics providers operating under data processing agreements.</li>
      <li><strong>Legal Requirements:</strong> When required by law, court order, or government authority.</li>
      <li><strong>Business Transfers:</strong> In the event of a merger, acquisition, or sale of assets, your data may be transferred. We will notify you before transfer.</li>
      <li><strong>Protection of Rights:</strong> To protect the rights, property, or safety of UCTopUp Global, our users, or the public.</li>
    </ul>
    <p>We require all third parties to maintain appropriate security measures and to process your data only as instructed.</p>

    <h2>6. Data Retention</h2>
    <p>
      We retain your personal data only as long as necessary for the purposes outlined in this policy:
    </p>
    <ul>
      <li><strong>Order Records:</strong> Retained for 7 years for accounting and legal compliance purposes.</li>
      <li><strong>Email Addresses:</strong> Retained until you unsubscribe or request deletion, plus 30 days for processing.</li>
      <li><strong>Log Files:</strong> Retained for 90 days for security and debugging purposes.</li>
      <li><strong>Player IDs:</strong> Retained with order records for 7 years; anonymized after the order lifecycle is complete.</li>
    </ul>

    <h2>7. Cookies</h2>
    <p>We use the following types of cookies:</p>
    <ul>
      <li><strong>Essential Cookies:</strong> Required for the website to function (session management, form security). Cannot be disabled.</li>
      <li><strong>Analytics Cookies:</strong> Help us understand how visitors interact with our site (e.g., Google Analytics). You can opt out via your browser settings or Google's opt-out tool.</li>
      <li><strong>Preference Cookies:</strong> Remember your language or currency preferences.</li>
    </ul>
    <p>
      Most web browsers allow you to control cookies through their settings. Disabling essential cookies may affect site functionality.
      For more information, visit <a href="https://www.allaboutcookies.org" target="_blank" rel="noopener noreferrer">allaboutcookies.org</a>.
    </p>

    <h2>8. Data Security</h2>
    <p>
      We implement industry-standard security measures to protect your personal data:
    </p>
    <ul>
      <li>SSL/TLS encryption for all data in transit (HTTPS).</li>
      <li>Encrypted storage for sensitive data at rest.</li>
      <li>Access controls and authentication for internal systems.</li>
      <li>Regular security audits and penetration testing.</li>
      <li>PCI-DSS compliance for payment data handling (via third-party processors).</li>
    </ul>
    <p>
      However, no method of internet transmission or electronic storage is 100% secure.
      While we strive to protect your data, we cannot guarantee absolute security.
      In the event of a data breach affecting your rights, we will notify you and relevant authorities as required by law.
    </p>

    <h2>9. Your Rights</h2>
    <p>Depending on your location, you may have the following rights regarding your personal data:</p>
    <ul>
      <li><strong>Right of Access:</strong> Request a copy of the personal data we hold about you.</li>
      <li><strong>Right to Rectification:</strong> Request correction of inaccurate or incomplete data.</li>
      <li><strong>Right to Erasure ("Right to be Forgotten"):</strong> Request deletion of your personal data, subject to legal retention requirements.</li>
      <li><strong>Right to Restriction:</strong> Request that we limit processing of your data in certain circumstances.</li>
      <li><strong>Right to Data Portability:</strong> Receive your data in a structured, machine-readable format.</li>
      <li><strong>Right to Object:</strong> Object to processing based on legitimate interests or for direct marketing.</li>
      <li><strong>Rights Related to Automated Decision-Making:</strong> Not to be subject to solely automated decisions that significantly affect you.</li>
    </ul>
    <p>
      To exercise any of these rights, contact us at <a href="mailto:privacy@uctopup.example.com">privacy@uctopup.example.com</a>.
      We will respond within 30 days. We may request proof of identity before fulfilling your request.
    </p>

    <h2>10. Children's Privacy</h2>
    <p>
      Our Service is not directed at children under the age of 13 (or 16 in the EEA). We do not knowingly collect
      personal data from children. If you believe we have inadvertently collected data from a child, please contact us
      immediately and we will promptly delete such information.
    </p>
    <p>
      Users between 13–18 (or applicable age of majority in their jurisdiction) should obtain parental consent before using our Service.
    </p>

    <h2>11. International Data Transfers</h2>
    <p>
      Your data may be transferred to and processed in countries other than your own, including countries that may
      not offer the same level of data protection as your jurisdiction.
      Where we transfer data internationally, we use appropriate safeguards such as Standard Contractual Clauses (SCCs)
      approved by relevant authorities to ensure your data is protected.
    </p>

    <h2>12. Third-Party Links</h2>
    <p>
      Our website may contain links to third-party websites (e.g., PUBG Mobile official site). We are not responsible
      for the privacy practices of those sites. We encourage you to read their privacy policies before providing personal information.
    </p>

    <h2>13. Changes to This Privacy Policy</h2>
    <p>
      We may update this Privacy Policy from time to time to reflect changes in our practices or applicable law.
      We will notify you of significant changes by updating the "Last updated" date at the top of this page
      and, where appropriate, by sending you an email notification. We recommend reviewing this policy periodically.
    </p>

    <h2>14. Contact Us</h2>
    <p>
      For any privacy-related questions, requests, or complaints, please contact our Data Protection team:
    </p>
    <ul>
      <li><strong>Email:</strong> <a href="mailto:privacy@uctopup.example.com">privacy@uctopup.example.com</a></li>
      <li><strong>General Support:</strong> <a href="mailto:support@uctopup.example.com">support@uctopup.example.com</a></li>
    </ul>
    <p>
      If you are in the EEA and are not satisfied with our response, you have the right to lodge a complaint with
      your local Data Protection Authority (DPA).
    </p>

    <div class="divider"></div>

    <div style="display:flex;gap:.75rem;flex-wrap:wrap;padding-top:.5rem;">
      <a href="purchase.php" class="btn btn-primary">Buy UC Now</a>
      <a href="terms.php" class="btn btn-secondary">Terms &amp; Conditions</a>
      <a href="index.php" class="btn btn-secondary">← Home</a>
    </div>

  </div>
</div>

<?php require_once 'includes/footer.php'; ?>
