object frmFileConflict: TfrmFileConflict
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'File conflict'
  ClientHeight = 292
  ClientWidth = 375
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
  object lblTitle: TLabel
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 363
    Height = 18
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 4
    Margins.Bottom = 0
    Align = alTop
    Caption = 'A file of the same name is already present'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 278
  end
  object lblSubtitle: TLabel
    AlignWithMargins = True
    Left = 8
    Top = 30
    Width = 363
    Height = 13
    Margins.Left = 8
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Caption = 'Please select an action to solve this conflict'
    ExplicitWidth = 207
  end
  object pnlNew: TPanel
    AlignWithMargins = True
    Left = 8
    Top = 51
    Width = 359
    Height = 84
    Margins.Left = 8
    Margins.Top = 4
    Margins.Right = 8
    Margins.Bottom = 4
    Align = alTop
    ParentBackground = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = pnlNewClick
    object lblNewCaption: TLabel
      AlignWithMargins = True
      Left = 9
      Top = 9
      Width = 345
      Height = 18
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Replace with new file:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 138
    end
    object imgNew: TImage
      AlignWithMargins = True
      Left = 17
      Top = 31
      Width = 40
      Height = 40
      Margins.Left = 16
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 12
      Align = alLeft
      Stretch = True
      Transparent = True
    end
    object pnlDataNew: TPanel
      AlignWithMargins = True
      Left = 121
      Top = 31
      Width = 229
      Height = 52
      Margins.Left = 8
      Margins.Top = 4
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object lblChangedNew: TLabel
        Left = 0
        Top = 26
        Width = 229
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = '2013-04-05 00:40'
        ExplicitWidth = 87
      end
      object lblSizeNew: TLabel
        Left = 0
        Top = 13
        Width = 229
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = '1042 KB'
        ExplicitWidth = 39
      end
      object lblPathNew: TLabel
        Left = 0
        Top = 0
        Width = 229
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = 'C:\Some\Path\To\file.ext'
        ExplicitWidth = 121
      end
    end
    object pnlLabelsNew: TPanel
      AlignWithMargins = True
      Left = 61
      Top = 31
      Width = 52
      Height = 52
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object lblSizeNewLabel: TLabel
        Left = 0
        Top = 13
        Width = 52
        Height = 13
        Align = alTop
        Alignment = taRightJustify
        Caption = 'Size:'
        ExplicitLeft = 29
        ExplicitWidth = 23
      end
      object lblChangedNewLabel: TLabel
        Left = 0
        Top = 26
        Width = 52
        Height = 13
        Align = alTop
        Alignment = taRightJustify
        Caption = 'Changed:'
        ExplicitLeft = 5
        ExplicitWidth = 47
      end
      object lblPathNewLabel: TLabel
        Left = 0
        Top = 0
        Width = 52
        Height = 13
        Align = alTop
        Alignment = taRightJustify
        Caption = 'Path:'
        ExplicitLeft = 26
        ExplicitWidth = 26
      end
    end
  end
  object pnlButtons: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 263
    Width = 367
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object btnCancel: TButton
      Left = 292
      Top = 0
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
    end
  end
  object pnlOld: TPanel
    AlignWithMargins = True
    Left = 8
    Top = 143
    Width = 359
    Height = 84
    Margins.Left = 8
    Margins.Top = 4
    Margins.Right = 8
    Margins.Bottom = 4
    Align = alTop
    ParentBackground = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = pnlOldClick
    object lblOldCaption: TLabel
      AlignWithMargins = True
      Left = 9
      Top = 9
      Width = 345
      Height = 18
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Keep old file:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 83
    end
    object imgOld: TImage
      AlignWithMargins = True
      Left = 17
      Top = 31
      Width = 40
      Height = 40
      Margins.Left = 16
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 12
      Align = alLeft
      Stretch = True
      Transparent = True
    end
    object pnlLabelOld: TPanel
      AlignWithMargins = True
      Left = 61
      Top = 31
      Width = 52
      Height = 52
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object lblSizeOldLabel: TLabel
        Left = 0
        Top = 13
        Width = 52
        Height = 13
        Align = alTop
        Alignment = taRightJustify
        Caption = 'Size:'
        ExplicitLeft = 29
        ExplicitWidth = 23
      end
      object lblChangedOldLabel: TLabel
        Left = 0
        Top = 26
        Width = 52
        Height = 13
        Align = alTop
        Alignment = taRightJustify
        Caption = 'Changed:'
        ExplicitLeft = 5
        ExplicitWidth = 47
      end
      object lblPathOldLabel: TLabel
        Left = 0
        Top = 0
        Width = 52
        Height = 13
        Align = alTop
        Alignment = taRightJustify
        Caption = 'Path:'
        ExplicitLeft = 26
        ExplicitWidth = 26
      end
    end
    object pnlDataOld: TPanel
      AlignWithMargins = True
      Left = 121
      Top = 31
      Width = 229
      Height = 52
      Margins.Left = 8
      Margins.Top = 4
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object lblChangedOld: TLabel
        Left = 0
        Top = 26
        Width = 229
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = '2013-04-05 00:40'
        ExplicitWidth = 87
      end
      object lblSizeOld: TLabel
        Left = 0
        Top = 13
        Width = 229
        Height = 13
        Align = alTop
        Caption = '1042 KB'
        ExplicitWidth = 39
      end
      object lblPathOld: TLabel
        Left = 0
        Top = 0
        Width = 229
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = 'C:\Some\Path\To\file.ext'
        ExplicitWidth = 121
      end
    end
  end
  object cbxRemember: TCheckBox
    AlignWithMargins = True
    Left = 12
    Top = 235
    Width = 355
    Height = 17
    Margins.Left = 12
    Margins.Top = 4
    Margins.Right = 8
    Margins.Bottom = 4
    Align = alTop
    Caption = 'Remember action for future conflics in this operation'
    TabOrder = 2
  end
end
