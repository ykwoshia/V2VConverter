program v2v;

{$MODE Delphi}

uses
{$IFNDEF FPC}
  StringUsageLogging, FastMM4,
{$ENDIF}
StringPool,
DelphiAST, DelphiAST.Writer, DelphiAST.Classes,
SimpleParser.Lexer.Types, IOUtils, Diagnostics;


var
SyntaxTree: TSyntaxNode;
FileName: string='/home/kevin/Documents/pascal/device.pas';


begin
 writeln('hello world');

 try
  SyntaxTree := TPasSyntaxTreeBuilder.Run(FileName, False,
       nil,nil);
        //SyntaxTree := TPasSyntaxTreeBuilder.Run(FileName, False,
        //TIncludeHandler.Create(ExtractFilePath(FileName)), OnHandleString);
    try
   write(TSyntaxTreeWriter.ToXML(SyntaxTree, True));
    finally
     SyntaxTree.Free;
    end;
  except
    on E: ESyntaxTreeException do
    begin
      write(E.Line, E.Col, E.Message);
      writeln;
      writeln;
      TSyntaxTreeWriter.ToXML(E.SyntaxTree, True);
      //write(Result);
    end;
    end;
end.

