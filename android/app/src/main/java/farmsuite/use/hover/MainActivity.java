package farmsuite.use.hover;

import android.Manifest;
import android.content.Intent;
import android.os.Bundle;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;

import androidx.core.app.ActivityCompat;

import com.hover.sdk.api.Hover;
import com.hover.sdk.api.HoverParameters;
import com.hover.sdk.actions.HoverAction;
// import farmsuite.use.hover.settings.SettingsHelper;

import java.util.Map;
import java.util.concurrent.TimeUnit;

import io.flutter.Log;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

import java.util.ArrayList;

public class MainActivity extends FlutterActivity {

    private static final String CHANN_GETACTIONS = "farmsuite.use.hover/getactions";

    private String getActions(){
        String get_actions_resp;
        try {
            Hover.initialize(this);
            // Sleep for 10 seconds
            TimeUnit.SECONDS.sleep(10);

            Log.d("MSG", "IN getActions Sims are = " + Hover.getPresentSims(this));
            Log.d("MSG", "IN getActions  Hover actions are = " + Hover.getAllValidActions(this));

        } catch (Exception e) {
            Log.e("MSG", "IN getActions  hover exception", e);
        }

        get_actions_resp = "Call Successful";
        return  get_actions_resp;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);

        // ---------------------------- GET ACTIONS ----------------------------------------
        new MethodChannel(getFlutterView(), CHANN_GETACTIONS).setMethodCallHandler(
            new MethodChannel.MethodCallHandler() {
                @Override
                public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                    if (call.method.equals("getActions")) {
                        String get_actions_response = getActions();
                        result.success(get_actions_response);
                    }
                }
            }
        );
        // -----------------------------------------------------------------------------------

    } // end onCreate

}

