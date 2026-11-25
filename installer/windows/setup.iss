#define AppName "Arabic Text Toolkit"
#define AppVersion "0.1.0"
#define AppPublisher "FadyEmad0"

[Setup]
AppId={{A8C2F1D4-6E9B-4F8A-9D2C-7B1E5A3F0C61}
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
DefaultDirName={autopf}\Arabic Text Toolkit
DefaultGroupName={#AppName}
UninstallDisplayIcon={app}\arabic-text-toolkit.exe
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
PrivilegesRequired=admin
OutputDir=..\..\build\installer
OutputBaseFilename=ArabicTextToolkit-Setup
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
DisableProgramGroupPage=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Create a desktop shortcut"; GroupDescription: "Additional shortcuts:"; Flags: unchecked

[Files]
Source: "..\..\build\arabic-text-toolkit.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "launch-help.bat"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\Arabic Text Toolkit - Help"; Filename: "{app}\launch-help.bat"; WorkingDir: "{app}"
Name: "{autodesktop}\Arabic Text Toolkit - Help"; Filename: "{app}\launch-help.bat"; WorkingDir: "{app}"; Tasks: desktopicon
