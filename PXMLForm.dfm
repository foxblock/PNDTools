object frmPXML: TfrmPXML
  Left = 0
  Top = 0
  Caption = 'PXML'
  ClientHeight = 412
  ClientWidth = 453
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sptHor: TSplitter
    Left = 158
    Top = 0
    Height = 379
    ResizeStyle = rsUpdate
    ExplicitLeft = 319
    ExplicitTop = 8
    ExplicitHeight = 434
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 379
    Width = 453
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 374
      Top = 4
      Width = 75
      Height = 25
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      AlignWithMargins = True
      Left = 295
      Top = 4
      Width = 75
      Height = 25
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'OK'
      TabOrder = 1
      OnClick = btnOKClick
    end
  end
  object pnlTree: TPanel
    Left = 0
    Top = 0
    Width = 158
    Height = 379
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 2
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object vstPXML: TVirtualStringTree
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 150
      Height = 373
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
      Header.Options = [hoAutoResize, hoColumnResize, hoDrag]
      Header.SortColumn = 0
      Header.Style = hsXPStyle
      LineStyle = lsSolid
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes]
      TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toFullVertGridLines]
      TreeOptions.SelectionOptions = [toFullRowSelect]
      OnChange = vstPXMLChange
      OnGetText = vstPXMLGetText
      OnInitNode = vstPXMLInitNode
      Columns = <
        item
          Options = [coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coVisible, coAllowFocus]
          Position = 0
          Width = 146
          WideText = 'Key'
        end>
    end
  end
  object pnlData: TPanel
    Left = 161
    Top = 0
    Width = 292
    Height = 379
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object scbValues: TScrollBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 284
      Height = 373
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 2
      HorzScrollBar.Visible = False
      VertScrollBar.Smooth = True
      VertScrollBar.Tracking = True
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 0
      object lblValue: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 274
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 39
      end
      object lblAttr: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 74
        Width = 274
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Attributes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 69
      end
      object lblDescription: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 118
        Width = 274
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 79
      end
      object lblNoValue: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 28
        Width = 274
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'no value for this element'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        ParentFont = False
        ExplicitWidth = 119
      end
      object lblNoAttr: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 99
        Width = 274
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'no attributes for this element'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        ParentFont = False
        ExplicitWidth = 140
      end
      object pnlValue: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 47
        Width = 274
        Height = 21
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
        object edtValue: TEdit
          Left = 0
          Top = 0
          Width = 274
          Height = 21
          Align = alClient
          TabOrder = 0
        end
      end
      object memDescription: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 143
        Width = 274
        Height = 100
        Align = alTop
        BorderStyle = bsNone
        Color = clBtnFace
        Lines.Strings = (
          'no description available for this element')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
  end
  object sadPXML: TSaveDialog
    Filter = 'PXML-file|PXML.xml;pxml.xml|Any file|*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofCreatePrompt, ofEnableSizing]
    Left = 120
    Top = 24
  end
end
