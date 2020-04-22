ANDROID_AVD_DEVICE=$1
E2E_BDT=$2
RANDOM=$3
RANDOM_EVENTS=$4

rm ./app/build/outputs/apk/development/debug/GnucashAndroid.apk
mv ./app/build/outputs/apk/development/debug/*.apk ./app/build/outputs/apk/development/debug/GnucashAndroid.apk

if [ ! ${E2E_BDT} = "false" ] ; then
	gem install bundler
	cd tests/BDT/calabash-gnu
	bundle install
	chmod +x scripts/run_android_features
	cd scripts && ./run_android_features -r -d ${ANDROID_AVD_DEVICE}
fi

if [ ! ${RANDOM} = "false" ] ; then
	$ANDROID_HOME/platform-tools/adb install -r ./app/build/outputs/apk/development/debug/GnucashAndroid.apk
    $ANDROID_HOME/platform-tools/adb shell am start -a android.intent.action.MAIN -c android.intent.category.LAUNCHER -n "org.gnucash.android.devel/org.gnucash.android.ui.account.AccountsActivity"
	$ANDROID_HOME/platform-tools/adb shell monkey -p org.gnucash.android.devel -v ${RANDOM_EVENTS}
fi
