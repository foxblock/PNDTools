object frm_easyprofile: Tfrm_easyprofile
  Left = 208
  Top = 284
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Easy profile creator'
  ClientHeight = 480
  ClientWidth = 511
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object pgcMain: TPageControl
    Left = 0
    Top = 0
    Width = 511
    Height = 449
    Margins.Left = 5
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ActivePage = TabSheet2
    Align = alClient
    MultiLine = True
    Style = tsFlatButtons
    TabOrder = 0
    object pgcMain1: TTabSheet
      Caption = '1 - Hello...'
      ImageIndex = 4
      object memHello: TMemo
        AlignWithMargins = True
        Left = 4
        Top = 6
        Width = 495
        Height = 139
        Margins.Left = 4
        Margins.Top = 6
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alTop
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        Enabled = False
        Lines.Strings = (
          'Hello and welcome to the PXML creation utility.'
          
            'This little program will guide you through the process of creati' +
            'on a valid and functional PXML file for '
          'your PND-ready application.'
          
            'Only basic use-cases are covered here (no multi-app PNDs for exa' +
            'mple), but you can manually adjust '
          'advanced settings after this process using the full editor.'
          ''
          
            'Start on the following tab and enter your personal information, ' +
            'after that continue filling all the fields '
          'until the last tab.'
          
            'On that your data will be checked, any errors reported for you t' +
            'o fix and when all is valid you can '
          'create the final file.')
        ReadOnly = True
        TabOrder = 0
      end
    end
    object pgcMain2: TTabSheet
      Caption = '2 - Author...'
      object lblMail: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 90
        Width = 495
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
        Top = 2
        Width = 495
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
        Top = 46
        Width = 495
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
        Top = 107
        Width = 495
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        TabOrder = 0
        Text = 'Your E-Mail address'
      end
      object edtName: TEdit
        AlignWithMargins = True
        Left = 4
        Top = 19
        Width = 495
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        TabOrder = 1
        Text = 'Your name'
      end
      object edtWebsite: TEdit
        AlignWithMargins = True
        Left = 4
        Top = 63
        Width = 495
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        TabOrder = 2
        Text = 'Your website'
      end
      object grbAppAuthor: TGroupBox
        AlignWithMargins = True
        Left = 4
        Top = 183
        Width = 495
        Height = 154
        Margins.Left = 4
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        TabOrder = 3
        object lblAppAuthor: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 15
          Width = 483
          Height = 13
          Margins.Left = 4
          Margins.Top = 0
          Margins.Right = 4
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Application Author'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitTop = 19
          ExplicitWidth = 105
        end
        object lblAppWebsite: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 59
          Width = 483
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
          ExplicitTop = 63
          ExplicitWidth = 105
        end
        object lblAppMail: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 103
          Width = 483
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
          ExplicitTop = 107
          ExplicitWidth = 93
        end
        object edtAppAuthor: TEdit
          AlignWithMargins = True
          Left = 6
          Top = 32
          Width = 483
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          TabOrder = 0
          Text = 'The application author'#39's name'
          ExplicitTop = 36
        end
        object edtAppWebsite: TEdit
          AlignWithMargins = True
          Left = 6
          Top = 76
          Width = 483
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Enabled = False
          TabOrder = 1
          Text = 'Website of the application'
          ExplicitTop = 80
        end
        object edtAppMail: TEdit
          AlignWithMargins = True
          Left = 6
          Top = 120
          Width = 483
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Enabled = False
          TabOrder = 2
          Text = 'Mail of the application'#39's author'
          ExplicitTop = 124
        end
      end
      object memAuthorHelp: TMemo
        AlignWithMargins = True
        Left = 4
        Top = 138
        Width = 495
        Height = 43
        Margins.Left = 4
        Margins.Top = 6
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alTop
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        Enabled = False
        Lines.Strings = (
          
            'If you are not the original author of this application and porte' +
            'd it, tick the check-box and enter the '
          'details of the original author in the boxes below that.'
          'If you are the original author, just ignore those fields.')
        ReadOnly = True
        TabOrder = 4
        ExplicitTop = 134
      end
      object cbxPort: TCheckBox
        AlignWithMargins = True
        Left = 18
        Top = 178
        Width = 90
        Height = 17
        Caption = 'This is a port'
        TabOrder = 5
        OnClick = cbxPortClick
      end
    end
    object pgcMain3: TTabSheet
      Caption = '3 - Application...'
      ImageIndex = 1
      object lblCategory: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 332
        Width = 495
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
        Width = 495
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
      object lblExe: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 231
        Width = 495
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
        Top = 376
        Width = 495
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
        Width = 495
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
        Top = 349
        Width = 495
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        ItemHeight = 13
        TabOrder = 0
      end
      object cobSubcategory: TComboBox
        AlignWithMargins = True
        Left = 4
        Top = 393
        Width = 495
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        ItemHeight = 13
        TabOrder = 1
      end
      object edtTitle: TEdit
        AlignWithMargins = True
        Left = 4
        Top = 19
        Width = 495
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        TabOrder = 2
        Text = 'Application title'
      end
      object memDescription: TMemo
        AlignWithMargins = True
        Left = 4
        Top = 63
        Width = 495
        Height = 162
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Lines.Strings = (
          'Short description of the application'
          'Use multiple lines if you must')
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object pnlExe: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 248
        Width = 495
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 4
        object edtExe: TEdit
          Left = 0
          Top = 0
          Width = 474
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          TabOrder = 0
        end
        object btnExe: TButton
          Left = 474
          Top = 0
          Width = 21
          Height = 21
          Align = alRight
          Caption = '...'
          TabOrder = 1
        end
      end
      object pnlVersion: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 275
        Width = 495
        Height = 51
        Margins.Left = 4
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 5
        object lblVersion: TLabel
          Left = 0
          Top = 0
          Width = 495
          Height = 13
          Align = alTop
          Caption = 'Version'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 42
        end
        object pnlVBuild: TPanel
          AlignWithMargins = True
          Left = 177
          Top = 15
          Width = 55
          Height = 36
          Margins.Left = 0
          Margins.Top = 2
          Margins.Right = 4
          Margins.Bottom = 0
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
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
            ExplicitLeft = -55
            ExplicitTop = 16
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
          end
          object edtVBuild: TEdit
            Left = 0
            Top = 15
            Width = 40
            Height = 21
            Align = alClient
            TabOrder = 1
            Text = '0'
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
            ExplicitWidth = 38
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
          end
          object edtVRelease: TEdit
            Left = 0
            Top = 15
            Width = 40
            Height = 21
            Align = alClient
            TabOrder = 1
            Text = '0'
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
          end
          object edtVMinor: TEdit
            Left = 0
            Top = 15
            Width = 40
            Height = 21
            Align = alClient
            TabOrder = 1
            Text = '0'
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
          end
          object edtVMajor: TEdit
            Left = 0
            Top = 15
            Width = 40
            Height = 21
            Align = alClient
            TabOrder = 1
            Text = '1'
          end
        end
        object pnlVType: TPanel
          AlignWithMargins = True
          Left = 236
          Top = 15
          Width = 65
          Height = 36
          Margins.Left = 0
          Margins.Top = 2
          Margins.Right = 0
          Margins.Bottom = 0
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
            Caption = 'Type'
            ExplicitWidth = 24
          end
          object cbxVType: TComboBox
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
            Enabled = False
            ItemHeight = 13
            TabOrder = 0
            Text = 'release'
            Items.Strings = (
              'alpha'
              'beta'
              'release')
            ExplicitLeft = -6
            ExplicitWidth = 61
          end
        end
      end
    end
    object pgcMain4: TTabSheet
      Caption = '4 - Images...'
      ImageIndex = 2
      object grbScreenshots: TGroupBox
        AlignWithMargins = True
        Left = 0
        Top = 121
        Width = 503
        Height = 293
        Margins.Left = 0
        Margins.Top = 4
        Margins.Right = 0
        Margins.Bottom = 4
        Align = alClient
        Caption = '   Screenshots   '
        TabOrder = 0
        ExplicitTop = 264
        ExplicitHeight = 150
      end
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 0
        Top = 4
        Width = 503
        Height = 109
        Margins.Left = 0
        Margins.Top = 4
        Margins.Right = 0
        Margins.Bottom = 4
        Align = alTop
        Caption = '   Icon   '
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = '5 - Additional...'
      ImageIndex = 5
      object grbLicense: TGroupBox
        Left = 0
        Top = 0
        Width = 503
        Height = 260
        Align = alClient
        Caption = '   License   '
        TabOrder = 0
        ExplicitHeight = 210
        object lblLicense: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 17
          Width = 491
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
          Width = 491
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
          Width = 491
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
          Width = 491
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          TabOrder = 0
          Text = 'URL to a site describing the license'
        end
        object edtSourceURL: TEdit
          AlignWithMargins = True
          Left = 6
          Top = 122
          Width = 491
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          TabOrder = 1
          Text = 'URL to a repo or file containing the source'
        end
        object memLicenseHelp: TMemo
          AlignWithMargins = True
          Left = 6
          Top = 149
          Width = 491
          Height = 109
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
            'You may enter any license or choose one of the presets.'
            
              'If the game is not open-source, enter "none" or "other" as the n' +
              'ame and leave the other fields '
            'blank.'
            
              'Additionally for commercial applications enter "commercial" as t' +
              'he name.'
            'Both URL-fields are optional, but recommended (if applicable).'
            ''
            
              'Consider packaging your code with the PND, too, in case online h' +
              'osting becomes unavailable at one '
            'point.')
          ReadOnly = True
          TabOrder = 2
          ExplicitHeight = 59
        end
        object cbxLicense: TComboBox
          AlignWithMargins = True
          Left = 6
          Top = 34
          Width = 491
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          ItemHeight = 13
          TabOrder = 3
        end
      end
      object grbAdvanced: TGroupBox
        AlignWithMargins = True
        Left = 0
        Top = 264
        Width = 503
        Height = 150
        Margins.Left = 0
        Margins.Top = 4
        Margins.Right = 0
        Margins.Bottom = 4
        Align = alBottom
        Caption = '   Advanced   '
        TabOrder = 1
        object lblID: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 60
          Width = 491
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
        object edtID: TEdit
          AlignWithMargins = True
          Left = 6
          Top = 77
          Width = 491
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Enabled = False
          TabOrder = 0
        end
        object memAdvancedHelp: TMemo
          AlignWithMargins = True
          Left = 6
          Top = 17
          Width = 491
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
          Lines.Strings = (
            'Advanced settings - change at own risk.')
          ReadOnly = True
          TabOrder = 1
        end
        object cbxAdvanced: TCheckBox
          AlignWithMargins = True
          Left = 6
          Top = 37
          Width = 491
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = 'I know what I am doing'
          TabOrder = 2
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = '6 - Finish...'
      ImageIndex = 5
      ExplicitLeft = 5
      ExplicitTop = 25
      object Label1: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 6
        Width = 495
        Height = 13
        Margins.Left = 4
        Margins.Top = 6
        Margins.Right = 4
        Margins.Bottom = 6
        Align = alTop
        Caption = 'The following errors or warnings have occured:'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 226
      end
      object redErrors: TRichEdit
        AlignWithMargins = True
        Left = 10
        Top = 25
        Width = 489
        Height = 89
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        Lines.Strings = (
          'All valid, good job!')
        TabOrder = 0
        ExplicitLeft = 64
        ExplicitTop = 104
        ExplicitWidth = 185
      end
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 449
    Width = 511
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      AlignWithMargins = True
      Left = 352
      Top = 3
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'OK'
      TabOrder = 0
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 433
      Top = 3
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
