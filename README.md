# UCTopUp Global — PUBG Mobile UC Top-Up Website

A fully functional, responsive PHP website for PUBG Mobile UC top-up simulation.

## Project Structure

```
pubg-topup/
├── index.php           # Homepage — hero, package grid, how-it-works, FAQ
├── purchase.php        # Purchase/checkout page
├── process.php         # Form processor (mock)
├── terms.php           # Terms & Conditions
├── privacy.php         # Privacy Policy
├── .htaccess           # Apache security config
├── assets/
│   ├── css/
│   │   └── style.css   # Main stylesheet (dark military theme)
│   └── js/
│       └── main.js     # Interactivity, validation, mock purchase flow
└── includes/
    ├── header.php      # Shared nav/head
    ├── footer.php      # Shared footer
    └── packages.php    # UC package data + helpers
```

## Setup

### Requirements
- PHP 7.4+ (or PHP 8.x recommended)
- Apache with mod_rewrite enabled, OR Nginx with PHP-FPM

### Quick Start (Local)

```bash
# Using PHP's built-in server
cd pubg-topup
php -S localhost:8080

# Then open: http://localhost:8080
```

### With XAMPP / WAMP / MAMP
Copy the `pubg-topup/` folder to your `htdocs` (XAMPP) or `www` (WAMP) directory,
then visit `http://localhost/pubg-topup/`.

## Pages

| Page | URL | Description |
|------|-----|-------------|
| Home | `/index.php` | Hero, UC packages, how-it-works, features, FAQ |
| Buy UC | `/purchase.php` | UC selector, player ID form, payment, order summary |
| Confirm | `/process.php` | Handles form POST, shows success page |
| Terms | `/terms.php` | Full Terms & Conditions |
| Privacy | `/privacy.php` | Full Privacy Policy |

## Features
- ✅ Responsive design (mobile-first)
- ✅ Dark tactical theme with gold accents
- ✅ UC package selection with real-time order summary
- ✅ Form validation (client-side JS + server-side PHP)
- ✅ Mock purchase flow with success modal
- ✅ Filter packages by category
- ✅ Scroll-reveal animations
- ✅ FAQ accordion
- ✅ Announcement ticker
- ✅ Security headers via .htaccess
- ✅ Accessible (ARIA labels, semantic HTML)

## Customization

### Adding UC Packages
Edit `includes/packages.php` — add entries to the `UC_PACKAGES` array.

### Changing Prices / Discounts
Edit the `price` and `original` fields in `includes/packages.php`.

### Styling
All CSS variables are in `assets/css/style.css` under `:root`. Change `--accent-gold` etc.

## Security Notes
- CSRF token generated per-form (mock implementation)
- All user inputs sanitized with `htmlspecialchars()` and `filter_var()`
- Player IDs validated with regex
- Emails validated with `FILTER_VALIDATE_EMAIL`
- `.htaccess` blocks access to `includes/` and `logs/`
- Security headers set (X-Frame-Options, CSP, etc.)
- **In production:** Use HTTPS, proper sessions, a real database, and a real payment gateway

## Demo Notice
This is a DEMONSTRATION website. No real payments are processed and no real UC is delivered.
