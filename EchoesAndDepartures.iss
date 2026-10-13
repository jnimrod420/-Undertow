[Setup]
AppId={{59CB1F78-4970-461F-8470-507266A2D1B2}
AppName=Echoes & Departures
AppVersion=1.0.0
AppPublisher=Nobody But Ghosts
DefaultDirName={commoncf64}\VST3
DisableDirPage=yes
DisableProgramGroupPage=yes
UninstallFilesDir={autopf}\Nobody But Ghosts\Echoes & Departures
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
PrivilegesRequired=admin
OutputDir=dist
OutputBaseFilename=EchoesAndDepartures-1.0.0-Windows-Setup
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
CloseApplications=yes
RestartApplications=no
SetupLogging=yes
[Files]
Source: "payload\EchoesAndDepartures.vst3\*"; DestDir: "{app}\EchoesAndDepartures.vst3"; Flags: ignoreversion recursesubdirs createallsubdirs
[UninstallDelete]
Type: dirifempty; Name: "{app}\EchoesAndDepartures.vst3"
[Messages]
WelcomeLabel2=This will install Echoes & Departures 1.0.0 by Nobody But Ghosts for 64-bit Windows VST3 hosts.%n%nClose REAPER or your audio host before continuing. After installation, reopen your host and rescan VST3 plugins.
FinishedLabel=Echoes & Departures has been installed. Open your audio host, rescan VST3 plugins, and select Echoes & Departures.
