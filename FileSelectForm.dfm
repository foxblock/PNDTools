object frmFileSelect: TfrmFileSelect
  Left = 0
  Top = 0
  Caption = 'frmFileSelect'
  ClientHeight = 344
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object vstFiles: TVirtualStringTree
    AlignWithMargins = True
    Left = 4
    Top = 4
    Width = 350
    Height = 307
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    ClipboardFormats.Strings = (
      'Virtual Tree Data')
    Header.AutoSizeIndex = 0
    Header.DefaultHeight = 17
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.Options = [hoAutoResize, hoColumnResize, hoDblClickResize, hoShowSortGlyphs, hoVisible]
    Header.SortColumn = 0
    Header.Style = hsXPStyle
    Images = frmMain.imlFileTree
    LineStyle = lsSolid
    TabOrder = 0
    TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes]
    TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toFullVertGridLines]
    TreeOptions.SelectionOptions = [toFullRowSelect]
    OnCompareNodes = vstFilesCompareNodes
    OnGetText = vstFilesGetText
    OnGetImageIndex = vstFilesGetImageIndex
    OnHeaderClick = vstFilesHeaderClick
    OnInitNode = vstFilesInitNode
    ExplicitLeft = -1
    Columns = <
      item
        Options = [coAllowClick, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus]
        Position = 0
        Width = 346
        WideText = 'Filename'
      end>
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 315
    Width = 358
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 454
    ExplicitWidth = 644
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 279
      Top = 0
      Width = 75
      Height = 25
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
      ExplicitLeft = 384
      ExplicitTop = 24
    end
    object btnOK: TButton
      AlignWithMargins = True
      Left = 200
      Top = 0
      Width = 75
      Height = 25
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 4
      Align = alRight
      Caption = 'OK'
      TabOrder = 1
      OnClick = btnOKClick
      ExplicitLeft = 384
      ExplicitTop = 24
    end
  end
end
