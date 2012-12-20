object frmCreator: TfrmCreator
  Left = 208
  Top = 284
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'PXML Creation Utility'
  ClientHeight = 572
  ClientWidth = 510
  Color = clBtnFace
  Constraints.MinHeight = 610
  Constraints.MinWidth = 526
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcMain: TPageControl
    Left = 0
    Top = 0
    Width = 510
    Height = 539
    Margins.Left = 5
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ActivePage = pgcMain1
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
          'advanced settings afterwards using the full editor.'
          ''
          
            'Start on the following tab and enter your personal information, ' +
            'after that continue filling out all fields '
          'until the last tab.'
          
            'Finally your data will be checked, any errors reported for you t' +
            'o fix and if  everything is valid you can '
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
        Top = 2
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
        Top = 46
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
        Top = 107
        Width = 494
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        TabOrder = 2
        Text = 'Your E-Mail address'
      end
      object edtName: TEdit
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
        Text = 'Your name'
      end
      object edtWebsite: TEdit
        AlignWithMargins = True
        Left = 4
        Top = 63
        Width = 494
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        TabOrder = 1
        Text = 'Your website'
      end
      object grbAppAuthor: TGroupBox
        AlignWithMargins = True
        Left = 4
        Top = 183
        Width = 494
        Height = 154
        Margins.Left = 4
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        TabOrder = 5
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
          Top = 103
          Width = 482
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
          Text = 'The application author'#39's name'
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
          Text = 'Website of the application'
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
          Text = 'Mail of the application'#39's author'
        end
      end
      object memAuthorHelp: TMemo
        AlignWithMargins = True
        Left = 4
        Top = 138
        Width = 494
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
        TabOrder = 3
      end
      object cbxPort: TCheckBox
        AlignWithMargins = True
        Left = 18
        Top = 178
        Width = 90
        Height = 17
        Caption = 'This is a port'
        TabOrder = 4
        OnClick = cbxPortClick
      end
    end
    object pgcMain3: TTabSheet
      Caption = '3 - Application...'
      ImageIndex = 1
      object lblCategory: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 422
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
        Top = 321
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
        Top = 466
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
        Top = 439
        Width = 494
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        ItemHeight = 13
        TabOrder = 4
        OnChange = cobCategoryChange
      end
      object cobSubcategory: TComboBox
        AlignWithMargins = True
        Left = 4
        Top = 483
        Width = 494
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        ItemHeight = 13
        TabOrder = 5
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
        Text = 'Application title'
      end
      object memDescription: TMemo
        AlignWithMargins = True
        Left = 4
        Top = 63
        Width = 494
        Height = 252
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Lines.Strings = (
          'Short description of the application'
          'Use multiple lines if you really have to')
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object pnlExe: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 338
        Width = 494
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
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
        end
      end
      object pnlVersion: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 365
        Width = 494
        Height = 51
        Margins.Left = 4
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 3
        object lblVersion: TLabel
          Left = 0
          Top = 0
          Width = 494
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
            OnDownClick = spbVMajorDownClick
            OnUpClick = spbVMajorUpClick
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
            OnDownClick = spbVMajorDownClick
            OnUpClick = spbVMajorUpClick
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
            OnDownClick = spbVMajorDownClick
            OnUpClick = spbVMajorUpClick
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
            OnDownClick = spbVMajorDownClick
            OnUpClick = spbVMajorUpClick
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
            ItemHeight = 13
            TabOrder = 0
            Text = 'release'
            Items.Strings = (
              'alpha'
              'beta'
              'release')
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
        Top = 105
        Width = 502
        Height = 403
        Margins.Left = 0
        Margins.Top = 4
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Caption = '   Screenshots   '
        TabOrder = 1
        object memScreenshots: TMemo
          AlignWithMargins = True
          Left = 6
          Top = 19
          Width = 490
          Height = 43
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
          Lines.Strings = (
            'Add screenshots at their original size, don'#39't add thumbnails!'
            
              'Try to supply shots of different parts of the application, to ge' +
              't people interested (not just the title '
            'screen for example).')
          ReadOnly = True
          TabOrder = 0
        end
        object scbScreenshots: TScrollBox
          AlignWithMargins = True
          Left = 6
          Top = 86
          Width = 490
          Height = 311
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          TabOrder = 1
        end
        object pnlScreenButtons: TPanel
          Left = 2
          Top = 62
          Width = 498
          Height = 20
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object Button1: TButton
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
            Caption = 'Remove'
            Enabled = False
            TabOrder = 0
          end
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
            TabOrder = 1
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
        Caption = '   Icon   '
        DragMode = dmAutomatic
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
          Picture.Data = {
            0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000004000
            00004008030000009DB781EC000000097048597300000B1300000B1301009A9C
            1800000A4F6943435050686F746F73686F70204943432070726F66696C650000
            78DA9D53675453E9163DF7DEF4424B8880944B6F5215082052428B801491262A
            2109104A8821A1D91551C1114545041BC8A088038E8E808C15512C0C8A0AD807
            E421A28E83A3888ACAFBE17BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C008
            0C9648335135800CA9421E11E083C7C4C6E1E42E40810A2470001008B3642173
            FD230100F87E3C3C2B22C007BE000178D30B0800C04D9BC0301C87FF0FEA4299
            5C01808401C07491384B08801400407A8E42A600404601809D98265300A00400
            60CB6362E300502D0060277FE6D300809DF8997B01005B94211501A091002013
            65884400683B00ACCF568A450058300014664BC43900D82D00304957664800B0
            B700C0CE100BB200080C00305188852900047B0060C8232378008499001446F2
            573CF12BAE10E72A00007899B23CB9243945815B082D710757572E1E28CE4917
            2B14366102619A402EC27999193281340FE0F3CC0000A0911511E083F3FD78CE
            0EAECECE368EB60E5F2DEABF06FF226262E3FEE5CFAB70400000E1747ED1FE2C
            2FB31A803B06806DFEA225EE04685E0BA075F78B66B20F40B500A0E9DA57F370
            F87E3C3C45A190B9D9D9E5E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E
            3CFCF7F5E0BEE22481325D814704F8E0C2CCF44CA51CCF92098462DCE68F47FC
            B70BFFFC1DD322C44962B9582A14E35112718E449A8CF332A52289429229C525
            D2FF64E2DF2CFB033EDF3500B06A3E017B912DA85D6303F64B27105874C0E2F7
            0000F2BB6FC1D4280803806883E1CF77FFEF3FFD47A02500806649927100005E
            44242E54CAB33FC708000044A0812AB0411BF4C1182CC0061CC105DCC10BFC60
            36844224C4C24210420A64801C726029AC82422886CDB01D2A602FD4401D34C0
            51688693700E2EC255B80E3D700FFA61089EC128BC81090441C808136121DA88
            01628A58238E08179985F821C14804128B2420C9881451224B91354831528A54
            2055481DF23D720239875C46BA913BC8003282FC86BC47319481B2513DD40CB5
            43B9A8371A8446A20BD06474319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA
            8F3E43C730C0E8180733C46C302EC6C342B1382C099363CBB122AC0CABC61AB0
            56AC03BB89F563CFB17704128145C0093604774220611E4148584C584ED848A8
            201C243411DA093709038451C2272293A84BB426BA11F9C4186232318758482C
            23D6128F132F107B8843C437241289433227B9900249B1A454D212D246D26E52
            23E92CA99B34481A2393C9DA646BB20739942C202BC885E49DE4C3E433E41BE4
            21F25B0A9D624071A4F853E22852CA6A4A19E510E534E5066598324155A39A52
            DDA8A15411358F5A42ADA1B652AF5187A81334759A39CD8316494BA5ADA295D3
            1A681768F769AFE874BA11DD951E4E97D057D2CBE947E897E803F4770C0D8615
            83C7886728199B18071867197718AF984CA619D38B19C754303731EB98E7990F
            996F55582AB62A7C1591CA0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB
            548FA95E537DAE46553353E3A909D496AB55AA9D50EB531B5367A93BA887AA67
            A86F543FA47E59FD890659C34CC34F43A451A0B15FE3BCC6200B6319B3782C21
            6B0DAB86758135C426B1CDD97C762ABB98FD1DBB8B3DAAA9A13943334A3357B3
            52F394663F07E39871F89C744E09E728A797F37E8ADE14EF29E2291BA6344CB9
            31655C6BAA96979658AB48AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C7
            4A275C2747678FCE059DE753D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB44
            77BF6EA7EE989EBE5E809E4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C58
            06B30C2406DB0CCE183CC535716F3C1D2FC7DBF151435DC34043A561956197E1
            8491B9D13CA3D5468D460F8C69C65CE324E36DC66DC6A326062621264B4DEA4D
            EE9A524DB9A629A63B4C3B4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79B
            DFB7605A785A2CB6A8B6B86549B2E45AA659EEB6BC6E855A3959A558555A5DB3
            46AD9DAD25D6BBADBBA711A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D8
            06DBAEB66DB67D6167621767B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB
            1D5A1D7E73B472143A563ADE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B6
            13CB29C4699D539BD347671767B97383F3888B894B82CB2E973E2E9B1BC6DDC8
            BDE44A74F5715DE17AD2F59D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F29
            9E593373D0C3C843E051E5D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F
            9157ADD7B0B7A577AAF761EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7
            C8B7CB4FC36F9E5F85DF437F23FF64FF7AFFD100A78025016703898141815B02
            FBF87A7C21BF8E3F3ADB65F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8
            EC90AD21F7E798CE91CE690E85507EE8D6D00761E6618BC37E0C278587855786
            3F8E7088581AD131973577D1DC4373DF44FA449644DE9B67314F39AF2D4A352A
            3EAA2E6A3CDA37BA34BA3FC62E6659CCD5589D58496C4B1C392E2AAE366E6CBE
            DFFCEDF387E29DE20BE37B17982FC85D7079A1CEC2F485A716A92E122C3A9640
            4C884E3894F041102AA8168C25F21377258E0A79C21DC267222FD136D188D843
            5C2A1E4EF2482A4D7A92EC91BC357924C533A52CE5B98427A990BC4C0D4CDD9B
            3A9E169A76206D323D3ABD31839291907142AA214D93B667EA67E66676CBAC65
            85B2FEC56E8BB72F1E9507C96BB390AC05592D0AB642A6E8545A28D72A07B267
            655766BFCD89CA3996AB9E2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5
            864B572D1D58E6BDAC6A39B23C7179DB0AE315052B865606AC3CB88AB62A6DD5
            4FABED5797AE7EBD267A4D6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED
            5D4F582F59DFB561FA869D1B3E15898AAE14DB1797157FD828DC78E51B876FCA
            BF99DC94B4A9ABC4B964CF66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB4
            0DDF56B4EDF5F645DB2F97CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54
            A454F454FA5436EED2DDB561D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BE
            DB5501554DD566D565FB49FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D2
            03FD07230EB6D7B9D4D51DD23D54528FD62BEB470EC71FBEFE9DEF772D0D360D
            558D9CC6E223704479E4E9F709DFF71E0D3ADA768C7BACE107D31F761D671D2F
            6A429AF29A469B539AFB5B625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C5979
            4AF354C969DAE982D39367F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A
            0F6FEFBA1074E1D245FF8BE73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F
            6DEA74EA3CFE93D34FC7BB9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDD
            F4BD79F116FFD6D59E393DDDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD977
            27EEADBC4FBC5FF440ED41D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47
            F7068583CFFE91F58F0F43058F998FCB860D86EB9E383E3939E23F72FDE9FCA7
            43CF64CF269E17FEA2FECBAE17162F7EF8D5EBD7CED198D1A197F29793BF6D7C
            A5FDEAC0EB19AFDBC6C2C61EBEC97833315EF456FBEDC177DC771DEFA3DF0F4F
            E47C207F28FF68F9B1F553D0A7FB93199393FF040398F3FC63332DDB00000300
            504C5445FFFFFFFDFDFDFCFCFCFBFBFBF9F9F9F8F8F8F6F6F6F5F5F5F0F0F0EF
            EFEFEEEEEEE8E8E8E7E7E7E6E6E6E3E3E3E2E2E2DEDEDEDDDDDDD6D6D6D5D5D5
            D4D4D4D3D3D3D0D0D0CFCFCFC7C7C7C6C6C6C0C0C0BFBFBFBEBEBEBABABAB9B9
            B9B8B8B8B6B6B6A9A9A9A7A7A7A6A6A6A4A4A4A3A3A3A2A2A2A1A1A1A0A0A000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000004DF464F6000002374944415478DAA5976B739A401486F7A02002091A
            114B6B9CD869FFFF0FCA4C9D1A3354B13554B9285EEA124D51779765F77C1067
            F57946983DEE7901154A35751D6AD13C43E4521D737748D3A8F839FC7F6BB69B
            357CF543442BDBC3AFBB6411DD0A9A5D031DE234DD6C77885EB5BAA6EB06A038
            48AE04CE83B289161BC4535ACBD2F68BA02850BC3B14065B2E1C57BD6BA3A5BF
            FF1040DFCCE621379E3F0D478D2687B3E0F3FD7A1A57E211327A8DE5EB49E038
            995F953F1A3C753ECF05FA40F1ABFDFED35D78FB718A050323F40578843C3B1E
            1F05E66336CE8404EA407D8900F5ADC5548847C87D584D401DC2886FFFDC9636
            3C8CA0DD3BDE88683D9ABFC0B37F07C2826E278427FD75292CB0FA290C1BA3B5
            B0A0315CC3B7FAF34E5850FBBE052F16D985E7B20D50C536D1B95420AD7E9D46
            A465CBFD71BB08E46F920C963B5B710A8806324F11100C149E26B831D078AAE0
            CA40E5E9820B039D67080A0606CF127C18583C5370323079B62037B0F912C1D1
            F0D662F26502D471823F484260B9A14DEE2C3E81D99BADC89DC527C03CAD3779
            04EF7C8901CA79B6013878A60178789601B8788601F878BA01283CE93F916800
            5E9E66903F58A48F36E9C355FA787FD2272B61011E30A4471CE9214B7ACC931E
            342546DDFA40C3A3AEF8B0FDA995FC941CF75F92BC99BA1DC1C0813740DE8D5F
            EEE4224F1EBA82BF95F8FB6E3174558F7D4EEB22F6E1E7D05636AB37E1E079AC
            A6DBAC107D93D975F445387C1B0ABE9686EF7D4C0ADFB854B3D9288DFFEBE422
            FEFF03A0E618B2C05CD10B0000000049454E44AE426082}
          Transparent = True
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
            Caption = 'Path'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 26
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
              Width = 385
              Height = 21
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alClient
              TabOrder = 0
              OnExit = edtIconExit
            end
            object btnIcon: TButton
              AlignWithMargins = True
              Left = 389
              Top = 0
              Width = 21
              Height = 21
              Margins.Left = 4
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alRight
              Caption = '...'
              TabOrder = 1
              OnClick = btnIconClick
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '5 - Additional...'
      ImageIndex = 5
      object grbLicense: TGroupBox
        Left = 0
        Top = 0
        Width = 502
        Height = 252
        Align = alTop
        Caption = '   License   '
        TabOrder = 0
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
          Width = 490
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
          Width = 490
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          TabOrder = 1
          Text = 'URL to a site describing the license'
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
          TabOrder = 2
          Text = 'URL to a repo or file containing the source'
        end
        object memLicenseHelp: TMemo
          AlignWithMargins = True
          Left = 6
          Top = 149
          Width = 490
          Height = 101
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
            
              'Consider packaging your code with the PND, too, in case online h' +
              'osting becomes unavailable at one '
            'point.')
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
          ItemHeight = 13
          TabOrder = 0
          OnChange = cobLicenseChange
        end
      end
      object grbAdvanced: TGroupBox
        AlignWithMargins = True
        Left = 0
        Top = 256
        Width = 502
        Height = 252
        Margins.Left = 0
        Margins.Top = 4
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Caption = '   Advanced   '
        Constraints.MaxHeight = 256
        Constraints.MinHeight = 18
        TabOrder = 1
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
          Caption = 'Appdata'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 48
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
          Lines.Strings = (
            'Change these settings at you own risk.')
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
          TabOrder = 1
          OnClick = cbxAdvancedClick
        end
        object memID: TMemo
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
          Lines.Strings = (
            'This ID is the unique identifier for your PND.'
            
              'You should not change it between version changes as it determine' +
              's where your appdata goes.'
            
              'The utility creates one for you automatically, but you can set i' +
              't manually here, in case it looks not '
            'unique or somewhat hideous.')
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
          TabOrder = 4
        end
        object Memo1: TMemo
          AlignWithMargins = True
          Left = 6
          Top = 207
          Width = 490
          Height = 43
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
            
              'This is the name of the folder the appdata for your game will be' +
              ' saved in (savegames, temporary '
            'files, etc.)'
            
              'It'#39's optional and if left blank the id will be used for the fold' +
              'er name')
          ReadOnly = True
          TabOrder = 5
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = '6 - Finish...'
      ImageIndex = 5
      object Label1: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 6
        Width = 494
        Height = 13
        Margins.Left = 4
        Margins.Top = 6
        Margins.Right = 4
        Margins.Bottom = 6
        Align = alTop
        Caption = 'The following errors or warnings have occured:'
        ExplicitWidth = 226
      end
      object redErrors: TRichEdit
        AlignWithMargins = True
        Left = 10
        Top = 25
        Width = 488
        Height = 479
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
        TabOrder = 0
      end
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 539
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
      TabOrder = 0
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
      TabOrder = 1
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
      TabOrder = 2
      OnClick = btnPrevClick
      ExplicitLeft = 348
    end
  end
  object opdIcon: TOpenDialog
    Filter = 
      'PNG-Image (*.png)|*.png|Image file (*.png;*.bmp;*.jpg;*.jpeg;*.g' +
      'if)|*.png;*.bmp;*.jpg;*.jpeg;*.gif|Any file|*'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Select icon for the PND'
    Top = 544
  end
end
