object frmPXML: TfrmPXML
  Left = 0
  Top = 0
  Caption = 'PXML'
  ClientHeight = 423
  ClientWidth = 469
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
  object pnlButtons: TPanel
    Left = 0
    Top = 390
    Width = 469
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 390
      Top = 4
      Width = 75
      Height = 25
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'btnCancel'
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      AlignWithMargins = True
      Left = 311
      Top = 4
      Width = 75
      Height = 25
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'btnOK'
      TabOrder = 1
      OnClick = btnOKClick
    end
  end
  object pnlTree: TPanel
    Left = 0
    Top = 0
    Width = 469
    Height = 390
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object vstPXML: TVirtualStringTree
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 461
      Height = 384
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 2
      Align = alClient
      Header.AutoSizeIndex = 0
      Header.DefaultHeight = 17
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.Options = [hoColumnResize, hoDblClickResize, hoDrag, hoVisible]
      Header.SortColumn = 0
      Header.Style = hsXPStyle
      LineStyle = lsSolid
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes]
      TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toFullVertGridLines]
      TreeOptions.SelectionOptions = [toFullRowSelect, toMultiSelect]
      OnGetText = vstPXMLGetText
      Columns = <
        item
          Options = [coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coVisible, coAllowFocus]
          Position = 0
          Width = 100
          WideText = 'Key'
        end
        item
          Options = [coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coVisible, coAllowFocus]
          Position = 1
          Width = 200
          WideText = 'Value'
        end
        item
          Options = [coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coVisible, coAllowFocus]
          Position = 2
          Width = 150
          WideText = 'Attributes'
        end>
    end
  end
end
