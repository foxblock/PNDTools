object frmPXML: TfrmPXML
  Left = 248
  Top = 276
  Caption = 'PXML'
  ClientHeight = 533
  ClientWidth = 404
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 420
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sptHor: TSplitter
    Left = 158
    Top = 0
    Height = 397
    AutoSnap = False
    Beveled = True
    ResizeStyle = rsUpdate
    ExplicitLeft = 160
    ExplicitTop = -4
    ExplicitHeight = 377
  end
  object sptVert: TSplitter
    Left = 0
    Top = 397
    Width = 404
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    AutoSnap = False
    Beveled = True
    ResizeStyle = rsUpdate
    ExplicitTop = 0
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 500
    Width = 404
    Height = 33
    Align = alBottom
    BevelEdges = [beTop]
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 3
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 325
      Top = 4
      Width = 75
      Height = 23
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      AlignWithMargins = True
      Left = 246
      Top = 4
      Width = 75
      Height = 23
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
    end
  end
  object pnlData: TPanel
    Left = 161
    Top = 0
    Width = 243
    Height = 397
    Align = alClient
    BevelOuter = bvNone
    Constraints.MinWidth = 200
    TabOrder = 1
    object scbValues: TScrollBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 235
      Height = 391
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
      object pnlValueParent: TPanel
        Left = 0
        Top = 0
        Width = 231
        Height = 177
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
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
          object edtValue: TEdit
            Left = 0
            Top = 0
            Width = 225
            Height = 21
            Align = alClient
            TabOrder = 0
          end
        end
        object pnlValueText: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 74
          Width = 225
          Height = 100
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object memValue: TMemo
            Left = 0
            Top = 0
            Width = 225
            Height = 100
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      object pnlAttrParent: TPanel
        Left = 0
        Top = 177
        Width = 231
        Height = 44
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 1
        object lblAttr: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
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
        object lblNoAttr: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 28
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
      end
      object pnlDescrParent: TPanel
        Left = 0
        Top = 221
        Width = 231
        Height = 166
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object lblDescription: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
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
        object redDescription: TRichEdit
          Left = 0
          Top = 25
          Width = 231
          Height = 141
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
          TabOrder = 0
        end
      end
    end
  end
  object pnlTree: TPanel
    Left = 0
    Top = 0
    Width = 158
    Height = 397
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
      Height = 391
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 2
      Align = alClient
      DragOperations = [doMove]
      DragType = dtVCL
      Header.AutoSizeIndex = 0
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.Options = [hoAutoResize, hoColumnResize, hoDrag]
      Header.SortColumn = 0
      LineStyle = lsSolid
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes]
      TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toFullVertGridLines]
      TreeOptions.SelectionOptions = [toFullRowSelect]
      OnChange = vstPXMLChange
      OnGetText = vstPXMLGetText
      OnKeyDown = vstPXMLKeyDown
      OnMouseUp = vstPXMLMouseUp
      Columns = <
        item
          Options = [coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coVisible, coAllowFocus]
          Position = 0
          Width = 146
          WideText = 'Key'
        end>
    end
  end
  object pnlElements: TPanel
    Left = 0
    Top = 400
    Width = 404
    Height = 100
    Align = alBottom
    BevelOuter = bvNone
    Constraints.MinHeight = 48
    TabOrder = 2
    object bugElements: TButtonGroup
      AlignWithMargins = True
      Left = 4
      Top = 24
      Width = 396
      Height = 72
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ButtonWidth = 75
      Items = <>
      TabOrder = 1
      OnButtonClicked = bugElementsButtonClicked
    end
    object pnlFilter: TPanel
      Left = 0
      Top = 0
      Width = 404
      Height = 20
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblFilter: TLabel
        AlignWithMargins = True
        Left = 6
        Top = 2
        Width = 89
        Height = 14
        Margins.Left = 6
        Margins.Top = 2
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alLeft
        Caption = 'Filter elements by:'
        ExplicitHeight = 13
      end
      object rabSelection: TRadioButton
        AlignWithMargins = True
        Left = 103
        Top = 0
        Width = 75
        Height = 20
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Selection'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rabSelectionClick
      end
      object rabPackage: TRadioButton
        AlignWithMargins = True
        Left = 186
        Top = 0
        Width = 75
        Height = 20
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Package'
        TabOrder = 1
        OnClick = rabSelectionClick
      end
      object rabApplication: TRadioButton
        AlignWithMargins = True
        Left = 269
        Top = 0
        Width = 75
        Height = 20
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Application'
        TabOrder = 2
        OnClick = rabSelectionClick
      end
    end
  end
  object sadPXML: TSaveDialog
    FileName = 'PXML.xml'
    Filter = 'PXML-file|PXML.xml;pxml.xml|Any file|*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofCreatePrompt, ofEnableSizing]
    Title = 'Save PXML file as'
    Left = 120
    Top = 24
  end
  object pomPXML: TPopupMenu
    Left = 120
    Top = 56
    object pomPXMLDelete: TMenuItem
      Caption = 'Delete'
      OnClick = pomPXMLDeleteClick
    end
  end
end
