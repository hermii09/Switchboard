Switchboard

An experimental iOS project exploring hardware switch detection and system-level interaction, with the ultimate goal of creating a Spoofed Action Button.

Switchboard is an experimental iOS application investigating how the iPhone’s physical Ring/Silent switch can be repurposed through software and deeper system interaction.

Status: Very early closed alpha — an initial testing build has been distributed to a very small group of testers.

IMPORTANT — COMPATIBILITY DISCLAIMER

Switchboard currently only supports the following iOS versions:

* iOS 26.0–26.7.2
* iOS 27.2
* iOS 27.0 Developer Beta 1–4

Other iOS versions are not currently supported, and compatibility is not guaranteed.

Compatibility requirements may change. As the worse_query exploit evolves, supported iOS versions may be added, removed, or otherwise changed depending on exploit availability and compatibility.

Main Goal — Spoofed Action Button

The primary objective of Switchboard is to use the worse_query exploit to enable a custom software-controlled Action Button experience, potentially replacing the stock Ringer Switch functionality.

The Spoofed Action Button concept already has a working standalone implementation:

* Back Tap integration — the Spoofed Action Button can currently be triggered through Back Tap.
* Settings integration — the Action Button is visible within iOS Settings.

The ultimate goal is to make this functionality work as a replacement for the physical Ringer Switch.

Current Challenges

Two major obstacles remain:

* Software triggering — finding a reliable way to trigger the Action Button functionality directly through software, without relying on Back Tap.
* Background execution — making Switchboard detect and respond to ringer-state changes without requiring the application to remain open.

These are the primary areas of ongoing research and development.

Current Development

The current application already has working foundational functionality.

Features

* Switch status detection — successfully detects the iPhone’s physical Ring/Silent switch state.
* Live status interface — displays the currently detected switch state.
* Timestamped event log — records detected state changes.
* Foreground monitoring — switch-state detection currently works while the application is open.
* Minimal interface — focused on presenting device state clearly.

Testing

A very early closed-alpha build has been distributed privately to a very small testing team.

The individual components have working implementations, but background monitoring and the integration of the Spoofed Action Button into the overall Switchboard experience remain works in progress.

Switchboard is not publicly available.