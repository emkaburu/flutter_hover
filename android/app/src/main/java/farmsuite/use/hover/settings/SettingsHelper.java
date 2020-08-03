package farmsuite.use.hover.settings;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;

import androidx.core.app.ActivityCompat;

/*import com.hover.runner.ApplicationInstance;
import com.hover.runner.R;
import com.hover.runner.api.Apis;
import com.hover.runner.utils.Utils;*/

public class SettingsHelper {
    public final static String ENV = "hoverEnv";
    public final static String EMAIL = "hoverEmail";
    private final static String API_KEY_LABEL = "apiKey";

    public static boolean hasPermissions(Context context, String[] permissions) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && context != null && permissions != null) {
            for (String permission : permissions) {

                if (ActivityCompat.checkSelfPermission(context, permission) != PackageManager.PERMISSION_GRANTED) {
                    return false;
                }
            }
        }
        return true;
    }

}