# ------------------------------------------------
# Base image with Flutter SDK preinstalled (Flutter 3.16.0 + Dart 3.2.3)
# ------------------------------------------------
  FROM ghcr.io/cirruslabs/flutter:3.16.0

  # ------------------------------------------------
  # Install dependencies: Node.js, JDK 17, CLIs, and tools
  # ------------------------------------------------
  RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get update \
    && apt-get install -y \
       nodejs \
       openjdk-17-jdk \
       wget \
       unzip \
       git \
       xz-utils \
       zip \
       libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*
  
  RUN npm install -g firebase-tools \
    && dart pub global activate flutterfire_cli
  
  ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
  
  # ------------------------------------------------
  # Install Android SDK (Command line tools only)
  # ------------------------------------------------
  RUN mkdir -p /usr/local/android-sdk/cmdline-tools
  
  RUN cd /usr/local/android-sdk/cmdline-tools \
    && wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -O cmdline-tools.zip \
    && unzip cmdline-tools.zip -d latest \
    && rm cmdline-tools.zip
  
  ENV ANDROID_HOME=/usr/local/android-sdk
  ENV PATH=/root/.pub-cache/bin:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH
  
  RUN yes | sdkmanager --licenses \
    && sdkmanager "platform-tools" "emulator" "platforms;android-34" "build-tools;34.0.0"
  
  # ------------------------------------------------
  # Run flutter doctor to pre-cache artifacts and verify setup
  # ------------------------------------------------
  RUN flutter doctor -v
  
  # ------------------------------------------------
  # Create a non-root user for VS Code to run as
  # ------------------------------------------------
  RUN useradd -ms /bin/bash vscode
  
  RUN chown -R vscode:vscode /sdks/flutter \
    && chown -R vscode:vscode /usr/local/android-sdk \
    && chown -R vscode:vscode /root/.pub-cache
  
  USER vscode
  WORKDIR /workspace
  
  RUN git config --global --add safe.directory /sdks/flutter
  