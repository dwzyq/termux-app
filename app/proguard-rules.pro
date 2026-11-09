# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in android-sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

#-renamesourcefileattribute SourceFile
#-keepattributes SourceFile,LineNumberTable

# Temp fix for androidx.window:window:1.0.0-alpha09 imported by termux-shared
# https://issuetracker.google.com/issues/189001730
# https://android-review.googlesource.com/c/platform/frameworks/support/+/1757630
-keep class androidx.window.** { *; }

# Keep JNI entry points and native method names. R8 would otherwise rename the
# Java classes/methods and the native symbol lookup would fail at runtime.
-keep class com.termux.app.TermuxInstaller { *; }
-keep class com.termux.terminal.JNI { *; }
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep Serializable model classes whose class/field names are stored in files
# or passed across process boundaries.
-keep class com.termux.shared.models.** { *; }

# java.lang.ClassValue is not available on Android < 8.0 (API 26) and is only
# referenced by optional code paths, so R8 can safely ignore the missing class.
-dontwarn java.lang.ClassValue
