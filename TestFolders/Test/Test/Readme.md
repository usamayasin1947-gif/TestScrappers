#  <#Title#>

# OpenHome Swift Task

This repository contains a Swift application for real-time audio interaction using WebSockets. The app features audio recording, playback, and dynamic UI elements to visualize audio activity.

## Features

- **Audio Recording**: Records audio using `AVAudioEngine` and converts it to Base64 for transmission.
- **WebSocket Communication**: Handles real-time communication with a WebSocket server.
- **Audio Playback**: Plays received audio and notifies the WebSocket server about the playback status.
- **Dynamic UI**: Displays an image and name fetched from a network and shows visual indicators based on audio activity.

## Getting Started

### Prerequisites

- Xcode 15 or later
- Swift 5.7 or later
- iOS 16 or later

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/usamayasin1947-gif/openhome-swift-task.git
    ```

2. **Navigate to the project directory:**

    ```bash
    cd openhome-swift-task
    ```

3. **Open the project in Xcode:**

    ```bash
    open OpenHomeSwiftTask.xcodeproj
    ```

4. **Build and run the project in Xcode.**

## Usage

### Audio Recording

- **Start Recording**: Tap the green phone icon to start recording. The app will begin capturing audio and sending it to the WebSocket server.
- **Stop Recording**: Tap the red phone icon to stop recording. The app will cease audio capture and finalize the transmission.

### Audio Playback

- **Audio Playback**: When audio is received from the WebSocket server, it will be played back. The app will display animations during playback to visualize audio activity.

## WebSocket Communication

- **Server URL**: The app communicates with the WebSocket server at `wss://app.openhome.xyz/websocket/voice-stream/...`
- **Messages**:
  - **Sending Audio**: Audio data is sent as Base64-encoded strings.
  - **Handling Audio**: When audio starts, the app sends `{"type":"text","data":"bot-speak-start"}`. After playback ends, it sends `{"type":"text","data":"bot-speak-end"}`.
  - **Interruptions**: If significant audio activity is detected, an `{"type":"text","data":"interrupt-event"}` message is sent to the server.

## Code Overview

- **`MyViewModel`**: Manages fetching and storing data from the network.
- **`WebSocketManager`**: Handles WebSocket connections and messaging.
- **`AudioPlayer`**: Plays audio and handles playback notifications.
- **`AudioManager`**: Manages audio recording, processing, and sending.
- **`ContentView`**: The main view, including UI elements for recording and visual feedback.

## Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a Pull Request to the main repository.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [SwiftUI](https://developer.apple.com/xcode/swiftui/) for the UI components.
- [AVFoundation](https://developer.apple.com/documentation/avfoundation) for audio handling.

