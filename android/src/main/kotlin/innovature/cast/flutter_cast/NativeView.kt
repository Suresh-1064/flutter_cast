package innovature.cast.flutter_cast


import android.content.Context
import android.view.ContextThemeWrapper
import android.view.View
import androidx.mediarouter.app.MediaRouteButton
import com.google.android.gms.cast.framework.CastButtonFactory
import io.flutter.plugin.platform.PlatformView


internal class NativeView(context: Context) :
    PlatformView {
    private val chromeCastButton = MediaRouteButton(ContextThemeWrapper(context, R.style.AppTheme))
    override fun getView(): View {
        return chromeCastButton
    }

    override fun dispose() {}

    init {
        context.setTheme(R.style.AppTheme)
        CastButtonFactory.setUpMediaRouteButton(context, chromeCastButton)
    }


}

