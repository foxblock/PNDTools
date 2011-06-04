object frmMain: TfrmMain
  Left = 60
  Top = 42
  Caption = 'PNDTools'
  ClientHeight = 538
  ClientWidth = 641
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 450
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = menMain
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButtons: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 501
    Width = 633
    Height = 33
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnCreate: TButton
      AlignWithMargins = True
      Left = 524
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
    end
  end
  object grbLog: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 397
    Width = 633
    Height = 100
    Margins.Left = 4
    Margins.Top = 2
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Caption = '   Log (double-click to hide/expand)   '
    Constraints.MaxHeight = 100
    Constraints.MinHeight = 20
    TabOrder = 1
    OnDblClick = grbLogDblClick
    object redLog: TRichEdit
      AlignWithMargins = True
      Left = 6
      Top = 15
      Width = 621
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
    end
  end
  object grbFiles: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 4
    Width = 633
    Height = 297
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Caption = '   Files (drag&&drop stuff here)   '
    TabOrder = 2
    object vstFiles: TVirtualStringTree
      AlignWithMargins = True
      Left = 6
      Top = 15
      Width = 621
      Height = 226
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
      Top = 262
      Width = 629
      Height = 33
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object btnFilesClear: TButton
        AlignWithMargins = True
        Left = 550
        Top = 4
        Width = 75
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alRight
        Caption = 'Clear'
        TabOrder = 0
        OnClick = btnFilesClearClick
      end
      object btnFilesFolder: TButton
        AlignWithMargins = True
        Left = 388
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
      end
      object btnFilesFile: TButton
        AlignWithMargins = True
        Left = 309
        Top = 4
        Width = 75
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 0
        Margins.Bottom = 4
        Align = alRight
        Caption = 'Add file...'
        TabOrder = 2
        OnClick = btnFilesFileClick
      end
      object cbxRecursive: TCheckBox
        AlignWithMargins = True
        Left = 467
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
        TabOrder = 3
      end
    end
    object pnlFilesInfo: TPanel
      Left = 2
      Top = 241
      Width = 629
      Height = 21
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object lblFilesSizeLbl: TLabel
        AlignWithMargins = True
        Left = 532
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
        Left = 588
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
      end
    end
  end
  object grbIcon: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 305
    Width = 633
    Height = 42
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Caption = '   Icon   '
    TabOrder = 3
    object edtIcon: TEdit
      AlignWithMargins = True
      Left = 6
      Top = 15
      Width = 463
      Height = 21
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      TabOrder = 0
    end
    object btnIconLoad: TButton
      AlignWithMargins = True
      Left = 473
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
    end
    object btnIconClear: TButton
      AlignWithMargins = True
      Left = 552
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
    end
  end
  object grbPXML: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 351
    Width = 633
    Height = 42
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 4
    Margins.Bottom = 2
    Align = alBottom
    Caption = '   PXML   '
    TabOrder = 4
    object btnPXMLLoad: TButton
      AlignWithMargins = True
      Left = 473
      Top = 15
      Width = 75
      Height = 21
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Load PXML...'
      TabOrder = 0
      OnClick = btnPXMLLoadClick
    end
    object edtPXML: TEdit
      AlignWithMargins = True
      Left = 6
      Top = 15
      Width = 463
      Height = 21
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      TabOrder = 1
    end
    object btnPXMLClear: TButton
      AlignWithMargins = True
      Left = 552
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
