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
var
  LogFolder: string;
  LogFile: TextFile;
  FileName, Path: string;
begin
  LogFolder := expandFileName(extractFilePath(paramStr(0)) + '..\..\src\log\');
  // Se SchemaName estiver vazio, escreve no sistema_logix_Log.txt
  if Trim(SchemaName) = '' then
    FileName := 'sistema_logix_Log.txt'
  else
    FileName := SchemaName + '_log.txt';

  Path := LogFolder + FileName;
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
