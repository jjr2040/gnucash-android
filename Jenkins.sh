CWD=${PWD}
APK_PATH="app/build/outputs/apk/development/debug"
APK_NAME="GnucashAndroid.apk"
export ANDROID_APK=${CWD}/${APK_PATH}/${APK_NAME}
MONKEY_PATH="./tests/Monkey"
MONKEY_NAME="monkey_results.txt"
MONKEY_RESULTS=${MONKEY_PATH}/${MONKEY_NAME}
VRT_DIFF_PATH="appium/snapshots/__diff_snapshots__"
CUCUMBER="tests/BDT/calabash-gnu/cucumber.json"
ANDROID_AVD_DEVICE=$1
E2E_BDT=$2
VRT=$3
export VRT_TRESHOLD=$4
MONKEY=$5
MONKEY_EVENTS=$6
MONKEY_SEED=$7
MUTATION=$8
MUTATION_TYPE=$9
MUTANTS_NUMBER=${10}
OPERATORS=${11}

echo "--------------"
echo "Android device: ${ANDROID_AVD_DEVICE}"
echo "E2E enabled: ${E2E_BDT}"
echo "VRT enabled: ${VRT}"
echo "VRT treshold: ${VRT_TRESHOLD}"
echo "Monkey enabled: ${MONKEY}"
echo "Monkey events: ${MONKEY_EVENTS}"
echo "Monkey seed: ${MONKEY_SEED}"
echo "Mutation enabled: ${MUTATION}"
echo "Mutation type: ${MUTATION_TYPE}"
echo "Number of mutants: ${MUTANTS_NUMBER}"
echo "Mutation operators: ${OPERATORS}"
echo "--------------"

mv -f ${APK_PATH}/*.apk ${ANDROID_APK}
rm ${MONKEY_PATH}/*
touch ${MONKEY_RESULTS}
rm ${VRT_DIFF_PATH}/*
rm ${CUCUMBER}

if [ ! ${E2E_BDT} = "false" ] ; then
	echo "------- START BDT (CALABASH/CUCUMBER)"
	gem install bundler
	cd tests/BDT/calabash-gnu
	bundle install
	chmod +x scripts/run_android_features
	cd scripts && ./run_android_features -r -d ${ANDROID_AVD_DEVICE}
	cd ../../../..
	echo "------- END BDT (CALABASH/CUCUMBER)"
fi

if [ ! ${VRT} = "false" ] ; then
	echo "------- START VRT"
	cd appium && npm run vrt:run
	cd ..
	echo "------- END VRT"
fi

if [ ! ${MONKEY} = "false" ] ; then
	echo "------- START MONKEY"
	$ANDROID_HOME/platform-tools/adb install -r ${ANDROID_APK}
    $ANDROID_HOME/platform-tools/adb shell am start -a android.intent.action.MAIN -c android.intent.category.LAUNCHER -n "org.gnucash.android.devel/org.gnucash.android.ui.account.AccountsActivity"
	$ANDROID_HOME/platform-tools/adb shell monkey -p org.gnucash.android.devel -s ${MONKEY_SEED} -v ${MONKEY_EVENTS} >> ${MONKEY_RESULTS}
	echo "------- END MONKEY"
fi

if [ ! ${MUTATION} = "false" ] ; then
	if [  ${MUTATION_TYPE} = "MDroidPlus" ] ; then
		echo "------- START MUTATION (MDROID)"
		git clone https://gitlab.com/SEMERU-Code-Public/Android/Mutation/MDroidPlus
		cd MDroidPlus
		rm -rf mutants
		mkdir mutants
		mvn clean
		mvn package
		java -jar target/MDroidPlus-1.0.0.jar ./libs4ast/ ../ org.gnucash.android ./mutants/ . false
		echo "------- END MUTATION MDROID"
	else if [  ${MUTATION_TYPE} = "MutAPK" ] ; then
		echo "------- START MUTATION (MUTAPK)"
		git clone https://github.com/TheSoftwareDesignLab/MutAPK.git
		cd MutAPK
		echo ${OPERATORS} > operators.properties
		rm -rf mutants
		mkdir mutants
		mvn clean
		mvn package
		java -jar target/MutAPK-0.0.1.jar ../${APK_PATH}/${APK_NAME} org.gnucash.android ./mutants/ ./extra/ . true ${MUTANTS_NUMBER}
		echo "------- END MUTATION MUTAPK"
	fi
fi
