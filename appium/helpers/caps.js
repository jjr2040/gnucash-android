const opts = {
  port: 4723,
  host: 'localhost',
  capabilities: {
    platformName: "Android",
    platformVersion: "8",
    deviceName: "Android Emulator",
    app: `${process.env.ANDROID_APK}`,
    // appPackage: "io.appium.android.apis",
    appPackage: 'org.gnucash.android.devel',
    appActivity: "org.gnucash.android.ui.account.AccountsActivity",
    appWaitActivity: "org.gnucash.android.*",
    automationName: "UiAutomator2",
    avd: `${process.env.ANDROID_AVD_NAME}`,
    adbPort: `${process.env.ANDROID_ADB_SERVER_PORT}`
  }
};

module.exports = opts;