<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'pass' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );
define( 'WP_HOME', 'http://192.168.99.95:5050' );
define( 'WP_SITEURL', 'http://192.168.99.95:5050' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '(&Tk=7(&*bbsj+ u$=P=hoecVa1me!~3PaxSH$c#^ S Al/9Q!n`$;ACy@_0`dUL' );
define( 'SECURE_AUTH_KEY',  '4S1l,9D!`hT.LKAlRBEv`fJ [a-PZ|/9Nx?rI`WzpsQ=|[ C*HT%fTh{/U*J|W p' );
define( 'LOGGED_IN_KEY',    'yU@8Ja.woMn1ipYnHROWCg3MixHBH_-/t}e6M>F2g)Hn=x+r0gp5Rgx05>R&]phB' );
define( 'NONCE_KEY',        '`HK+G`_qz?U.EPeE@ H^)6urV:zx7HR/~pZ:C>^YX>WJ!VFrICF>Y~()5^[5>|_<' );
define( 'AUTH_SALT',        'wvf/S) >wYU}A;+bAR)O;sU{9al3[XFhPyw}m:F<,)^{_2m|6.:UQI Rh_-@Xt:5' );
define( 'SECURE_AUTH_SALT', 'x]B2YS_j?{$ Y(epK7EkLU$@c}(w~+-xy!_~,`B6yak|%Ny 4|<yTjy$>Q*dKzQ<' );
define( 'LOGGED_IN_SALT',   'u{ 5+i~!2 K&sg IVv?0MCxsd7d)&s<cdkTRzj!ZA(?rO@OcX2^=|IElJ$gB#gIc' );
define( 'NONCE_SALT',       '4K}]H}Q/R.W@n`9V%!mT$muQT;mP=?;DI*.~bFjf/=|;u;d!rSrM0OoFLO=(os7A' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'ft_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );