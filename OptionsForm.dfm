object frmOptions: TfrmOptions
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Options'
  ClientHeight = 384
  ClientWidth = 510
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grbGeneral: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 4
    Width = 502
    Height = 74
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 0
    Align = alTop
    Caption = '   General   '
    TabOrder = 0
    object cbxSmartAdd: TCheckBox
      AlignWithMargins = True
      Left = 6
      Top = 15
      Width = 490
      Height = 17
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      Caption = 
        'Smart file adding (detects PND, PXML and Icon files and asks for' +
        ' action)'
      TabOrder = 0
    end
    object cbxIcons: TCheckBox
      AlignWithMargins = True
      Left = 6
      Top = 32
      Width = 490
      Height = 17
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Show file icons (slow)'
      TabOrder = 1
    end
    object cbxBinary: TCheckBox
      AlignWithMargins = True
      Left = 6
      Top = 49
      Width = 490
      Height = 17
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Use binary file size units'
      TabOrder = 2
    end
  end
  object grbPaths: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 82
    Width = 502
    Height = 107
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 0
    Align = alTop
    Caption = '   Paths   '
    TabOrder = 1
    object pnlProgMkSquash: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 15
      Width = 490
      Height = 21
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblProgMkSquash: TLabel
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 52
        Height = 13
        Margins.Left = 0
        Margins.Right = 11
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'mkSquash:'
      end
      object edtProgMkSquash: TEdit
        AlignWithMargins = True
        Left = 67
        Top = 0
        Width = 398
        Height = 21
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alClient
        TabOrder = 0
        Text = 'edtProgMkSquash'
      end
      object btnMkSquash: TButton
        Left = 469
        Top = 0
        Width = 21
        Height = 21
        Align = alRight
        Caption = '...'
        TabOrder = 1
        OnClick = btnMkSquashClick
      end
    end
    object pnlProgUnSquash: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 36
      Width = 490
      Height = 21
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lblProgUnSquash: TLabel
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 51
        Height = 13
        Margins.Left = 0
        Margins.Right = 12
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'unSquash:'
      end
      object edtProgUnSquash: TEdit
        AlignWithMargins = True
        Left = 67
        Top = 0
        Width = 398
        Height = 21
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alClient
        TabOrder = 0
        Text = 'edtMkSquash'
      end
      object btnUnSquash: TButton
        Left = 469
        Top = 0
        Width = 21
        Height = 21
        Align = alRight
        Caption = '...'
        TabOrder = 1
        OnClick = btnUnSquashClick
      end
    end
    object pnlProgChmod: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 57
      Width = 490
      Height = 21
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object lblProgChmod: TLabel
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 35
        Height = 13
        Margins.Left = 0
        Margins.Right = 28
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'chmod:'
      end
      object edtProgChmod: TEdit
        AlignWithMargins = True
        Left = 67
        Top = 0
        Width = 398
        Height = 21
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alClient
        TabOrder = 0
        Text = 'edtMkSquash'
      end
      object btnChmod: TButton
        Left = 469
        Top = 0
        Width = 21
        Height = 21
        Align = alRight
        Caption = '...'
        TabOrder = 1
        OnClick = btnChmodClick
      end
    end
    object pnlSchema: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 78
      Width = 490
      Height = 21
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object lblSchema: TLabel
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 63
        Height = 13
        Margins.Left = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'XML Schema:'
      end
      object edtSchema: TEdit
        AlignWithMargins = True
        Left = 67
        Top = 0
        Width = 398
        Height = 21
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alClient
        TabOrder = 0
        Text = 'edtMkSquash'
      end
      object btnSchema: TButton
        Left = 469
        Top = 0
        Width = 21
        Height = 21
        Align = alRight
        Caption = '...'
        TabOrder = 1
        OnClick = btnSchemaClick
      end
    end
  end
  object grbParams: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 193
    Width = 502
    Height = 158
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 0
    Align = alTop
    Caption = '   Params   '
    TabOrder = 2
    object memParams: TMemo
      AlignWithMargins = True
      Left = 6
      Top = 15
      Width = 490
      Height = 66
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      Enabled = False
      Lines.Strings = (
        
          'You can customize the parameters with which the above programs a' +
          're called here.'
        ''
        'The following variables are supported:'
        
          '%source% - Source element (source folder for mkSquash or chmod -' +
          ' source file for unSquash)'
        
          '%target% - Target element (target PND file for mkSquash - target' +
          ' folder for unSquash)')
      ReadOnly = True
      TabOrder = 0
    end
    object pnlParamMkSquash: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 89
      Width = 490
      Height = 21
      Margins.Left = 4
      Margins.Top = 8
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lblParamMkSquash: TLabel
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 52
        Height = 13
        Margins.Left = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'mkSquash:'
      end
      object edtParamMkSquash: TEdit
        AlignWithMargins = True
        Left = 56
        Top = 0
        Width = 434
        Height = 21
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        TabOrder = 0
        Text = 'edtParamMkSquash'
      end
    end
    object pnlParamChmod: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 131
      Width = 490
      Height = 21
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object lblParamChmod: TLabel
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 35
        Height = 13
        Margins.Left = 0
        Margins.Right = 17
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'chmod:'
      end
      object edtParamChmod: TEdit
        AlignWithMargins = True
        Left = 56
        Top = 0
        Width = 434
        Height = 21
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        TabOrder = 0
        Text = 'edtParamMkSquash'
      end
    end
    object pnlParamUnSquash: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 110
      Width = 490
      Height = 21
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object lblParamUnSquash: TLabel
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 51
        Height = 13
        Margins.Left = 0
        Margins.Right = 1
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'unSquash:'
      end
      object edtParamUnSquash: TEdit
        AlignWithMargins = True
        Left = 56
        Top = 0
        Width = 434
        Height = 21
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        TabOrder = 0
        Text = 'edtParamMkSquash'
      end
    end
  end
  object pnlButtons: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 355
    Width = 502
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object btnCancel: TButton
      Left = 427
      Top = 0
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      AlignWithMargins = True
      Left = 348
      Top = 0
      Width = 75
      Height = 25
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      Caption = 'OK'
      TabOrder = 1
      OnClick = btnOKClick
    end
  end
  object opdExeFile: TOpenDialog
    Filter = 'Executable files (*.exe;*.bat)|*.exe;*.bat|Any file|*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 456
    Top = 16
  end
  object opdSchema: TOpenDialog
    Filter = 'XML file (*.xml)|*.xml|Any file|*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 424
    Top = 16
  end
end
