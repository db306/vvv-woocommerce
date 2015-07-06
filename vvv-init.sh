# Init script for WooCommerce Dev site

echo "Setting up WooCommerce development site"

# Make a DB, if we dont have one already
echo "Creating database (if not already there)"
mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS woocommerce"
mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON woocommerce.* TO woocommerce@localhost IDENTIFIED BY 'woocommerce';"

if [ ! -d htdocs ]
then
	echo "Creating a clean WordPress install for WooCommerce"

	# Create htdocs folder
	mkdir htdocs
	cd htdocs

	# Download WordPress Core
	wp core download
	# Use WP CLI to create wp-config.php file
	wp core config --dbname="woocommerce" --dbuser=woocommerce --dbpass=woocommerce --dbhost=localhost --allow-root
	# Use WP CLI to install a clean copy of WordPress
	wp core install --url=woocommerce.dev --title="WooCommerce" --admin_user=admin --admin_password=password --admin_email=demo@example.com

	# Install & Activate WooCommerce Plugin
	echo "Installing & Activating WooCommerce"
	wp plugin install woocommerce --activate

	# Install & Activate Storefront Theme
	echo "Installing & Activating Storefront"
	wp theme install storefront --activate

	# We are done!
	echo "Done"
	cd ..
fi

echo "WooCommerce installed at http://woocommerce.dev/ Login:admin Pass:password"
