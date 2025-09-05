{
  # See https://developers.google.com/idx/guides/customize-idx-env
  channels.nixpkgs.commit = "a97cf141b6567341d74b94a86f560846d0e515d4";
  packages = [
    pkgs.flutter
    pkgs.dart
    pkgs.unzip
    pkgs.wget
    pkgs.bash
    pkgs.openjdk11
  ];
  idx.extensions = [
    "dart-code.flutter"
    "dart-code.dart-code"
    "redhat.java"
    "fwcd.kotlin"
  ];
  idx.previews = {
    enable = true;
    previews = [
      {
        id = "web";
        port = 3000;
        label = "Web";
        command = ["flutter" "run" "-d" "web-server" "--web-port" "3000"];
      }
      {
        id = "android";
        label = "Android";
        command = ["emulator" "-avd" "generic_34" "-no-snapshot" "-no-boot-anim"];
      }
    ];
  };

  # The following options are read and used by the IDX editor.
  # For more information, see: https://developers.google.com/idx/guides/customize-idx-env#idx_options
  idx.workspace.onCreate = {
    android-sdk-install = '''
      # We need to add the Android SDK and command-line tools to the PATH.
      # First, we download the command-line tools.
      mkdir -p ~/android/cmdline-tools
      wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O ~/android/cmdline-tools.zip
      unzip ~/android/cmdline-tools.zip -d ~/android/cmdline-tools
      mv ~/android/cmdline-tools/cmdline-tools ~/android/cmdline-tools/latest
      rm ~/android/cmdline-tools.zip

      # Now we add the required paths to the PATH.
      echo "export ANDROID_HOME=$HOME/android" >> ~/.bashrc
      echo "export PATH=$PATH:$HOME/android/cmdline-tools/latest/bin" >> ~/.bashrc
      echo "export PATH=$PATH:$HOME/android/platform-tools" >> ~/.bashrc
      echo "export PATH=$PATH:$HOME/android/emulator" >> ~/.bashrc
      source ~/.bashrc

      # We need to accept the licenses before we can use the SDK.
      # We use `yes` to automatically accept all licenses.
      mkdir -p ~/.android/
      touch ~/.android/repositories.cfg
      yes | sdkmanager --licenses

      # We can now download the required SDK components.
      sdkmanager "build-tools;34.0.0" "platform-tools" "platforms;android-34"

      # We also need the Android emulator.
      # This is a large download, so it might take a while.
      sdkmanager "system-images;android-34;google_apis;x86_64"
      sdkmanager "emulator"

      # We can now create an Android Virtual Device (AVD).
      avdmanager create avd -n generic_34 -k "system-images;android-34;google_apis;x86_64" -d "pixel"
    ''';
  };
  idx.workspace.onStart = {
    # A list of commands that are run in the workspace terminal when the workspace is started.
    flutter-dev = "flutter doctor && flutter pub get";
  };
}