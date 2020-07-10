unit deletead;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Grids, Vcl.DBGrids, SRVControl, SRVButton, SRVEdit, SRVLabel,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TForm14 = class(TForm)
    Image1: TImage;
    SRVLabel1: TSRVLabel;
    SRVEdit1: TSRVEdit;
    SRVButton1: TSRVButton;
    SRVButton3: TSRVButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    SRVButton4: TSRVButton;
    ADOQuery1�û�ID: TWideStringField;
    ADOQuery1����: TWideStringField;
    ADOQuery1����Ա: TWideStringField;
    ADOQuery1����ԱȨ��: TWideStringField;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Edit1: TEdit;
    SRVLabel2: TSRVLabel;
    SRVButton2: TSRVButton;
    Bevel1: TBevel;
    procedure SRVButton1Click(Sender: TObject);
    procedure SRVButton4Click(Sender: TObject);
    procedure SRVButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SRVButton3Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

{$R *.dfm}

procedure TForm14.Button1Click(Sender: TObject);//���⣺������ͬ���ݺ󱨴�
begin
if Application.messagebox('        �㼴���޸ĸ��û��Ĺ���ԱȨ��! ����������      ','ɾ��' ,MB_YESNO or MB_iconwarning)=6 then
    adoquery1.Edit;
    adoquery1.FieldByName('����ԱȨ��').AsString:=edit1.Text;
    adoquery1.Post;
end;

procedure TForm14.Edit1Change(Sender: TObject);
begin
if adoquery1.FieldByName('����ԱȨ��').AsString=edit1.Text then
     begin
     button1.Enabled:=false;
     srvlabel2.Visible:=true;
     end
else
     begin
     button1.Enabled:=true;
     srvlabel2.Visible:=false;
     end;
end;

procedure TForm14.Edit1Click(Sender: TObject);
begin
edit1.Text:='';
edit1.Font.Color:=clblack;
end;

procedure TForm14.FormClose(Sender: TObject; var Action: TCloseAction);
begin
srvedit1.Text:='';
edit1.Visible:=false;
edit1.Font.Color:=clSilver;
button1.Visible:=false;
adoquery1.Active:=false;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from admin_data');
SRVButton3.Enabled:=false;
SRVButton4.Enabled:=false;
srvlabel2.Visible:=false;
end;

procedure TForm14.SRVButton1Click(Sender: TObject);
begin
adoquery1.Active:=true;
if (adoquery1.SQL.Text='') or (srvedit1.Text='') then
    begin
    adoquery1.Active:=false;
    messagebox(handle,'        �������û�����      ','��ʾ' ,MB_OK or MB_iconwarning)
    end
else
    begin
    if adoquery1.Locate('�û�ID', srvedit1.Text ,[]) then
        begin
        SRVButton3.Enabled:=true;
        SRVButton4.Enabled:=true;
        with adoquery1 do
           begin
           SQL.Clear;
           sql.Add('select * from admin_data where �û�ID=:use');
           parameters[0].Value:=srvedit1.Text;
           open;
           end;
        end
    else
        begin
        adoquery1.Active:=false;
        messagebox(handle,'        �û��������ڣ�      ','��ʾ' ,MB_OK or MB_iconwarning)
        end;
    end;
end;

procedure TForm14.SRVButton2Click(Sender: TObject);
begin
close;
end;

procedure TForm14.SRVButton3Click(Sender: TObject);
begin
edit1.Visible:=true;
button1.Visible:=true;
SRVButton3.Enabled:=false;
end;

procedure TForm14.SRVButton4Click(Sender: TObject);
begin
if Application.messagebox('        ������ɾ�����û�! ����������      ','ɾ��' ,MB_YESNO or MB_iconwarning)=6 then
    adoquery1.Delete;
    SRVButton3.Enabled:=false;
    SRVButton4.Enabled:=false;
end;

end.
