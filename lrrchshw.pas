unit lrrchshw;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, SRVControl, SRVButton, SRVEdit, SRVMemo,
  Data.DB, Data.Win.ADODB, SRVLabel;

type
  TForm7 = class(TForm)
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    SRVButton1: TSRVButton;
    Image1: TImage;
    DateTimePicker1: TDateTimePicker;
    SRVLabel1: TSRVLabel;
    SRVLabel2: TSRVLabel;
    SRVLabel3: TSRVLabel;
    SRVButton2: TSRVButton;
    Memo1: TMemo;
    SRVLabel4: TSRVLabel;
    procedure SRVButton1Click(Sender: TObject);
    procedure Memo1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SRVButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses schrchshw;
{$R *.dfm}

procedure TForm7.FormCreate(Sender: TObject);
begin
dateTimePicker1.DateTime:= now;
memo1.Font.Color:=clsilver;
srvbutton1.Caption:='ȷ�����';
end;

procedure TForm7.Memo1Change(Sender: TObject);
begin
if memo1.Text='' then
    srvbutton1.Enabled:=false
else
    begin
    srvbutton1.Caption:='ȷ�����';
    srvbutton1.Enabled:=true
    end;
end;

procedure TForm7.Memo1Click(Sender: TObject);
begin
if (memo1.Font.Color=clsilver) or (memo1.Font.Color=clnone) then
    begin
    memo1.Text:='';
    memo1.Font.Color:=clblack
    end;
end;

procedure TForm7.SRVButton1Click(Sender: TObject);//��ɫ�������ݣ�silver��ʾĬ�ϣ�black��ʾ�༭δ���棬none��ʾ������
begin
adotable1.Insert;
adotable1.FieldByName('����ʱ��').AsString:= DatetimeToStr(datetimepicker1.Datetime);
adotable1.FieldByName('�����¼�').AsString:= memo1.Text;
adotable1.FieldByName('sta').AsString:= '0'; //δ���
adotable1.Post;

memo1.Font.Color:=clnone;
srvbutton1.Enabled:=false;
srvbutton1.Caption:='��ӳɹ�';

form11.ADOQuery1.Active:=false;
form11.ADOQuery2.Active:=false;
form11.ADOQuery1.Active:=true;
form11.ADOQuery2.Active:=true;
form11.dbgrid1.Columns[2].visible:=false;
form11.dbgrid2.Columns[2].visible:=false;
end;

procedure TForm7.SRVButton2Click(Sender: TObject);
begin
if memo1.Font.Color=clblack then
     begin
     if Application.messagebox('        �༭�¼����� ��δ���棡 ȷ���˳���      ','��ʾ' ,MB_YESNO or MB_iconwarning)=6 then
        begin
        memo1.Text:='';
        close
        end;
     end
else
    close;
end;

end.
