if [ "$bundle_identifier" ]; then
    #Finds the project level dir
    export ZAPP_HOME=`find /Users/$USER -name ZappiOS | head -n 1`
    echo "The ZAPP_HOME dir is $ZAPP_HOME"

    # Get NotificationService.swift file path
    old_file_path=`find "$ZAPP_HOME" -maxdepth 3 -name "AppWidget.swift" | tail -1`
    new_file_path="$ZAPP_HOME/node_modules/@applicaster/zapp-general-widget-plugin-sample/apple/extensions/widget/AppWidget.swift"

    echo "Replacing file: $old_file_path"

    if [ -z "$old_file_path" ]; then
        echo "Can't find the AppWidget.swift file, going to skip this script."
    else
        mv $new_file_path $old_file_path
    fi
else
    echo "Skipping the step for local builds"
fi
