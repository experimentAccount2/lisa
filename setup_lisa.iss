; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!
#include <idp.iss>

#define MyAppName "Lisa"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "University of West Bohemia, NTIS"
#define MyAppURL "http://mjirik.github.io/quantan/"

[Files]
Source: "applications\LISA.ico"; DestDir: "{app}"
;Source: "lisa\icons\LISA256.png"; DestDir: "{app}"
;Source: "..\..\Downloads\Miniconda-latest-Windows-x86_64.exe"; DestDir: "{tmp}"
;Source: "..\..\Downloads\VCForPython27.msi"; DestDir: "{tmp}"
Source: "installer.bat"; DestDir: "{tmp}"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{08C90394-34FC-432B-9AF0-D7E48F337DFC}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
;default is into c:\Users\Public if not, use userpf
;DefaultDirName={%PUBLIC|{userpf}}\{#MyAppName}
DefaultDirName={commonappdata}\{#MyAppName}
;DefaultDirName={%HOMEPATH}\{#MyAppName}
;DefaultDirName={userpf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputBaseFilename=setup_lisa
Compression=lzma
SolidCompression=yes
;PrivilegesRequired=lowest
UsePreviousSetupType=False
UsePreviousTasks=False
UsePreviousLanguage=False
ExtraDiskSpaceRequired=43
SetupIconFile=C:\Users\mjirik\projects\lisa\applications\LISA.ico
UsePreviousAppDir=False

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "czech"; MessagesFile: "compiler:Languages\Czech.isl"

[Run]
;Filename: "{tmp}\Miniconda-latest-Windows-x86_64.exe"; Parameters: "/AddToPath=1 /RegisterPython=1 /D={%PUBLIC}\Minicoconda2"; Flags: waituntilterminated runasoriginaluser
Filename: "{tmp}\Miniconda-latest-Windows-x86_64.exe"; Parameters: "/AddToPath=1 /RegisterPython=1 /InstallationType=AllUsers"; Flags: waituntilterminated runasoriginaluser
Filename: "msiexec.exe"; Parameters: "/i ""{tmp}\VCForPython27.msi"""
Filename: "{cmd}"; Parameters: "/C ""{tmp}\installer.bat & pause"""; WorkingDir: "{tmp}"; Flags: runasoriginaluser
;Filename: "{cmd}"; Parameters: "/C ""conda install --yes -c SimpleITK -c mjirik lisa"""; WorkingDir: "{%HOMEPATH}\Miniconda2\Scripts"; Flags: runasoriginaluser
;Filename: "{cmd}"; Parameters: "/C ""pause"""
;Filename: "conda"; Parameters: "create -y --no-default-packages -c mjirik -c SimpleITK -n lisa lisa pywget pip"

[Code]
function IsCondaInstalled: boolean;
begin
result := not (FileExists('c:\Miniconda2\Scripts\conda.exe') or FileExists('{%HOMEPATH}\Miniconda2\Scripts\conda.exe') or FileExists('c:\Anaconda2\Scripts\conda.exe') or FileExists('c:\Miniconda\Scripts\conda.exe') or FileExists('c:\Anaconda\Scripts\conda.exe') or FileExists('{%HOMEPATH}\Miniconda2\Scripts\conda.exe') or FileExists('{%HOMEPATH}\Miniconda\Scripts\conda.exe') or FileExists('{%HOMEPATH}\Anaconda2\Scripts\conda.exe') or FileExists('{%HOMEPATH}\Anaconda\Scripts\conda.exe'));
end;

procedure InitializeWizard();
begin
  if IsCondaInstalled then
    idpAddFileSize('https://repo.continuum.io/miniconda/Miniconda-latest-Windows-x86_64.exe', ExpandConstant('{tmp}\Miniconda-latest-Windows-x86_64.exe'), 22743040);
  idpAddFileSize('https://download.microsoft.com/download/7/9/6/796EF2E4-801B-4FC4-AB28-B59FBF6D907B/VCForPython27.msi', ExpandConstant('{tmp}\VCForPython27.msi'), 87891968);
  idpDownloadAfter(wpReady);
end;

[Icons]
Name: "{group}\Lisa"; Filename: "{cmd}"; WorkingDir: "{userdocs}"; Flags: runminimized; IconFilename: "{app}\LISA.ico"; IconIndex: 0; Parameters: "/C ""call activate lisa & python -m lisa"""
Name: "{commondesktop}\Lisa"; Filename: "{cmd}"; WorkingDir: "{commondocs}"; Flags: runminimized; IconFilename: "{app}\LISA.ico"; IconIndex: 0; Parameters: "/C ""call activate lisa & python -m lisa"""
