# cf-libphonenumber

__A phone number processing library for Coldfusion__

Build on top of the [libphonenumber library](https://github.com/googlei18n/libphonenumber) from Google, this library allows parsing, formatting, storing and validating international phone numbers.

# How to install

### Lucee 4

Download the latest version [here](https://github.com/jbvanzuylen/cf-libphonenumber/releases/download/v1.0.1/cf-libphonenumber-lucee4-ext.zip)

__Install as an extension__

* Connect to the Web Administration
* Go to `Extension > Application`
* Scroll down to the bottom of the page
* Click on `Browse` button in the `Upload new extension` section
* Select the ZIP file you have downloaded above
* Hit the `Upload` button and follow the instructions

__Manual installation__

* Unzip the file you have downloaded above
* Copy the `.jar` files from the `lib` folder to the `WEB-INF\lucee\lib` directory in your web root
* Copy the `.cfm` files from the `functions` folder to the `WEB-INF\lucee\library\function` directory in your web root
* Copy the `.cfc` file from the `components` folder to the `WEB-INF\lucee\components\libphonenumber` directory in your web root
