object frmPXML: TfrmPXML
  Left = 0
  Top = 0
  Caption = 'PXML'
  ClientHeight = 435
  ClientWidth = 404
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 420
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
    Height = 402
    AutoSnap = False
    ResizeStyle = rsUpdate
    ExplicitLeft = 160
    ExplicitTop = -4
    ExplicitHeight = 377
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 402
    Width = 404
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 453
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 325
      Top = 4
      Width = 75
      Height = 25
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
      ExplicitLeft = 374
    end
    object btnOK: TButton
      AlignWithMargins = True
      Left = 246
      Top = 4
      Width = 75
      Height = 25
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
      ExplicitLeft = 295
    end
    object cbxElement: TComboBox
      AlignWithMargins = True
      Left = 4
      Top = 6
      Width = 157
      Height = 21
      Margins.Left = 4
      Margins.Top = 6
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
    end
    object btnAdd: TButton
      AlignWithMargins = True
      Left = 165
      Top = 4
      Width = 75
      Height = 25
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Caption = 'Add'
      TabOrder = 3
      OnClick = btnAddClick
    end
  end
  object pnlData: TPanel
    Left = 161
    Top = 0
    Width = 243
    Height = 402
    Align = alClient
    BevelOuter = bvNone
    Constraints.MinWidth = 200
    TabOrder = 1
    ExplicitWidth = 292
    object scbValues: TScrollBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 235
      Height = 396
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
      ExplicitWidth = 284
      object lblValue: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 225
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
        Width = 225
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
        Width = 225
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
        Width = 225
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
        Width = 225
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
        Width = 225
        Height = 21
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
        ExplicitWidth = 274
        object edtValue: TEdit
          Left = 0
          Top = 0
          Width = 225
          Height = 21
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 274
        end
      end
      object redDescription: TRichEdit
        Left = 0
        Top = 140
        Width = 231
        Height = 252
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        Constraints.MinHeight = 100
        Lines.Strings = (
          'no description available for this element')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
        ExplicitWidth = 280
      end
    end
  end
  object pnlTree: TPanel
    Left = 0
    Top = 0
    Width = 158
    Height = 402
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 2
    Align = alLeft
    BevelOuter = bvNone
    Constraints.MaxWidth = 300
    Constraints.MinWidth = 100
    TabOrder = 0
    object vstPXML: TVirtualStringTree
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 150
      Height = 396
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
  object sadPXML: TSaveDialog
    Filter = 'PXML-file|PXML.xml;pxml.xml|Any file|*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofCreatePrompt, ofEnableSizing]
    Left = 120
    Top = 24
  end
end
