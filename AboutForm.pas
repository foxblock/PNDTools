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

unit AboutForm;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Classes, Controls, ExtCtrls, Forms,
  ComCtrls;

type
  TfrmAbout = class(TForm)
    pnlButtons: TPanel;
    btnOK: TButton;
    memAbout: TRichEdit;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.dfm}

procedure TfrmAbout.btnOKClick(Sender: TObject);
begin
    Close;
end;

end.
