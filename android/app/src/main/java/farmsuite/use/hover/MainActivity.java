package farmsuite.use.hover;

import android.content.Intent;
import android.os.Bundle;

import com.hover.sdk.api.Hover;
import com.hover.sdk.api.HoverParameters;
import com.hover.sdk.actions.HoverAction;

import java.util.Map;

import io.flutter.Log;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

import java.util.ArrayList;
/*

public class MainActivity extends FlutterActivity {

    // Hover Action function
  private static final String CHANNEL = "kikoba.co.tz/hover";
    private  void SendMoney(String PhoneNumber,String amount){
        try {
            Hover.initialize(this);
            Log.d("MainActivity", "Sims are = " + Hover.getPresentSims(this));
            Log.d("MainActivity", "Hover actions are = " + Hover.getAllValidActions(this));
        } catch (Exception e) {
            Log.e("MainActivity", "hover exception", e);

        }
        
        //add your action Id from dashboard 
        Intent i = new HoverParameters.Builder(this)
                .request("action_id")
                .extra("PhoneNumber", PhoneNumber)
                .extra("Amount", amount)
                .buildIntent();

        startActivityForResult(i,0);
    }
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);



    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
            (call, result) -> {
// Get arguments from flutter code
              final Map<String,Object> arguments = call.arguments();
              String PhoneNumber = (String) arguments.get("phoneNumber");
              String amount = (String) arguments.get("amount");
              if (call.method.equals("sendMoney")) {
                SendMoney(PhoneNumber,amount);
                String response = "sent";
                result.success(response);
              }
            });
  }
}
*/

public class MainActivity extends FlutterActivity {

    // Hover Action function
    private static final String CHANNEL = "farmsuite.use.hover/ussd";

    private String loginUser(String username, String password) {
        String userName;
        try {
            Hover.initialize(this);
            Log.d("MainActivity", "Sims are = " + Hover.getPresentSims(this));
             Log.d("MainActivity", "Hover actions are = " + Hover.getAllValidActions(this));

            // HoverAction action_login = Hover.getAction("4457437c");
            // Log.d("MainActivity", "Ze action above is = " + action_login);




        } catch (Exception e) {
            Log.e("MainActivity", "hover exception", e);
        }
        // 1*email:eric,pwd:password
        String email_uname = "1*email:"+username+",pwd:"+password;
        //add your action Id from dashboard
        Intent i = new HoverParameters.Builder(this)
                .request("4457437c")
                .extra("upass", email_uname)
                // .extra("password", password)
                .buildIntent();

         startActivityForResult(i, 0);
        userName = "Some Username";
        return  userName;

        // Test code
        // return "Hello from Native Android Code";
    }

    @Override
    protected void onActivityResult (int requestCode, int resultCode, Intent data) {
        if (requestCode == 0 && resultCode == MainActivity.RESULT_OK) {
            String[] sessionTextArr = data.getStringArrayExtra("session_messages");
            String uuid = data.getStringExtra("uuid");
            Log.d("MainActivity", "RESULT OK UUID = " + uuid);
        } else if (requestCode == 0 && resultCode == MainActivity.RESULT_CANCELED) {
            // Toast.makeText(this, "Error: " + data.getStringExtra("error"), Toast.LENGTH_LONG).show();
            Log.d("MainActivity", "Error = " + data.getStringExtra("error"));
        }
    }

    /*@Override
    public void onError(String message) {
//		Toast.makeText(this, "Error while attempting to download actions, see logcat for error", Toast.LENGTH_LONG).show();
        Log.e("MainActivity", "Error: " + message);
    }

    @Override
    public void onSuccess(ArrayList<HoverAction> actions) {
//		Toast.makeText(this, "Successfully downloaded " + actions.size() + " actions", Toast.LENGTH_LONG).show();
        Log.d("MainActivity", "Successfully downloaded " + actions.size() + " actions");
    }*/

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Hover.initialize(this);
        GeneratedPluginRegistrant.registerWith(this);


        // A small debug
       /* HoverAction action_login = Hover.getAction("4457437c");
        Log.d("MainActivity", "Ze action above is = " + action_login);*/

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                (call, result) -> {
                    // Get arguments from flutter code
                    final Map<String, Object> arguments = call.arguments();
                    String username = (String) arguments.get("username");
                    String password = (String) arguments.get("password");

                    if (call.method.equals("loginUser")) {
                        // Log.i("MSG", "SOMETHING IS WORKING ...");
                        Log.i("MSG", "Username is: " +username);
                        Log.i("MSG", "Password is: " +password);

                        String funcResponse = loginUser(username, password);
                        result.success(funcResponse);
                    }
                }
        );
    }
}

