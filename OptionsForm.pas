{******************************************************************************}
{                                                                              }
{  PNDTools is Copyright ©2011-2013 Janek Schäfer                              }
{                                                                              }
{  This file is part of PNDTools                                               }
{                                                                              }
{  PNDTools is free software: you can redistribute it and/or modify            }
{  it under the terms of the GNU General Public License as published by        }
{  the Free Software Foundation, either version 3 of the License, or           }
{  (at your option) any later version.                                         }
{                                                                              }
{  PNDTools is distributed in the hope that it will be useful,                 }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of              }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               }
{  GNU General Public License for more details.                                }
{                                                                              }
{  You should have received a copy of the GNU General Public License           }
{  along with this program.  If not, see <http://www.gnu.org/licenses/>.       }
{                                                                              }
{******************************************************************************}

unit OptionsForm;

{$IFDEF FPC}
  {$MODE DELPHI}
{$ENDIF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MainForm;

type
  TfrmOptions = class(TForm)
    grbGeneral: TGroupBox;
    cbxSmartAdd: TCheckBox;
    cbxIcons: TCheckBox;
    grbPaths: TGroupBox;
    pnlProgMkSquash: TPanel;
    edtProgMkSquash: TEdit;
    btnMkSquash: TButton;
    lblProgMkSquash: TLabel;
    pnlProgUnSquash: TPanel;
    lblProgUnSquash: TLabel;
    edtProgUnSquash: TEdit;
    btnUnSquash: TButton;
    pnlProgChmod: TPanel;
    lblProgChmod: TLabel;
    edtProgChmod: TEdit;
    btnChmod: TButton;
    opdExeFile: TOpenDialog;
    grbParams: TGroupBox;
    memParams: TMemo;
    pnlParamMkSquash: TPanel;
    lblParamMkSquash: TLabel;
    edtParamMkSquash: TEdit;
    pnlParamChmod: TPanel;
    lblParamChmod: TLabel;
    edtParamChmod: TEdit;
    pnlParamUnSquash: TPanel;
    lblParamUnSquash: TLabel;
    edtParamUnSquash: TEdit;
    pnlButtons: TPanel;
    btnCancel: TButton;
    btnOK: TButton;
    cbxBinary: TCheckBox;
    opdSchema: TOpenDialog;
    pnlSchema: TPanel;
    lblSchema: TLabel;
    edtSchema: TEdit;
    btnSchema: TButton;
    lblMessage: TLabel;
    lblLog: TLabel;
    cobLog: TComboBox;
    lblDialogue: TLabel;
    cobDialogue: TComboBox;
    procedure btnSchemaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnMkSquashClick(Sender: TObject);
    procedure btnUnSquashClick(Sender: TObject);
    procedure btnChmodClick(Sender: TObject);
  private
    { Private declarations }
  public               
    Settings : rSettings;
    function Execute(const S : rSettings) : Boolean;
  end;

var
  frmOptions: TfrmOptions;
  Successful : Boolean;

implementation

{$Ifdef Win32}
uses ControlHideFix;
{$Endif}

{$R *.dfm}

function TfrmOptions.Execute(const S : rSettings) : Boolean;
begin
    with S do
    begin
        cbxSmartAdd.Checked := SmartAdd;
        cbxIcons.Checked := ShowIcons;
        cbxBinary.Checked := SizeBinary;
        edtProgMkSquash.Text := ProgMkSquash;
        edtProgUnSquash.Text := ProgUnSquash;
        edtProgChmod.Text := ProgChmod;
        edtParamMkSquash.Text := ParamMkSquash;
        edtParamUnSquash.Text := ParamUnSquash;
        edtParamChmod.Text := ParamChmod;
        edtSchema.Text := SchemaFile;
        cobLog.ItemIndex := LogLevel;
        cobDialogue.ItemIndex := DialogueLevel - 1; // no "info" option
    end;
              
    Successful := false;
    ShowModal;
    Result := Successful;
end;

procedure TfrmOptions.FormCreate(Sender: TObject);
var
    dummy : TButtonEvent;
begin
    {$Ifdef Win32}
    KeyPreview := true;
    dummy := TButtonEvent.Create;
    OnKeyDown := dummy.KeyDown;
    dummy.Free;
    {$Endif}
end;

procedure TfrmOptions.btnChmodClick(Sender: TObject);
begin
    if opdExeFile.Execute then
        edtProgChmod.Text := opdExeFile.FileName;
end;

procedure TfrmOptions.btnMkSquashClick(Sender: TObject);
begin
    if opdExeFile.Execute then
        edtProgMkSquash.Text := opdExeFile.FileName;
end;

procedure TfrmOptions.btnUnSquashClick(Sender: TObject);
begin
    if opdExeFile.Execute then
        edtProgUnSquash.Text := opdExeFile.FileName;
end;

procedure TfrmOptions.btnSchemaClick(Sender: TObject);
begin
    if opdSchema.Execute then
        edtSchema.Text := opdSchema.FileName;
end;

procedure TfrmOptions.btnOKClick(Sender: TObject);
begin
    with Settings do
    begin
        SmartAdd := cbxSmartAdd.Checked;
        ShowIcons := cbxIcons.Checked;
        SizeBinary := cbxBinary.Checked;
        ShowIcons := cbxIcons.Checked;
        ProgMkSquash := edtProgMkSquash.Text;
        ProgUnSquash := edtProgUnSquash.Text;
        ProgChmod := edtProgChmod.Text;
        ParamMkSquash := edtParamMkSquash.Text;
        ParamUnSquash := edtParamUnSquash.Text;
        ParamChmod := edtParamChmod.Text;
        SchemaFile := edtSchema.Text;
        LogLevel := cobLog.ItemIndex;
        DialogueLevel := cobDialogue.ItemIndex + 1; // no "info" option
    end;

    Successful := true;
    Close;
end;

procedure TfrmOptions.btnCancelClick(Sender: TObject);
begin
    Close;
end;

end.
