unit uLog;

interface
uses
  System.SysUtils, Vcl.Forms;
type TLogger = class
  procedure Log(const SchemaName: string; const Msg: string);
end;
implementation


{ TLogger }

procedure TLogger.Log(const SchemaName: string; const Msg: string);
const
  LogFolder = 'C:\Users\gabri\OneDrive\Documents\Embarcadero\Studio\Projects\Projeto-Logix\src\log\';
var
  LogFile: TextFile;
  FileName, Path: string;
begin
  FileName := SchemaName + '_log.txt';
  Path := LogFolder + FileName;

  // Garante que a pasta existe
  if not DirectoryExists(LogFolder) then
    ForceDirectories(LogFolder);

  AssignFile(LogFile, Path);
  if FileExists(Path) then
    Append(LogFile)
  else
    Rewrite(LogFile);

  try
    WriteLn(LogFile, Msg);
  finally
    CloseFile(LogFile);
  end;
end;

end.
