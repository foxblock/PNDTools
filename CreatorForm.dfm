object frmCreator: TfrmCreator
  Left = 225
  Top = 265
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'PXML Creation Utility'
  ClientHeight = 542
  ClientWidth = 510
  Color = clBtnFace
  Constraints.MinHeight = 560
  Constraints.MinWidth = 526
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcMain: TPageControl
    Left = 0
    Top = 0
    Width = 510
    Height = 509
    Margins.Left = 5
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ActivePage = pgcMain5
    Align = alClient
    MultiLine = True
    Style = tsFlatButtons
    TabOrder = 0
    OnChange = pgcMainChange
    object pgcMain1: TTabSheet
      Caption = '1 - Hello...'
      ImageIndex = 4
      object memHello: TMemo
        AlignWithMargins = True
        Left = 4
        Top = 6
        Width = 494
        Height = 472
        Margins.Left = 4
        Margins.Top = 6
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        Enabled = False
        Lines.Strings = (
          'Hello and welcome to the PXML creation utility.'
          ''
          
            'This little program will guide you through the process of creati' +
            'ng a valid and functional PXML file for '
          'your PND-ready application.'
          
            'Only the most common use-cases are covered here (no multi-app PN' +
            'Ds for example), but you can '
          
            'manually adjust advanced settings afterwards using the full edit' +
            'or available from the main window.'
          ''
          
            'Start on the following tab and enter your personal information, ' +
            'after that continue filling out all fields '
          'until the last tab.'
          
            'Finally your data will be checked, any errors reported for you t' +
            'o fix and if  everything is valid you can '
          'create the final file.'
          ''
          
            'Fields marked as "optional" may be ignored, but filling them out' +
            ' still is highly recommended.'
          
            'Advanced settings can also be left out and should only be touche' +
            'd if you know what to put in there'
          '(and therefore are disabled by default).'
          
            'Some fields don'#39't accept every character, you may hear a beeping' +
            ' noise if you try to enter an'
          'invalid character.'
          ''
          
            'NOTE: You should have already added data files to the PND struct' +
            'ure (using the main window), if not '
          'please cancel this wizard and do so.'
          'You will need at least the following:'
          ' - an executable for your application'
          ' - an icon for the application/PND'
          ' - screenshots of your application'
          'An info or help file is not mandatory, but highly recommended.')
        ReadOnly = True
        TabOrder = 0
      end
    end
    object pgcMain2: TTabSheet
      Caption = '2 - Author...'
      object lblMail: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 113
        Width = 494
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
      object lblName: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 25
        Width = 494
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
        Left = 4
        Top = 69
        Width = 494
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
      object edtMail: TEdit
        AlignWithMargins = True
        Left = 4
        Top = 130
        Width = 494
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        TabOrder = 3
      end
      object edtName: TEdit
        AlignWithMargins = True
        Left = 4
        Top = 42
        Width = 494
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        TabOrder = 1
      end
      object edtWebsite: TEdit
        AlignWithMargins = True
        Left = 4
        Top = 86
        Width = 494
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        TabOrder = 2
      end
      object grbAppAuthor: TGroupBox
        AlignWithMargins = True
        Left = 4
        Top = 195
        Width = 494
        Height = 154
        Margins.Left = 4
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        TabOrder = 6
        object lblAppAuthor: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 15
          Width = 482
          Height = 13
          Margins.Left = 4
          Margins.Top = 0
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
          Top = 59
          Width = 482
          Height = 13
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Application Website (optional)'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 171
        end
        object lblAppMail: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 103
          Width = 482
          Height = 13
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 0
          Align = alTop
          Caption = 'App Author'#39's E-Mail (optional)'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 169
        end
        object edtAppAuthor: TEdit
          AlignWithMargins = True
          Left = 6
          Top = 32
          Width = 482
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Enabled = False
          TabOrder = 0
        end
        object edtAppWebsite: TEdit
          AlignWithMargins = True
          Left = 6
          Top = 76
          Width = 482
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Enabled = False
          TabOrder = 1
        end
        object edtAppMail: TEdit
          AlignWithMargins = True
          Left = 6
          Top = 120
          Width = 482
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Enabled = False
          TabOrder = 2
        end
      end
      object memAuthorHelp: TMemo
        AlignWithMargins = True
        Left = 4
        Top = 161
        Width = 494
        Height = 28
        Margins.Left = 4
        Margins.Top = 6
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        Enabled = False
        Lines.Strings = (
          
            'If you are not the original author of this application and porte' +
            'd it, tick the check-box and enter the '
          'details of the original author in the boxes below that.')
        ReadOnly = True
        TabOrder = 4
      end
      object cbxPort: TCheckBox
        AlignWithMargins = True
        Left = 18
        Top = 189
        Width = 97
        Height = 17
        Caption = 'This is a port'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = cbxPortClick
      end
      object memDetailsHelp: TMemo
        AlignWithMargins = True
        Left = 4
        Top = 6
        Width = 494
        Height = 13
        Margins.Left = 4
        Margins.Top = 6
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        Enabled = False
        Lines.Strings = (
          
            'Enter your details below (no matter whether you created or porte' +
            'd the application).')
        ReadOnly = True
        TabOrder = 0
      end
    end
    object pgcMain3: TTabSheet
      Caption = '3 - Application...'
      ImageIndex = 1
      DesignSize = (
        502
        478)
      object lblCategory: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 392
        Width = 494
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
        ExplicitWidth = 52
      end
      object lblDescription: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 46
        Width = 494
        Height = 13
        Margins.Left = 4
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Description (optional)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 123
      end
      object lblExe: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 165
        Width = 494
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
        ExplicitWidth = 62
      end
      object lblSubcategory: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 436
        Width = 494
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
        ExplicitWidth = 77
      end
      object lblTitle: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 2
        Width = 494
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
        ExplicitWidth = 25
      end
      object cobCategory: TComboBox
        AlignWithMargins = True
        Left = 4
        Top = 409
        Width = 494
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 7
        OnChange = cobCategoryChange
      end
      object cobSubcategory: TComboBox
        AlignWithMargins = True
        Left = 4
        Top = 453
        Width = 494
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 8
      end
      object edtTitle: TEdit
        AlignWithMargins = True
        Left = 4
        Top = 19
        Width = 494
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        TabOrder = 0
      end
      object memDescription: TMemo
        AlignWithMargins = True
        Left = 4
        Top = 78
        Width = 494
        Height = 81
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object pnlExe: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 182
        Width = 494
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 3
        object edtExe: TEdit
          Left = 0
          Top = 0
          Width = 473
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          TabOrder = 0
        end
        object btnExe: TButton
          Left = 473
          Top = 0
          Width = 21
          Height = 21
          Align = alRight
          Caption = '...'
          TabOrder = 1
          OnClick = btnExeClick
        end
      end
      object grbExeSettings: TGroupBox
        AlignWithMargins = True
        Left = 4
        Top = 211
        Width = 494
        Height = 109
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        TabOrder = 5
        object lblStartdir: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 61
          Width = 482
          Height = 13
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Starting Directory (optional)'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 161
        end
        object lblArguments: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 17
          Width = 482
          Height = 13
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Program Arguments (optional)'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 174
        end
        object edtArguments: TEdit
          AlignWithMargins = True
          Left = 6
          Top = 34
          Width = 482
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Enabled = False
          TabOrder = 0
        end
        object btnStartdir: TButton
          AlignWithMargins = True
          Left = 467
          Top = 78
          Width = 21
          Height = 21
          Margins.Left = 0
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 8
          Align = alRight
          Caption = '...'
          Enabled = False
          TabOrder = 2
          OnClick = btnStartdirClick
        end
        object edtStartdir: TEdit
          AlignWithMargins = True
          Left = 6
          Top = 78
          Width = 461
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 0
          Margins.Bottom = 8
          Align = alClient
          Enabled = False
          TabOrder = 1
        end
      end
      object cbxExeSettings: TCheckBox
        Left = 18
        Top = 205
        Width = 255
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'Advanced Executable Settings (optional)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = cbxExeSettingsClick
      end
      object grbVersion: TGroupBox
        AlignWithMargins = True
        Left = 4
        Top = 328
        Width = 494
        Height = 58
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        Caption = '   Version   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        object pnlVMajor: TPanel
          AlignWithMargins = True
          Left = 6
          Top = 17
          Width = 55
          Height = 35
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 27
          end
          object spbVMajor: TSpinButton
            Left = 40
            Top = 15
            Width = 15
            Height = 20
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
            OnDownClick = spbVMajorDownClick
            OnUpClick = spbVMajorUpClick
          end
          object edtVMajor: TEdit
            Left = 0
            Top = 15
            Width = 40
            Height = 20
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '1'
            ExplicitHeight = 21
          end
        end
        object pnlVMinor: TPanel
          AlignWithMargins = True
          Left = 65
          Top = 17
          Width = 55
          Height = 35
          Margins.Left = 0
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 26
          end
          object spbVMinor: TSpinButton
            Left = 40
            Top = 15
            Width = 15
            Height = 20
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
            OnDownClick = spbVMajorDownClick
            OnUpClick = spbVMajorUpClick
          end
          object edtVMinor: TEdit
            Left = 0
            Top = 15
            Width = 40
            Height = 20
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '0'
            ExplicitHeight = 21
          end
        end
        object pnlVRelease: TPanel
          AlignWithMargins = True
          Left = 124
          Top = 17
          Width = 55
          Height = 35
          Margins.Left = 0
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 38
          end
          object spbVRelease: TSpinButton
            Left = 40
            Top = 15
            Width = 15
            Height = 20
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
            OnDownClick = spbVMajorDownClick
            OnUpClick = spbVMajorUpClick
          end
          object edtVRelease: TEdit
            Left = 0
            Top = 15
            Width = 40
            Height = 20
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '0'
            ExplicitHeight = 21
          end
        end
        object pnlVBuild: TPanel
          AlignWithMargins = True
          Left = 183
          Top = 17
          Width = 55
          Height = 35
          Margins.Left = 0
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 3
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 22
          end
          object spbVBuild: TSpinButton
            Left = 40
            Top = 15
            Width = 15
            Height = 20
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
            OnDownClick = spbVMajorDownClick
            OnUpClick = spbVMajorUpClick
          end
          object edtVBuild: TEdit
            Left = 0
            Top = 15
            Width = 40
            Height = 20
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '0'
            ExplicitHeight = 21
          end
        end
        object pnlVType: TPanel
          AlignWithMargins = True
          Left = 242
          Top = 17
          Width = 65
          Height = 36
          Margins.Left = 0
          Margins.Top = 2
          Margins.Right = 0
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 4
          object lblVType: TLabel
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 65
            Height = 13
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 2
            Align = alTop
            Caption = 'Type (opt.)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 55
          end
          object cobVType: TComboBox
            AlignWithMargins = True
            Left = 0
            Top = 15
            Width = 65
            Height = 21
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
            Items.Strings = (
              ''
              'alpha'
              'beta'
              'release')
          end
        end
      end
      object memDescriptionHelp: TMemo
        AlignWithMargins = True
        Left = 4
        Top = 61
        Width = 494
        Height = 13
        Margins.Left = 4
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alTop
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        Enabled = False
        Lines.Strings = (
          
            'Short description of the application. You may use multiple lines' +
            ' if you really have to.')
        ReadOnly = True
        TabOrder = 1
      end
    end
    object pgcMain4: TTabSheet
      Caption = '4 - Images...'
      ImageIndex = 2
      object grbScreenshots: TGroupBox
        AlignWithMargins = True
        Left = 0
        Top = 105
        Width = 502
        Height = 373
        Margins.Left = 0
        Margins.Top = 4
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Caption = '   Screenshots (optional)   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object memScreenshotsHelp: TMemo
          AlignWithMargins = True
          Left = 6
          Top = 19
          Width = 490
          Height = 70
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 0
          Align = alTop
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clBtnFace
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            'Add screenshots at their original size, don'#39't add thumbnails!'
            
              'Try to supply images of different parts of the application, to g' +
              'et people interested (not just the title '
            'screen for example).'
            
              'Put the most representive screenshot at the top of the list, it ' +
              'will be displayed first (or only) by '
            'applications like PNDManager or PND repository websites.')
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object scbScreenshots: TScrollBox
          AlignWithMargins = True
          Left = 6
          Top = 113
          Width = 490
          Height = 254
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          HorzScrollBar.Visible = False
          VertScrollBar.Smooth = True
          VertScrollBar.Tracking = True
          Align = alClient
          TabOrder = 2
        end
        object pnlScreenButtons: TPanel
          Left = 2
          Top = 89
          Width = 498
          Height = 20
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object btnScreenAdd: TButton
            AlignWithMargins = True
            Left = 417
            Top = 0
            Width = 75
            Height = 20
            Margins.Left = 4
            Margins.Top = 0
            Margins.Right = 6
            Margins.Bottom = 0
            Align = alRight
            Caption = 'Add...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = btnScreenAddClick
          end
          object btnRemove: TButton
            AlignWithMargins = True
            Left = 334
            Top = 0
            Width = 75
            Height = 20
            Margins.Left = 4
            Margins.Top = 0
            Margins.Right = 4
            Margins.Bottom = 0
            Align = alRight
            Caption = 'Remove All'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnRemoveClick
          end
        end
      end
      object grbIcon: TGroupBox
        AlignWithMargins = True
        Left = 0
        Top = 4
        Width = 502
        Height = 93
        Margins.Left = 0
        Margins.Top = 4
        Margins.Right = 0
        Margins.Bottom = 4
        Align = alTop
        Caption = '   Icon (optional)   '
        DragMode = dmAutomatic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object imgIcon: TImage
          AlignWithMargins = True
          Left = 10
          Top = 19
          Width = 64
          Height = 64
          Margins.Left = 8
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 8
          Align = alLeft
          ExplicitLeft = 6
          ExplicitHeight = 68
        end
        object pnlIcon: TPanel
          AlignWithMargins = True
          Left = 78
          Top = 19
          Width = 418
          Height = 68
          Margins.Left = 0
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object lblIcon: TLabel
            AlignWithMargins = True
            Left = 4
            Top = 2
            Width = 410
            Height = 13
            Margins.Left = 4
            Margins.Top = 2
            Margins.Right = 4
            Margins.Bottom = 0
            Align = alTop
            Caption = 'File'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 19
          end
          object lblIconInfo: TLabel
            AlignWithMargins = True
            Left = 16
            Top = 44
            Width = 398
            Height = 13
            Margins.Left = 16
            Margins.Top = 0
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alTop
            Caption = 'Icon Info'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 44
          end
          object pnlIconPath: TPanel
            AlignWithMargins = True
            Left = 4
            Top = 19
            Width = 410
            Height = 21
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object edtIcon: TEdit
              Left = 0
              Top = 0
              Width = 389
              Height = 21
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = edtIconExit
            end
            object btnIcon: TButton
              AlignWithMargins = True
              Left = 389
              Top = 0
              Width = 21
              Height = 21
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alRight
              Caption = '...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = btnIconClick
            end
          end
        end
      end
    end
    object pgcMain5: TTabSheet
      Caption = '5 - Additional...'
      ImageIndex = 5
      object grbLicense: TGroupBox
        Left = 0
        Top = 178
        Width = 502
        Height = 237
        Align = alTop
        Caption = '   License   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object lblLicense: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 17
          Width = 490
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
          Width = 490
          Height = 13
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 0
          Align = alTop
          Caption = 'License description URL (optional)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 192
        end
        object lblSourceURL: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 105
          Width = 490
          Height = 13
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Source-code URL (optional)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 155
        end
        object edtLicenseURL: TEdit
          AlignWithMargins = True
          Left = 6
          Top = 78
          Width = 490
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edtSourceURL: TEdit
          AlignWithMargins = True
          Left = 6
          Top = 122
          Width = 490
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object memLicenseHelp: TMemo
          AlignWithMargins = True
          Left = 6
          Top = 149
          Width = 490
          Height = 82
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clBtnFace
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            'You may enter any license or choose one of the presets.'
            
              'If the game is not open-source, enter "none" as the name and lea' +
              've the other fields blank.'
            
              'Additionally for commercial applications do the same, but use "c' +
              'ommercial" as the name.'
            'Both URL-fields are optional, but recommended (if applicable).'
            
              'The Source-code URL should point to a VCS repo or a download lin' +
              'k of a zip for example.'
            
              'Consider packing your code into the PND, too - online hosting ma' +
              'y become unavailable.')
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object cobLicense: TComboBox
          AlignWithMargins = True
          Left = 6
          Top = 34
          Width = 490
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          OnChange = cobLicenseChange
        end
      end
      object grbInfo: TGroupBox
        Left = 0
        Top = 0
        Width = 502
        Height = 178
        Align = alTop
        Caption = '   Info (optional)   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object lblInfoFile: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 17
          Width = 490
          Height = 13
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 0
          Align = alTop
          Caption = 'File'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 19
        end
        object lblInfoName: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 61
          Width = 490
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
        object pnlFile: TPanel
          AlignWithMargins = True
          Left = 6
          Top = 34
          Width = 490
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object edtInfoFile: TEdit
            Left = 0
            Top = 0
            Width = 469
            Height = 21
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object btnInfoFile: TButton
            Left = 469
            Top = 0
            Width = 21
            Height = 21
            Align = alRight
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = btnInfoFileClick
          end
        end
        object edtInfoName: TEdit
          AlignWithMargins = True
          Left = 6
          Top = 78
          Width = 490
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object memInfo: TMemo
          AlignWithMargins = True
          Left = 6
          Top = 105
          Width = 490
          Height = 67
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clBtnFace
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            
              'This is the readme/documentation for your app, it can be a simpl' +
              'e text or a html file.'
            'It is entirely optional, but highly recommended.'
            
              'It will show up as the '#39'name'#39' from above in the '#39'documentation'#39' ' +
              'menu on the Pandora.'
            
              'Therefore don'#39't enter a generic name such as '#39'Readme'#39', rather in' +
              'clude the title of your app so it'#39's '
            
              'clear to which one it belongs ('#39'<yourapptitlehere> Readme'#39' works' +
              ' fine).')
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
      end
    end
    object pgcMain6: TTabSheet
      Caption = '6 - Finish...'
      ImageIndex = 5
      object lblErrors: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 266
        Width = 494
        Height = 13
        Margins.Left = 4
        Margins.Top = 10
        Margins.Right = 4
        Margins.Bottom = 6
        Align = alTop
        Caption = 'The following errors or warnings have occured:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 263
      end
      object redErrors: TRichEdit
        AlignWithMargins = True
        Left = 10
        Top = 285
        Width = 488
        Height = 189
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        Lines.Strings = (
          'All valid, good job!')
        ReadOnly = True
        TabOrder = 2
      end
      object grbAdvanced: TGroupBox
        Left = 0
        Top = 0
        Width = 502
        Height = 242
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Caption = '   Advanced (optional)   '
        Constraints.MaxHeight = 256
        Constraints.MinHeight = 18
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object lblID: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 60
          Width = 490
          Height = 13
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 0
          Align = alTop
          Caption = 'ID'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 13
        end
        object lblAppdata: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 163
          Width = 490
          Height = 13
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Appdata Folder (optional)'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 145
        end
        object edtID: TEdit
          AlignWithMargins = True
          Left = 6
          Top = 77
          Width = 490
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object memAdvancedHelp: TMemo
          AlignWithMargins = True
          Left = 6
          Top = 17
          Width = 490
          Height = 16
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 0
          Align = alTop
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clBtnFace
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            'Change these settings at you own risk.')
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object cbxAdvanced: TCheckBox
          AlignWithMargins = True
          Left = 6
          Top = 37
          Width = 490
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = 'I know what I am doing'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = cbxAdvancedClick
        end
        object memIDHelp: TMemo
          AlignWithMargins = True
          Left = 6
          Top = 104
          Width = 490
          Height = 57
          Margins.Left = 4
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 0
          Align = alTop
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clBtnFace
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            'This ID is the unique identifier for your PND.'
            
              'You should not change it between version changes as it determine' +
              's where your appdata goes.'
            
              'The utility creates one for you automatically, but you can set i' +
              't manually here, in case it looks not '
            'unique or somewhat hideous.')
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object edtAppdata: TEdit
          AlignWithMargins = True
          Left = 6
          Top = 180
          Width = 490
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object memAppdataHelp: TMemo
          AlignWithMargins = True
          Left = 6
          Top = 207
          Width = 490
          Height = 33
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            
              'Appdata for your game (savegames, temporary files, etc.) will be' +
              ' saved in this folder.'
            
              'It'#39's optional and if left blank the id will be used for the fold' +
              'er name')
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnlLine: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 254
        Width = 502
        Height = 2
        Margins.Left = 0
        Margins.Top = 12
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
      end
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 509
    Width = 510
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnNext: TButton
      AlignWithMargins = True
      Left = 348
      Top = 4
      Width = 75
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Next ->'
      TabOrder = 1
      OnClick = btnNextClick
    end
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 431
      Top = 4
      Width = 75
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = btnCancelClick
    end
    object btnPrev: TButton
      AlignWithMargins = True
      Left = 265
      Top = 4
      Width = 75
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = '<- Prevous'
      Enabled = False
      TabOrder = 0
      OnClick = btnPrevClick
    end
  end
  object opdIcon: TOpenDialog
    Filter = 
      'PNG-Image (*.png)|*.png|Image file (*.png;*.bmp;*.jpg;*.jpeg;*.g' +
      'if)|*.png;*.bmp;*.jpg;*.jpeg;*.gif|Any file|*'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Select icon for the PND'
    Left = 8
    Top = 512
  end
  object sadPXML: TSaveDialog
    FileName = 'PXML.xml'
    Filter = 'PXML file (*.xml)'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofCreatePrompt, ofEnableSizing]
    Title = 'Select a destination for the PXML file'
    Left = 40
    Top = 512
  end
end
