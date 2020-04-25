const opts = {
  port: 4723,
  host: 'localhost',
  capabilities: {
    platformName: "Android",
    platformVersion: "8",
    deviceName: "Android Emulator",
    app: "/Users/jjvillegas/Documents/miso/pruebas/project/gnucash-android/app/build/outputs/apk/development/debug/GnucashAndroid_v2.4.0-dev3_r4bf0eeb6.apk",
    // appPackage: "io.appium.android.apis",
    appPackage: 'org.gnucash.android.devel',
    appActivity: "org.gnucash.android.ui.account.AccountsActivity",
    appWaitActivity: "org.gnucash.android.*",
    automationName: "UiAutomator2",
    avd: 'Pixel_2_API_27'
  }
};

module.exports = opts;