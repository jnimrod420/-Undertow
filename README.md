# Undertow

An original six-control random-drift and dynamic low-pass guitar effect for Nobody But Ghosts. Inspired by the publicly described behaviour of Shallow Water; not a circuit-exact or official Fairfield product.

## Mac VST3 and AU

The Build Mac plugins workflow compiles universal Apple Silicon + Intel binaries, tests the DSP, and loads the actual VST3 for audio/state/editor checks. Download the completed workflow artifact from the Actions tab. No successful binary build is claimed until that workflow passes.

## Source

All project sources are in `Undertow-source.zip`. Unzip to inspect or edit the C++/JUCE project, tests, and REAPER-native version. JUCE is fetched at build time using a pinned archive checksum.

The original source is MIT licensed; JUCE has separate licensing terms. The first version has not been compared against recordings from the hardware pedal.
