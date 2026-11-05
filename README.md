# Switchboard

**A small iOS experiment exploring hardware switch detection and system interaction.**

Switchboard is an experimental iOS application exploring how an app can respond to changes in the iPhone's physical Ring/Silent switch state.

The project focuses on switch-state detection, live status feedback, and timestamped event logging.

> **Status:** Experimental — functionality and device compatibility are still being tested.

## Features

- **Switch status interface** — visual feedback for the detected Ring/Silent state.
- **Timestamped event log** — records detected state changes.
- **Foreground monitoring** — designed to monitor changes while the application is open.
- **Minimal interface** — focused on presenting device state clearly.

## Important limitations

iOS does not provide ordinary third-party applications with a public API for directly reading the physical Ring/Silent switch state.

Any detection approach used by Switchboard is experimental and may be unreliable or affected by iOS behavior.

Switchboard does not replace the system's Action Button, modify iOS system controls, or guarantee background monitoring.

## Compatibility

- **Platform:** iOS
- **Target device:** iPhone
- **Build system:** Xcode
- **Project generation:** XcodeGen

Device compatibility and minimum iOS version are subject to verification.

## Building

This repository includes an automated GitHub Actions workflow intended to build an unsigned iOS IPA.

1. Open the repository's **Actions** tab.
2. Select **Build IPA**.
3. Run the workflow using **Run workflow**, if available.
4. Once completed, open the workflow run.
5. Download the `Switchboard-ipa` artifact.

The generated IPA is unsigned and requires an appropriate sideloading method before it can be installed.

## Project structure

```text
Switchboard/
├── .github/
│   └── workflows/
│       └── build.yml
├── Switchboard/
│   ├── App.swift
│   ├── ContentView.swift
│   ├── MuteDetector.swift
│   ├── Assets.xcassets/
│   └── silence.wav
└── project.yml
```

## Disclaimer

Switchboard is an independent experimental project. It is not affiliated with, endorsed by, or supported by Apple.

Features that depend on undocumented or indirect iOS behavior may stop working after an iOS update.

## Credits

**Created by Ermis**

Concept, project direction, and development.

---

*Switchboard — exploring the boundaries between iOS hardware and software.*
