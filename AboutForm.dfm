object frmAbout: TfrmAbout
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 271
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButtons: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 242
    Width = 451
    Height = 25
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnOK: TButton
      Left = 376
      Top = 0
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'Ok, cool'
      TabOrder = 0
      OnClick = btnOKClick
    end
  end
  object memAbout: TRichEdit
    AlignWithMargins = True
    Left = 4
    Top = 4
    Width = 451
    Height = 234
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Lines.Strings = (
      'PNDTools'
      '[Version Information filled in by frmMain]'
      ''
      'a program to create and extract PND files for Windows'
      'Copyright 2011-2013 Janek Sch'#228'fer (foxblock)'
      'Licensed under the GPLv3'
      '---'
      'Technology used:'
      ''
      'SquashFS under the GPL'
      '   http://sourceforge.net/projects/squashfs/'
      'SquashFStools for Windows (cygwin) patch by'
      
        '   http://fragilematter.blogspot.de/2010/02/squashfs-tools-40-wi' +
        'ndows-binaries.html'
      
        '   http://domoticx.com/bestandssysteem-squashfs-tools-linux/ (4.' +
        '3 version)'
      'Cygwin packages under the GPL'
      '   http://www.cygwin.com/'
      '7zip command line utility under the LGPL'
      '   http://www.7-zip.org/'
      'VirtualTreeview Delphi component under the MPL'
      
        '   http://www.lischke-online.de/index.php/controls/virtual-treev' +
        'iew'
      'GraphicsEX Delphi library under the MPL'
      '   http://www.lischke-online.de/index.php/libs/graphicex-library'
      ''
      'Thanks!'
      '---'
      'More info, discussion and bug reports:'
      '   http://boards.openpandora.org/index.php?/topic/3756-pndtools/'
      'Source Code:'
      '   https://github.com/foxblock/PNDTools')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
