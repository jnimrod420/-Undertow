Unicode true
!include "MUI2.nsh"
!include "x64.nsh"
!include "LogicLib.nsh"
!define VERSION "0.3.0"
!define PRODUCT "Dead Air"
!define UNINSTALLKEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\NobodyButGhosts.DeadAir"
Name "${PRODUCT} ${VERSION}"
OutFile "dist\DeadAir-0.3.0-Windows-Setup.exe"
InstallDir "$COMMONFILES64\VST3"
InstallDirRegKey HKLM "${UNINSTALLKEY}" "PluginDirectory"
RequestExecutionLevel admin
SetCompressor /SOLID lzma
SetOverwrite on
VIProductVersion "0.3.0.0"
VIAddVersionKey "ProductName" "Dead Air"
VIAddVersionKey "CompanyName" "Nobody But Ghosts"
VIAddVersionKey "FileDescription" "Dead Air VST3 Installer"
VIAddVersionKey "FileVersion" "0.3.0.0"
VIAddVersionKey "ProductVersion" "0.3.0"
VIAddVersionKey "LegalCopyright" "Nobody But Ghosts"
!define MUI_ABORTWARNING
!define MUI_WELCOMEPAGE_TEXT "Install Dead Air 0.3.0 with 20 Transmission presets.$\r$\n$\r$\nClose REAPER or any other audio application before continuing.$\r$\n$\r$\nThe complete plug-in will be installed into the standard 64-bit VST3 folder."
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_INSTFILES
!define MUI_FINISHPAGE_TEXT "Dead Air is installed.$\r$\n$\r$\nOpen your DAW and rescan its VST3 plug-ins. In REAPER, use Preferences > Plug-ins > VST > Re-scan.$\r$\n$\r$\nChoose a voice from the Transmission menu."
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_LANGUAGE "English"
Function .onInit
  ${IfNot} ${RunningX64}
    MessageBox MB_ICONSTOP "Dead Air requires 64-bit Windows."
    Abort
  ${EndIf}
  SetRegView 64
  SetShellVarContext all
FunctionEnd
Section "Dead Air VST3"
  SetOutPath "$INSTDIR\Dead Air.vst3"
  File /r "payload\Dead Air.vst3\*.*"
  SetOutPath "$PROGRAMFILES64\Nobody But Ghosts\Dead Air"
  WriteUninstaller "$PROGRAMFILES64\Nobody But Ghosts\Dead Air\Uninstall.exe"
  WriteRegStr HKLM "${UNINSTALLKEY}" "DisplayName" "Dead Air (VST3)"
  WriteRegStr HKLM "${UNINSTALLKEY}" "DisplayVersion" "${VERSION}"
  WriteRegStr HKLM "${UNINSTALLKEY}" "Publisher" "Nobody But Ghosts"
  WriteRegStr HKLM "${UNINSTALLKEY}" "PluginDirectory" "$INSTDIR"
  WriteRegStr HKLM "${UNINSTALLKEY}" "InstallLocation" "$INSTDIR\Dead Air.vst3"
  WriteRegStr HKLM "${UNINSTALLKEY}" "UninstallString" '$"$PROGRAMFILES64\Nobody But Ghosts\Dead Air\Uninstall.exe$"'
  WriteRegStr HKLM "${UNINSTALLKEY}" "QuietUninstallString" '$"$PROGRAMFILES64\Nobody But Ghosts\Dead Air\Uninstall.exe$" /S'
  WriteRegDWORD HKLM "${UNINSTALLKEY}" "NoModify" 1
  WriteRegDWORD HKLM "${UNINSTALLKEY}" "NoRepair" 1
SectionEnd
Function un.onInit
  SetRegView 64
  SetShellVarContext all
  ReadRegStr $INSTDIR HKLM "${UNINSTALLKEY}" "PluginDirectory"
  ${If} $INSTDIR == ""
    MessageBox MB_ICONSTOP "The Dead Air installation path could not be found. No files were removed."
    Abort
  ${EndIf}
FunctionEnd
Section "Uninstall"
  IfFileExists "$INSTDIR\Dead Air.vst3\*.*" 0 remove_metadata
  ClearErrors
  RMDir /r "$INSTDIR\Dead Air.vst3"
  IfErrors uninstall_failed remove_metadata
uninstall_failed:
  MessageBox MB_ICONSTOP "Dead Air could not be removed. Close your audio applications and try again." /SD IDOK
  SetErrorLevel 1
  Abort
remove_metadata:
  Delete "$PROGRAMFILES64\Nobody But Ghosts\Dead Air\Uninstall.exe"
  RMDir "$PROGRAMFILES64\Nobody But Ghosts\Dead Air"
  RMDir "$PROGRAMFILES64\Nobody But Ghosts"
  DeleteRegKey HKLM "${UNINSTALLKEY}"
SectionEnd
