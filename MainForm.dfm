object frmMain: TfrmMain
  Left = 100
  Top = 100
  Caption = 'PNDTools'
  ClientHeight = 542
  ClientWidth = 584
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 450
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = menMain
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButtons: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 505
    Width = 576
    Height = 33
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitTop = 521
    ExplicitWidth = 633
    object btnCreate: TButton
      AlignWithMargins = True
      Left = 467
      Top = 4
      Width = 105
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Create PND...'
      TabOrder = 0
      OnClick = btnCreateClick
      ExplicitLeft = 524
    end
  end
  object grbLog: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 401
    Width = 576
    Height = 100
    Margins.Left = 4
    Margins.Top = 2
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Caption = '   Log (double-click to hide/expand)   '
    Constraints.MaxHeight = 100
    Constraints.MinHeight = 20
    TabOrder = 3
    OnDblClick = grbLogDblClick
    ExplicitTop = 417
    ExplicitWidth = 633
    object redLog: TRichEdit
      AlignWithMargins = True
      Left = 6
      Top = 15
      Width = 564
      Height = 79
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Lines.Strings = (
        'Welcome to the PNDTools'
        
          'To get started just drop some files in the top-most area to crea' +
          'te a new PND'
        'or load an existing PND via File -> Open PND...')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitWidth = 621
    end
  end
  object grbFiles: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 4
    Width = 576
    Height = 301
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Caption = '   Files (drag&&drop stuff here)   '
    TabOrder = 0
    ExplicitWidth = 633
    ExplicitHeight = 317
    object vstFiles: TVirtualStringTree
      AlignWithMargins = True
      Left = 6
      Top = 15
      Width = 564
      Height = 230
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alClient
      ClipboardFormats.Strings = (
        'Virtual Tree Data')
      DragMode = dmAutomatic
      Header.AutoSizeIndex = 0
      Header.DefaultHeight = 17
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.Options = [hoColumnResize, hoDblClickResize, hoDrag, hoShowSortGlyphs, hoVisible]
      Header.SortColumn = 0
      Header.Style = hsXPStyle
      Images = imlFileTree
      LineStyle = lsSolid
      TabOrder = 0
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes]
      TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toFullVertGridLines]
      TreeOptions.SelectionOptions = [toFullRowSelect, toMultiSelect]
      OnCompareNodes = vstFilesCompareNodes
      OnDragOver = vstFilesDragOver
      OnGetText = vstFilesGetText
      OnGetImageIndex = vstFilesGetImageIndex
      OnHeaderClick = vstFilesHeaderClick
      OnInitNode = vstFilesInitNode
      OnKeyDown = vstFilesKeyDown
      OnMouseUp = vstFilesMouseUp
      OnNodeMoving = vstFilesNodeMoving
      OnStructureChange = vstFilesStructureChange
      ExplicitWidth = 621
      ExplicitHeight = 246
      Columns = <
        item
          Position = 0
          Width = 300
          WideText = 'Filename'
        end
        item
          Position = 1
          Width = 70
          WideText = 'Size'
        end
        item
          Options = [coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coVisible, coAllowFocus]
          Position = 2
          Width = 150
          WideText = 'Source path'
        end>
    end
    object pnlFilesButtons: TPanel
      Left = 2
      Top = 266
      Width = 572
      Height = 33
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitTop = 282
      ExplicitWidth = 629
      object btnFilesClear: TButton
        AlignWithMargins = True
        Left = 493
        Top = 4
        Width = 75
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alRight
        Caption = 'Clear'
        TabOrder = 3
        OnClick = btnFilesClearClick
        ExplicitLeft = 550
      end
      object btnFilesFolder: TButton
        AlignWithMargins = True
        Left = 331
        Top = 4
        Width = 75
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 0
        Margins.Bottom = 4
        Align = alRight
        Caption = 'Add folder...'
        TabOrder = 1
        OnClick = btnFilesFolderClick
        ExplicitLeft = 388
      end
      object btnFilesFile: TButton
        AlignWithMargins = True
        Left = 252
        Top = 4
        Width = 75
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 0
        Margins.Bottom = 4
        Align = alRight
        Caption = 'Add file...'
        TabOrder = 0
        OnClick = btnFilesFileClick
        ExplicitLeft = 309
      end
      object cbxRecursive: TCheckBox
        AlignWithMargins = True
        Left = 410
        Top = 4
        Width = 79
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 0
        Margins.Bottom = 4
        Align = alRight
        Caption = 'Recursive'
        Checked = True
        State = cbChecked
        TabOrder = 2
        ExplicitLeft = 467
      end
    end
    object pnlFilesInfo: TPanel
      Left = 2
      Top = 245
      Width = 572
      Height = 21
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 261
      ExplicitWidth = 629
      object lblFilesSizeLbl: TLabel
        AlignWithMargins = True
        Left = 475
        Top = 4
        Width = 52
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 0
        Margins.Bottom = 4
        Align = alRight
        Alignment = taRightJustify
        Caption = 'Total size: '
        ExplicitLeft = 468
        ExplicitTop = 1
      end
      object lblFilesSize: TLabel
        AlignWithMargins = True
        Left = 531
        Top = 4
        Width = 31
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 10
        Margins.Bottom = 4
        Align = alRight
        Alignment = taRightJustify
        Caption = '0 Byte'
        ExplicitLeft = 588
      end
    end
  end
  object grbIcon: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 309
    Width = 576
    Height = 42
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Caption = '   Icon   '
    TabOrder = 1
    ExplicitTop = 325
    ExplicitWidth = 633
    object edtIcon: TEdit
      AlignWithMargins = True
      Left = 6
      Top = 15
      Width = 406
      Height = 21
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 463
    end
    object btnIconLoad: TButton
      AlignWithMargins = True
      Left = 416
      Top = 15
      Width = 75
      Height = 21
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Load icon...'
      TabOrder = 1
      OnClick = btnIconLoadClick
      ExplicitLeft = 473
    end
    object btnIconClear: TButton
      AlignWithMargins = True
      Left = 495
      Top = 15
      Width = 75
      Height = 21
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Clear'
      TabOrder = 2
      OnClick = btnIconClearClick
      ExplicitLeft = 552
    end
  end
  object grbPXML: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 355
    Width = 576
    Height = 42
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 4
    Margins.Bottom = 2
    Align = alBottom
    Caption = '   PXML   '
    TabOrder = 2
    ExplicitTop = 371
    ExplicitWidth = 633
    object btnPXMLLoad: TButton
      AlignWithMargins = True
      Left = 416
      Top = 15
      Width = 75
      Height = 21
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Load PXML...'
      TabOrder = 1
      OnClick = btnPXMLLoadClick
      ExplicitLeft = 473
    end
    object edtPXML: TEdit
      AlignWithMargins = True
      Left = 6
      Top = 15
      Width = 406
      Height = 21
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 463
    end
    object btnPXMLClear: TButton
      AlignWithMargins = True
      Left = 495
      Top = 15
      Width = 75
      Height = 21
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Clear'
      TabOrder = 2
      OnClick = btnPXMLClearClick
      ExplicitLeft = 552
    end
  end
  object imlFileTree: TImageList
    Left = 552
    Top = 64
  end
  object opdFileAny: TOpenDialog
    FileName = 'H:\Delphi Projekte\PNDTools\PNDTools.bdsproj'
    Filter = 'Any file|*'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Select file(s) to add to the PND'
    Left = 552
    Top = 32
  end
  object opdPXML: TOpenDialog
    DefaultExt = 'xml'
    Filter = 'PXML-file|PXML.xml|Any file|*'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Select PXML file'
    Left = 520
    Top = 32
  end
  object opdIcon: TOpenDialog
    Filter = 
      'PNG-Image (*.png)|*.png|Image file (*.png;*.bmp;*.jpg;*.jpeg;*.g' +
      'if)|*.png;*.bmp;*.jpg;*.jpeg;*.gif|Any file|*'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Select icon for the PND'
    Left = 488
    Top = 32
  end
  object sadPND: TSaveDialog
    Filter = 'PND files (*.pnd)|*.pnd'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofCreatePrompt, ofEnableSizing]
    Title = 'Destination for the PND file'
    Left = 424
    Top = 32
  end
  object opdPND: TOpenDialog
    Filter = 'PND file (*.pnd)|*.pnd|Any file|*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Select a PND file to open'
    Left = 456
    Top = 32
  end
  object menMain: TMainMenu
    Left = 520
    Top = 96
    object menMainFile: TMenuItem
      Caption = 'File'
      object menMainFileOpen: TMenuItem
        Caption = 'Open PND...'
        OnClick = menMainFileOpenClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object menMainFileOptions: TMenuItem
        Caption = 'Options...'
        OnClick = menMainFileOptionsClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object menMainFileExit: TMenuItem
        Caption = 'Exit'
        OnClick = menMainFileExitClick
      end
    end
    object menMainHelp: TMenuItem
      Caption = 'Help'
      object menMainHelpPXML: TMenuItem
        Caption = 'PXML specification (online)'
        OnClick = menMainHelpPXMLClick
      end
      object menMainHelpPND: TMenuItem
        Caption = 'PND quickstart (online)'
        OnClick = menMainHelpPNDClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object menMainHelpAbout: TMenuItem
        Caption = 'About'
        OnClick = menMainHelpAboutClick
      end
    end
  end
  object pomFiles: TPopupMenu
    AutoPopup = False
    Left = 552
    Top = 96
    object pomFilesOpen: TMenuItem
      Caption = 'Open'
      OnClick = pomFilesOpenClick
    end
  end
end
