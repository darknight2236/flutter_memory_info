# Keep the main plugin class
-keep public class com.github.wgh136.flutter_memory_info.FlutterMemoryInfoPlugin {
    public *;
}

# Keep all methods and fields used by reflection
-keepattributes Signature
-keepattributes *Annotation*

# Keep ActivityManager related classes
-keep class android.app.ActivityManager { *; }
-keep class android.app.ActivityManager$MemoryInfo { *; }

# Keep androidx.core classes that might be obfuscated
-keep class androidx.core.content.ContextCompat { *; }

# Keep Kotlin metadata
-keepattributes RuntimeVisibleAnnotations,RuntimeVisibleParameterAnnotations,RuntimeVisibleTypeAnnotations

# Keep generic signatures for better compatibility
-keepattributes Signature

# Prevent obfuscation of method channel related classes
-keep class io.flutter.plugin.common.MethodChannel { *; }
-keep class io.flutter.plugin.common.MethodCall { *; }
-keep class io.flutter.embedding.engine.plugins.FlutterPlugin { *; }