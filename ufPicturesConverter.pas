unit ufPicturesConverter;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
	Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg,
	System.Win.ComObj, uxADO, Vcl.ComCtrls;

type
	TMainForm = class(TForm)
		Button1: TButton;
		Button2: TButton;
		ListBox1: TListBox;
		Button3: TButton;
    	ProgressBar1: TProgressBar;
    SaveDialog1: TSaveDialog;
		procedure FormCreate(Sender: TObject);
		procedure Button1Click(Sender: TObject);
	private
        private type
		tDataRec = record
			id: integer;
			Data: TBytes;
		end;
	public
    	Data: tDataRec;
	end;

var
	MainForm: TMainForm;
	fCon: OLEVariant;

const
	adoCon = 'ADODB.Connection';
	adoRec = 'ADODB.Recordset';

implementation

{$R *.dfm}

procedure TMainForm.Button1Click(Sender: TObject);
var
	R, R1, V: 		Variant;
	Len:		    integer;
    M, M2:  		TMemoryStream;
    scale: 			Double;
    Rect: 			TRect;
    P: 				Pointer;
var
	picture: TJPEGImage;
	bitmap: TBitmap;
begin
	try
		R := fCon.Execute('select sb.id from spr_blob sb (nolock) where sb.tid = 1 and sb.data2 IS NULL order by id');
        ProgressBar1.Position := 0;
        ProgressBar1.Max := R.RecordCount;

		while not R.EOF do
		begin
        	M := TMemoryStream.Create;
        	M2 := TMemoryStream.Create;
        	picture := TJPEGImage.Create;
        	bitmap := Tbitmap.Create;

            R1 := fcon.Execute('select sb.data from spr_blob sb (nolock) where sb.id = ' + AsStr(R, 'id'));

            Data.id := AsInt(R, 'id');
			V := AsVar(R1, 'data');
			Len := TVarData(V).VArray.Bounds[0].ElementCount;

            M.write(TVarData(V).VArray.Data^, Len);
            M.Position := 0;

            try
            picture.LoadfromStream(M);

            if picture.Height > picture.Width then
              scale := 200 / picture.Height
            else
              scale := 200 / picture.Width;

            bitmap.Width := 200;
            bitmap.Height:= 200;

            Rect := bitmap.Canvas.Cliprect;

            InflateRect(Rect, Round((picture.Width * scale - 200) / 2),
            Round((picture.Height * scale - 200) / 2));

            bitmap.Canvas.StretchDraw(Rect, picture);
            Canvas.Draw(100, 10, bitmap);

            picture.Assign(bitmap);
            picture.SaveToStream(M2);
            M2.Position := 0;

            V := VarArrayCreate([0, M2.Size-1], varByte);
			P := VarArrayLock(V);
    		Move(M2.Memory^, P^, M2.Size);
            VarArrayUnlock(V);

            M2.SaveToFile('C:\Users\Никита\Рабочий стол\Новые пикчи\' + Data.id.ToString + '.jpg');

            fCon.LoadPicture(Data.id, V);

            finally
            	M.Free;
              	M2.Free;
                bitmap.free;
                picture.free;
            end;

            R1.Close;
            V := null;

			R.MoveNext;
            ProgressBar1.Position := ProgressBar1.Position + 1;
            Application.ProcessMessages;
		end;
	finally;
        VarClear(R);
	end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
    ConnectSQL(fcon);
end;

end.
