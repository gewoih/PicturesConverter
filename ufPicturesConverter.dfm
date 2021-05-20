object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 354
  ClientWidth = 802
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 374
    Top = 183
    Width = 172
    Height = 41
    Caption = #1050#1086#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 374
    Top = 136
    Width = 172
    Height = 41
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1103' '#1092#1072#1081#1083#1086#1074
    TabOrder = 1
  end
  object ListBox1: TListBox
    Left = 568
    Top = 32
    Width = 225
    Height = 257
    ItemHeight = 13
    TabOrder = 2
  end
  object Button3: TButton
    Left = 374
    Top = 89
    Width = 172
    Height = 41
    Caption = #1057#1082#1072#1095#1072#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
    TabOrder = 3
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 312
    Width = 778
    Height = 25
    Step = 1
    TabOrder = 4
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.jpg'
    Filter = #1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103' JPEG|*.jpg'
    Left = 376
    Top = 32
  end
end
