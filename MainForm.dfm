object frmMain: TfrmMain
  Left = 100
  Top = 100
  Caption = 'PNDTools'
  ClientHeight = 578
  ClientWidth = 524
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
    Top = 541
    Width = 516
    Height = 33
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitTop = 573
    ExplicitWidth = 553
    object btnCreate: TButton
      AlignWithMargins = True
      Left = 407
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
      ExplicitLeft = 444
    end
  end
  object grbLog: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 437
    Width = 516
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
    ExplicitTop = 469
    ExplicitWidth = 553
    object redLog: TRichEdit
      AlignWithMargins = True
      Left = 6
      Top = 15
      Width = 504
      Height = 79
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      HideSelection = False
      Lines.Strings = (
        'Welcome to the PNDTools'
        
          'To get started just drop some files in the top-most area to crea' +
          'te a new PND'
        'or load an existing PND via File -> Open PND...')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitWidth = 541
    end
  end
  object grbFiles: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 4
    Width = 516
    Height = 337
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Caption = '   Files (drag&&drop stuff here)   '
    TabOrder = 0
    ExplicitWidth = 553
    ExplicitHeight = 369
    object vstFiles: TVirtualStringTree
      AlignWithMargins = True
      Left = 6
      Top = 15
      Width = 504
      Height = 266
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
      ExplicitWidth = 541
      ExplicitHeight = 298
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
      Top = 302
      Width = 512
      Height = 33
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitTop = 334
      ExplicitWidth = 549
      object btnFilesClear: TButton
        AlignWithMargins = True
        Left = 433
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
        ExplicitLeft = 470
      end
      object btnFilesFolder: TButton
        AlignWithMargins = True
        Left = 271
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
        ExplicitLeft = 308
      end
      object btnFilesFile: TButton
        AlignWithMargins = True
        Left = 192
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
        ExplicitLeft = 229
      end
      object cbxRecursive: TCheckBox
        AlignWithMargins = True
        Left = 350
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
        ExplicitLeft = 387
      end
    end
    object pnlFilesInfo: TPanel
      Left = 2
      Top = 281
      Width = 512
      Height = 21
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 313
      ExplicitWidth = 549
      object lblFilesSizeLbl: TLabel
        AlignWithMargins = True
        Left = 415
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
        Left = 471
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
    Top = 345
    Width = 516
    Height = 42
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Caption = '   Icon   '
    TabOrder = 1
    ExplicitTop = 377
    ExplicitWidth = 553
    object edtIcon: TEdit
      AlignWithMargins = True
      Left = 6
      Top = 15
      Width = 346
      Height = 21
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 383
    end
    object btnIconLoad: TButton
      AlignWithMargins = True
      Left = 356
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
      ExplicitLeft = 393
    end
    object btnIconClear: TButton
      AlignWithMargins = True
      Left = 435
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
      ExplicitLeft = 472
    end
  end
  object grbPXML: TGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 391
    Width = 516
    Height = 42
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 4
    Margins.Bottom = 2
    Align = alBottom
    Caption = '   PXML   '
    TabOrder = 2
    ExplicitTop = 423
    ExplicitWidth = 553
    object btnPXMLLoad: TButton
      AlignWithMargins = True
      Left = 277
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
      ExplicitLeft = 314
    end
    object edtPXML: TEdit
      AlignWithMargins = True
      Left = 6
      Top = 15
      Width = 267
      Height = 21
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      TabOrder = 0
      OnChange = edtPXMLChange
      ExplicitWidth = 304
    end
    object btnPXMLClear: TButton
      AlignWithMargins = True
      Left = 435
      Top = 15
      Width = 75
      Height = 21
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Clear'
      TabOrder = 3
      OnClick = btnPXMLClearClick
      ExplicitLeft = 472
    end
    object btnPXMLEdit: TButton
      AlignWithMargins = True
      Left = 356
      Top = 15
      Width = 75
      Height = 21
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Create PXML'
      TabOrder = 2
      OnClick = btnPXMLEditClick
      ExplicitLeft = 393
    end
  end
  object imlFileTree: TImageList
    Left = 272
    Top = 80
  end
  object opdFileAny: TOpenDialog
    FileName = 'H:\Delphi Projekte\PNDTools\PNDTools.bdsproj'
    Filter = 'Any file|*'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Select file(s) to add to the PND'
    Left = 272
    Top = 48
  end
  object opdPXML: TOpenDialog
    DefaultExt = 'xml'
    Filter = 'PXML-file|PXML.xml;pxml.xml|Any file|*'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Select PXML file'
    Left = 240
    Top = 48
  end
  object opdIcon: TOpenDialog
    Filter = 
      'PNG-Image (*.png)|*.png|Image file (*.png;*.bmp;*.jpg;*.jpeg;*.g' +
      'if)|*.png;*.bmp;*.jpg;*.jpeg;*.gif|Any file|*'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Select icon for the PND'
    Left = 208
    Top = 48
  end
  object sadPND: TSaveDialog
    Filter = 'PND files (*.pnd)|*.pnd'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofCreatePrompt, ofEnableSizing]
    Title = 'Select a destination for the PND file'
    Left = 144
    Top = 48
  end
  object opdPND: TOpenDialog
    Filter = 'PND file (*.pnd)|*.pnd|Any file|*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Select a PND file to open'
    Left = 176
    Top = 48
  end
  object menMain: TMainMenu
    Left = 240
    Top = 112
    object menMainFile: TMenuItem
      Caption = 'File'
      object menMainFileNew: TMenuItem
        Caption = 'New'
        OnClick = menMainFileNewClick
      end
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
      object menMainHelpThread: TMenuItem
        Caption = 'Website (online)'
        OnClick = menMainHelpThreadClick
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
    Left = 272
    Top = 112
    object pomFilesOpen: TMenuItem
      Caption = 'Open'
      OnClick = pomFilesOpenClick
    end
    object pomFilesFolder: TMenuItem
      Caption = 'Open containing folder'
      OnClick = pomFilesFolderClick
    end
    object pomFilesDelete: TMenuItem
      Caption = 'Delete'
      OnClick = pomFilesDeleteClick
    end
  end
end
