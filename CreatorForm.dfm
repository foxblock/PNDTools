object frmCreator: TfrmCreator
  Left = 704
  Top = 163
  BorderStyle = bsSingle
  Caption = 'frmCreator'
  ClientHeight = 428
  ClientWidth = 690
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object grbApp: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 4
    Width = 222
    Height = 420
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Caption = '   Application    '
    TabOrder = 0
    ExplicitWidth = 274
    ExplicitHeight = 445
    object lblTitle: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 17
      Width = 210
      Height = 13
      Margins.Left = 4
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Title'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 5
      ExplicitTop = 18
      ExplicitWidth = 25
    end
    object lblDescription: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 61
      Width = 210
      Height = 13
      Margins.Left = 4
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Description'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 64
    end
    object lblCategory: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 332
      Width = 210
      Height = 13
      Margins.Left = 4
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alBottom
      Caption = 'Category'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 8
      ExplicitTop = 311
      ExplicitWidth = 261
    end
    object lblSubcategory: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 376
      Width = 210
      Height = 13
      Margins.Left = 4
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alBottom
      Caption = 'Sub-category'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 12
      ExplicitTop = 359
      ExplicitWidth = 261
    end
    object lblExe: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 231
      Width = 210
      Height = 13
      Margins.Left = 4
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alBottom
      Caption = 'Executable'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitTop = 285
      ExplicitWidth = 62
    end
    object edtTitle: TEdit
      AlignWithMargins = True
      Left = 6
      Top = 34
      Width = 210
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      TabOrder = 0
      Text = 'Application title'
      ExplicitLeft = 16
      ExplicitTop = 48
      ExplicitWidth = 121
    end
    object memDescription: TMemo
      AlignWithMargins = True
      Left = 6
      Top = 78
      Width = 210
      Height = 147
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Lines.Strings = (
        'Short description of the application'
        'Use multiple lines if you must')
      ScrollBars = ssVertical
      TabOrder = 1
      ExplicitLeft = 8
      ExplicitTop = 160
      ExplicitWidth = 261
      ExplicitHeight = 74
    end
    object pnlVersion: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 275
      Width = 210
      Height = 51
      Margins.Left = 4
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 8
      ExplicitTop = 269
      ExplicitWidth = 261
      object lblVersion: TLabel
        Left = 0
        Top = 0
        Width = 210
        Height = 13
        Align = alTop
        Caption = 'Version'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 7
        ExplicitTop = -1
        ExplicitWidth = 261
      end
      object pnlVBuild: TPanel
        AlignWithMargins = True
        Left = 177
        Top = 15
        Width = 55
        Height = 36
        Margins.Left = 0
        Margins.Top = 2
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 167
        ExplicitTop = 13
        ExplicitHeight = 34
        object lblVBuild: TLabel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 55
          Height = 13
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 2
          Align = alTop
          Caption = 'Build'
          ExplicitWidth = 22
        end
        object spbVBuild: TSpinButton
          Left = 40
          Top = 15
          Width = 15
          Height = 21
          Align = alRight
          DownGlyph.Data = {
            0E010000424D0E01000000000000360000002800000009000000060000000100
            200000000000D800000000000000000000000000000000000000008080000080
            8000008080000080800000808000008080000080800000808000008080000080
            8000008080000080800000808000000000000080800000808000008080000080
            8000008080000080800000808000000000000000000000000000008080000080
            8000008080000080800000808000000000000000000000000000000000000000
            0000008080000080800000808000000000000000000000000000000000000000
            0000000000000000000000808000008080000080800000808000008080000080
            800000808000008080000080800000808000}
          TabOrder = 0
          UpGlyph.Data = {
            0E010000424D0E01000000000000360000002800000009000000060000000100
            200000000000D800000000000000000000000000000000000000008080000080
            8000008080000080800000808000008080000080800000808000008080000080
            8000000000000000000000000000000000000000000000000000000000000080
            8000008080000080800000000000000000000000000000000000000000000080
            8000008080000080800000808000008080000000000000000000000000000080
            8000008080000080800000808000008080000080800000808000000000000080
            8000008080000080800000808000008080000080800000808000008080000080
            800000808000008080000080800000808000}
          ExplicitLeft = 35
          ExplicitTop = 0
          ExplicitHeight = 66
        end
        object edtVBuild: TEdit
          Left = 0
          Top = 15
          Width = 40
          Height = 21
          Align = alClient
          TabOrder = 1
          Text = '0'
          ExplicitTop = 0
          ExplicitWidth = 35
        end
      end
      object pnlVRelease: TPanel
        AlignWithMargins = True
        Left = 118
        Top = 15
        Width = 55
        Height = 36
        Margins.Left = 0
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitTop = 13
        ExplicitHeight = 34
        object lblVRelease: TLabel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 55
          Height = 13
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 2
          Align = alTop
          Caption = 'Release'
          ExplicitLeft = 1
          ExplicitTop = 1
        end
        object spbVRelease: TSpinButton
          Left = 40
          Top = 15
          Width = 15
          Height = 21
          Align = alRight
          DownGlyph.Data = {
            0E010000424D0E01000000000000360000002800000009000000060000000100
            200000000000D800000000000000000000000000000000000000008080000080
            8000008080000080800000808000008080000080800000808000008080000080
            8000008080000080800000808000000000000080800000808000008080000080
            8000008080000080800000808000000000000000000000000000008080000080
            8000008080000080800000808000000000000000000000000000000000000000
            0000008080000080800000808000000000000000000000000000000000000000
            0000000000000000000000808000008080000080800000808000008080000080
            800000808000008080000080800000808000}
          TabOrder = 0
          UpGlyph.Data = {
            0E010000424D0E01000000000000360000002800000009000000060000000100
            200000000000D800000000000000000000000000000000000000008080000080
            8000008080000080800000808000008080000080800000808000008080000080
            8000000000000000000000000000000000000000000000000000000000000080
            8000008080000080800000000000000000000000000000000000000000000080
            8000008080000080800000808000008080000000000000000000000000000080
            8000008080000080800000808000008080000080800000808000000000000080
            8000008080000080800000808000008080000080800000808000008080000080
            800000808000008080000080800000808000}
          ExplicitLeft = 35
          ExplicitTop = 13
          ExplicitHeight = 53
        end
        object edtVRelease: TEdit
          Left = 0
          Top = 15
          Width = 40
          Height = 21
          Align = alClient
          TabOrder = 1
          Text = '0'
          ExplicitTop = 13
          ExplicitWidth = 35
        end
      end
      object pnlVMinor: TPanel
        AlignWithMargins = True
        Left = 59
        Top = 15
        Width = 55
        Height = 36
        Margins.Left = 0
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitTop = 13
        ExplicitHeight = 34
        object lblVMinor: TLabel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 55
          Height = 13
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 2
          Align = alTop
          Caption = 'Minor'
          ExplicitWidth = 26
        end
        object spbVMinor: TSpinButton
          Left = 40
          Top = 15
          Width = 15
          Height = 21
          Align = alRight
          DownGlyph.Data = {
            0E010000424D0E01000000000000360000002800000009000000060000000100
            200000000000D800000000000000000000000000000000000000008080000080
            8000008080000080800000808000008080000080800000808000008080000080
            8000008080000080800000808000000000000080800000808000008080000080
            8000008080000080800000808000000000000000000000000000008080000080
            8000008080000080800000808000000000000000000000000000000000000000
            0000008080000080800000808000000000000000000000000000000000000000
            0000000000000000000000808000008080000080800000808000008080000080
            800000808000008080000080800000808000}
          TabOrder = 0
          UpGlyph.Data = {
            0E010000424D0E01000000000000360000002800000009000000060000000100
            200000000000D800000000000000000000000000000000000000008080000080
            8000008080000080800000808000008080000080800000808000008080000080
            8000000000000000000000000000000000000000000000000000000000000080
            8000008080000080800000000000000000000000000000000000000000000080
            8000008080000080800000808000008080000000000000000000000000000080
            8000008080000080800000808000008080000080800000808000000000000080
            8000008080000080800000808000008080000080800000808000008080000080
            800000808000008080000080800000808000}
          ExplicitLeft = 35
          ExplicitTop = 13
          ExplicitHeight = 53
        end
        object edtVMinor: TEdit
          Left = 0
          Top = 15
          Width = 40
          Height = 21
          Align = alClient
          TabOrder = 1
          Text = '0'
          ExplicitTop = 13
          ExplicitWidth = 35
        end
      end
      object pnlVMajor: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 15
        Width = 55
        Height = 36
        Margins.Left = 0
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 3
        ExplicitTop = 13
        ExplicitHeight = 34
        object lblVMajor: TLabel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 55
          Height = 13
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 2
          Align = alTop
          Caption = 'Major'
          ExplicitWidth = 27
        end
        object spbVMajor: TSpinButton
          Left = 40
          Top = 15
          Width = 15
          Height = 21
          Align = alRight
          DownGlyph.Data = {
            0E010000424D0E01000000000000360000002800000009000000060000000100
            200000000000D800000000000000000000000000000000000000008080000080
            8000008080000080800000808000008080000080800000808000008080000080
            8000008080000080800000808000000000000080800000808000008080000080
            8000008080000080800000808000000000000000000000000000008080000080
            8000008080000080800000808000000000000000000000000000000000000000
            0000008080000080800000808000000000000000000000000000000000000000
            0000000000000000000000808000008080000080800000808000008080000080
            800000808000008080000080800000808000}
          TabOrder = 0
          UpGlyph.Data = {
            0E010000424D0E01000000000000360000002800000009000000060000000100
            200000000000D800000000000000000000000000000000000000008080000080
            8000008080000080800000808000008080000080800000808000008080000080
            8000000000000000000000000000000000000000000000000000000000000080
            8000008080000080800000000000000000000000000000000000000000000080
            8000008080000080800000808000008080000000000000000000000000000080
            8000008080000080800000808000008080000080800000808000000000000080
            8000008080000080800000808000008080000080800000808000008080000080
            800000808000008080000080800000808000}
          ExplicitLeft = 35
          ExplicitTop = 13
          ExplicitHeight = 53
        end
        object edtVMajor: TEdit
          Left = 0
          Top = 15
          Width = 40
          Height = 21
          Align = alClient
          TabOrder = 1
          Text = '1'
          ExplicitTop = 13
          ExplicitWidth = 35
        end
      end
    end
    object cobCategory: TComboBox
      AlignWithMargins = True
      Left = 6
      Top = 349
      Width = 210
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      ItemHeight = 13
      TabOrder = 3
      ExplicitLeft = 8
      ExplicitTop = 323
      ExplicitWidth = 261
    end
    object cobSubcategory: TComboBox
      AlignWithMargins = True
      Left = 6
      Top = 393
      Width = 210
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      ItemHeight = 13
      TabOrder = 4
      ExplicitLeft = 112
      ExplicitTop = 400
      ExplicitWidth = 145
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 248
      Width = 210
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 5
      ExplicitTop = 273
      ExplicitWidth = 234
      object edtExe: TEdit
        Left = 0
        Top = 0
        Width = 189
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 56
        ExplicitTop = 296
        ExplicitWidth = 121
      end
      object btnExe: TButton
        Left = 189
        Top = 0
        Width = 21
        Height = 21
        Align = alRight
        Caption = '...'
        TabOrder = 1
        ExplicitLeft = 213
      end
    end
  end
  object pnlRight: TPanel
    AlignWithMargins = True
    Left = 464
    Top = 4
    Width = 222
    Height = 420
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 407
    ExplicitHeight = 445
    object grbLicense: TGroupBox
      Left = 0
      Top = 0
      Width = 222
      Height = 233
      Align = alTop
      Caption = '   License   '
      TabOrder = 0
      object lblLicense: TLabel
        AlignWithMargins = True
        Left = 6
        Top = 17
        Width = 210
        Height = 13
        Margins.Left = 4
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alTop
        Caption = 'License name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 77
      end
      object lblLicenseURL: TLabel
        AlignWithMargins = True
        Left = 6
        Top = 61
        Width = 210
        Height = 13
        Margins.Left = 4
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alTop
        Caption = 'License description URL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 133
      end
      object lblSourceURL: TLabel
        AlignWithMargins = True
        Left = 6
        Top = 105
        Width = 210
        Height = 13
        Margins.Left = 4
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Source-code URL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 96
      end
      object edtLicenseURL: TEdit
        AlignWithMargins = True
        Left = 6
        Top = 78
        Width = 210
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        TabOrder = 0
        Text = 'URL to a site describing the license'
        ExplicitLeft = 56
        ExplicitTop = 120
        ExplicitWidth = 121
      end
      object edtSourceURL: TEdit
        AlignWithMargins = True
        Left = 6
        Top = 122
        Width = 210
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        TabOrder = 1
        Text = 'URL to a repo or file containing the source'
        ExplicitLeft = 8
        ExplicitWidth = 173
      end
      object memLicenseHelp: TMemo
        AlignWithMargins = True
        Left = 6
        Top = 149
        Width = 210
        Height = 82
        Margins.Left = 4
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        Enabled = False
        Lines.Strings = (
          'You may enter any license or choose one of '
          'the presets.'
          'If the game is not open-source, enter '
          '"none" or "other".'
          'Both URL-fields are optional, but '
          'recommended (if applicable).')
        ReadOnly = True
        TabOrder = 2
        ExplicitHeight = 74
      end
      object cbxLicense: TComboBox
        AlignWithMargins = True
        Left = 6
        Top = 34
        Width = 210
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        ItemHeight = 13
        TabOrder = 3
        ExplicitLeft = 7
        ExplicitTop = 29
        ExplicitWidth = 175
      end
    end
    object grbAdvanced: TGroupBox
      AlignWithMargins = True
      Left = 0
      Top = 237
      Width = 222
      Height = 148
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 0
      Margins.Bottom = 4
      Align = alClient
      Caption = '   Optional   '
      TabOrder = 1
      ExplicitLeft = 496
      ExplicitTop = 80
      ExplicitWidth = 185
      ExplicitHeight = 105
      object lblID: TLabel
        AlignWithMargins = True
        Left = 6
        Top = 60
        Width = 210
        Height = 13
        Margins.Left = 4
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alBottom
        Caption = 'ID'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 5
        ExplicitTop = 82
        ExplicitWidth = 13
      end
      object lblVType: TLabel
        AlignWithMargins = True
        Left = 6
        Top = 104
        Width = 210
        Height = 13
        Margins.Left = 4
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alBottom
        Caption = 'Release type'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 5
        ExplicitTop = 128
        ExplicitWidth = 74
      end
      object edtID: TEdit
        AlignWithMargins = True
        Left = 6
        Top = 77
        Width = 210
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        Enabled = False
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 82
        ExplicitWidth = 212
      end
      object cbxVType: TComboBox
        AlignWithMargins = True
        Left = 6
        Top = 121
        Width = 210
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        Enabled = False
        ItemHeight = 13
        TabOrder = 1
        Text = 'release'
        Items.Strings = (
          'alpha'
          'beta'
          'release')
        ExplicitLeft = 3
        ExplicitTop = 149
        ExplicitWidth = 212
      end
      object memAdvancedHelp: TMemo
        AlignWithMargins = True
        Left = 6
        Top = 17
        Width = 210
        Height = 16
        Margins.Left = 4
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        Enabled = False
        Lines.Strings = (
          'Advanced settings - change at own risk.')
        ReadOnly = True
        TabOrder = 2
        ExplicitHeight = 62
      end
      object cbxAdvanced: TCheckBox
        AlignWithMargins = True
        Left = 6
        Top = 37
        Width = 210
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        Caption = 'I know what I am doing'
        TabOrder = 3
        ExplicitLeft = 32
        ExplicitTop = 80
        ExplicitWidth = 97
      end
    end
    object pnlButtons: TPanel
      Left = 0
      Top = 389
      Width = 222
      Height = 31
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitTop = 442
      ExplicitWidth = 185
      object Button1: TButton
        AlignWithMargins = True
        Left = 63
        Top = 3
        Width = 75
        Height = 25
        Align = alRight
        Caption = 'OK'
        TabOrder = 0
        ExplicitLeft = 32
        ExplicitTop = 6
      end
      object Button2: TButton
        AlignWithMargins = True
        Left = 144
        Top = 3
        Width = 75
        Height = 25
        Align = alRight
        Caption = 'Cancel'
        TabOrder = 1
        ExplicitLeft = 113
        ExplicitTop = 6
      end
    end
  end
  object grbAuthor: TGroupBox
    AlignWithMargins = True
    Left = 234
    Top = 4
    Width = 222
    Height = 420
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alRight
    Caption = '   Author    '
    TabOrder = 2
    ExplicitLeft = 288
    ExplicitTop = 3
    ExplicitHeight = 473
    object lblName: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 17
      Width = 210
      Height = 13
      Margins.Left = 4
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 32
    end
    object lblWebsite: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 61
      Width = 210
      Height = 13
      Margins.Left = 4
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Website (optional)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 105
    end
    object lblMail: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 105
      Width = 210
      Height = 13
      Margins.Left = 4
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      Caption = 'E-Mail (optional)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 93
    end
    object edtName: TEdit
      AlignWithMargins = True
      Left = 6
      Top = 34
      Width = 210
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      TabOrder = 0
      Text = 'Your name'
      ExplicitLeft = 64
      ExplicitTop = 80
      ExplicitWidth = 121
    end
    object edtWebsite: TEdit
      AlignWithMargins = True
      Left = 6
      Top = 78
      Width = 210
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      TabOrder = 1
      Text = 'Your website'
      ExplicitLeft = 7
      ExplicitTop = 64
      ExplicitWidth = 212
    end
    object edtMail: TEdit
      AlignWithMargins = True
      Left = 6
      Top = 122
      Width = 210
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      TabOrder = 2
      Text = 'Your E-Mail address'
      ExplicitLeft = 72
      ExplicitTop = 160
      ExplicitWidth = 121
    end
    object grbAppAuthor: TGroupBox
      AlignWithMargins = True
      Left = 6
      Top = 149
      Width = 210
      Height = 156
      Margins.Left = 4
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Enabled = False
      TabOrder = 3
      object lblAppAuthor: TLabel
        AlignWithMargins = True
        Left = 6
        Top = 19
        Width = 198
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Application Author'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 105
      end
      object lblAppWebsite: TLabel
        AlignWithMargins = True
        Left = 6
        Top = 63
        Width = 198
        Height = 13
        Margins.Left = 4
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Website (optional)'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 105
      end
      object lblAppMail: TLabel
        AlignWithMargins = True
        Left = 6
        Top = 107
        Width = 198
        Height = 13
        Margins.Left = 4
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alTop
        Caption = 'E-Mail (optional)'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 93
      end
      object cbxPort: TCheckBox
        AlignWithMargins = True
        Left = 8
        Top = 0
        Width = 82
        Height = 17
        Caption = 'This is a port'
        TabOrder = 0
      end
      object edtAppAuthor: TEdit
        AlignWithMargins = True
        Left = 6
        Top = 36
        Width = 198
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Enabled = False
        TabOrder = 1
        Text = 'The application author'#39's name'
        ExplicitLeft = 48
        ExplicitTop = 64
        ExplicitWidth = 121
      end
      object edtAppWebsite: TEdit
        AlignWithMargins = True
        Left = 6
        Top = 80
        Width = 198
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Enabled = False
        TabOrder = 2
        Text = 'Website of the application'
        ExplicitLeft = 32
        ExplicitTop = 104
        ExplicitWidth = 121
      end
      object edtAppMail: TEdit
        AlignWithMargins = True
        Left = 6
        Top = 124
        Width = 198
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Enabled = False
        TabOrder = 3
        Text = 'Mail of the application'#39's author'
        ExplicitLeft = 40
        ExplicitTop = 136
        ExplicitWidth = 121
      end
    end
    object memAuthorHelp: TMemo
      AlignWithMargins = True
      Left = 6
      Top = 311
      Width = 210
      Height = 107
      Margins.Left = 4
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      Enabled = False
      Lines.Strings = (
        'If you are not the original author of this '
        'application and ported it, tick the check-'
        'box and enter the details of the original '
        'author in the boxes below that.'
        'If you are the original author, just ignore '
        'those fields.')
      ReadOnly = True
      TabOrder = 4
      ExplicitLeft = 12
      ExplicitTop = 366
      ExplicitHeight = 66
    end
  end
end
