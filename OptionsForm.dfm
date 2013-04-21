object frmOptions: TfrmOptions
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 493
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
    Height = 134
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 0
    Align = alTop
    Caption = '   General   '
    TabOrder = 0
    object lblMessage: TLabel
      Left = 6
      Top = 69
      Width = 285
      Height = 13
      Caption = 'Show messages of the following warning level (or higher)...'
    end
    object lblLog: TLabel
      Left = 22
      Top = 88
      Width = 60
      Height = 13
      Caption = '...in the log:'
    end
    object lblDialogue: TLabel
      Left = 22
      Top = 107
      Width = 112
      Height = 13
      Caption = '...as a popup dialogue:'
    end
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
    object cobLog: TComboBox
      Left = 140
      Top = 85
      Width = 119
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = 'Information'
      Items.Strings = (
        'Information'
        'Success'
        'Warning'
        'Error'
        'None')
    end
    object cobDialogue: TComboBox
      Left = 140
      Top = 104
      Width = 119
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 2
      TabOrder = 4
      Text = 'Error'
      Items.Strings = (
        'Success'
        'Warning'
        'Error'
        'None')
    end
  end
  object grbPaths: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 142
    Width = 502
    Height = 129
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
        Height = 18
        Margins.Left = 0
        Margins.Right = 11
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'mkSquash:'
        ExplicitHeight = 13
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
        Height = 18
        Margins.Left = 0
        Margins.Right = 12
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'unSquash:'
        ExplicitHeight = 13
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
        Height = 18
        Margins.Left = 0
        Margins.Right = 28
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'chmod:'
        ExplicitHeight = 13
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
      Top = 99
      Width = 490
      Height = 21
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      ExplicitTop = 78
      object lblSchema: TLabel
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 63
        Height = 18
        Margins.Left = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'XML Schema:'
        ExplicitHeight = 13
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
    object pnlProg7zip: TPanel
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
      TabOrder = 4
      ExplicitLeft = 8
      ExplicitTop = 89
      object lblProg7zip: TLabel
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 47
        Height = 18
        Margins.Left = 0
        Margins.Right = 16
        Margins.Bottom = 0
        Align = alLeft
        Caption = '7zip (iso):'
        ExplicitHeight = 13
      end
      object edtProg7zip: TEdit
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
        ExplicitLeft = 79
        ExplicitWidth = 386
      end
      object btnProg7zip: TButton
        Left = 469
        Top = 0
        Width = 21
        Height = 21
        Align = alRight
        Caption = '...'
        TabOrder = 1
        OnClick = btnProg7zipClick
      end
    end
  end
  object grbParams: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 275
    Width = 502
    Height = 182
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 0
    Align = alTop
    Caption = '   Parameters   '
    TabOrder = 2
    ExplicitTop = 277
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
        Height = 18
        Margins.Left = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'mkSquash:'
        ExplicitHeight = 13
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
        Height = 18
        Margins.Left = 0
        Margins.Right = 17
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'chmod:'
        ExplicitHeight = 13
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
        Height = 18
        Margins.Left = 0
        Margins.Right = 1
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'unSquash:'
        ExplicitHeight = 13
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
    object pnlParam7zip: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 152
      Width = 490
      Height = 21
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      ExplicitLeft = 4
      ExplicitTop = 155
      object lblParam7zip: TLabel
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 47
        Height = 18
        Margins.Left = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Align = alLeft
        Caption = '7zip (iso):'
        ExplicitHeight = 13
      end
      object edtParam7zip: TEdit
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
    Top = 464
    Width = 502
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitTop = 417
    object btnCancel: TButton
      Left = 427
      Top = 0
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'Cancel'
      TabOrder = 1
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
      TabOrder = 0
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
