unit mainpage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.Menus, Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, shellapi,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    StatusBar1: TStatusBar;
    ADOTable1: TADOTable;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    Image1: TImage;
    N17: TMenuItem;
    Label1: TLabel;
    N1: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    Panel2: TPanel;
    N24: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    ImageList1: TImageList;
    N25: TMenuItem;
    N26: TMenuItem;
    Label2: TLabel;
    Bevel1: TBevel;
    procedure N16Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N25Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses helptxt,lrbj,lrlesson,deletead,registe,lrrchshw,schlesson,schrchshw,lrsinglemath,
   schstuinfo,freetable,lrstujb,lrstuscore,updatepswd,login,schmath;

{$R *.dfm}

Procedure ReadTxt(FileName:String);//��txt����
var
  txt:TextFile;
  s:string;
  path:string;
begin
  path:=ExtractFilePath(Application.ExeName);
  AssignFile(txt,path+'\help.txt');
  //Writeln(path+'\test.txt');
  Reset(txt);   //�����ļ����ļ�ָ���Ƶ���
  form16.Memo1.Clear;
  form16.show;
  while not Eof(txt) do
  begin
    Readln(txt,s);
    form16.Memo1.Lines.Add(s);
  end;
  CloseFile(txt);
  //form16.memo1.SelStart:=0;
  //form16.memo1.SetFocus;
end;

procedure TForm1.Button1Click(Sender: TObject);//chaxunshuxuechengji  ��ť
begin
form15.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);//ziyoubiao  ��ť
begin
form9.RadioButton1.Enabled:=false;
form9.RadioButton2.Enabled:=false;
form9.RichEdit1.Lines.Clear;

form9.srvbutton3.Enabled:=false;
form9.Edit1.Text:='';
form9.ComboBox1.ItemIndex:=-1;
form9.adoquery1.SQL.Clear;
form9.adoquery1.SQL.Add('select * from  stu_freetable');
form9.adoquery1.Active:=true;

form9.adoquery2.Close;
form9.adoquery2.Open;
form9.ComboBox1.Items.clear;

while not form9.adoquery2.Eof do
    begin
      form9.ComboBox1.Items.Add(form9.adoquery2.FieldByName('���ڰ༶').asstring);
      form9.adoquery2.Next;
    end;
form9.ComboBox1.ItemIndex:=-1;

form9.show;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
adoquery1.Active:=true;
adoquery1.Edit;
adoquery1.FieldByName('����ʱ��').AsString:=datetimetostr(now);
adoquery1.Post;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if Application.messagebox('        ȷ�����в������������ȷ���˳���      ','ESC' ,MB_YESNO or MB_iconwarning)=6 then
   CanClose:=true
else
   CanClose:=false;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
statusbar1.Panels[0].Text:='��ǰ�û�: '+ form2.Edit1.Text;
statusbar1.Panels[1].Text:='��¼ʱ��: '+ datetimetostr(now);
end;

procedure TForm1.N10Click(Sender: TObject); //�γ̱��ѯ
begin
form10.show;
end;

procedure TForm1.N11Click(Sender: TObject); //�༶��Ϣ¼��
begin
form5.show;
end;

procedure TForm1.N12Click(Sender: TObject);//�γ���Ϣ¼��
begin
form6.show;
end;

procedure TForm1.N13Click(Sender: TObject);//�ճ������ѯ
begin
form11.show;
end;

procedure TForm1.N15Click(Sender: TObject); //����
begin
ShellAbout(handle, Pchar('����ʦ��Сϵͳ V1.0'), Pchar('����ʦ��Сϵͳ V1.0'+#13+'WYM XTY'), Application.Icon.Handle);
end;

procedure TForm1.N16Click(Sender: TObject);// �˳�
begin
close;
end;

procedure TForm1.N18Click(Sender: TObject); //ע�����û�
begin
form12.show;
end;

procedure TForm1.N19Click(Sender: TObject);//�޸�����
begin
form13.show;
end;

procedure TForm1.N20Click(Sender: TObject);//ɾ���û�
begin
form14.show;
end;

procedure TForm1.N22Click(Sender: TObject);//�л��˺�
begin
form1.Visible:=false;
form2.show;
loginsuccess:=false;
end;

procedure TForm1.N23Click(Sender: TObject);//����������
begin
ReadTxt('help.txt');
form16.Memo1.Perform(WM_VSCROLL, SB_TOP, 0); //������ͷ��
//form16.Memo1.Perform(EM_SETSEL, 0, 0);
form16.Memo1.SetFocus;
end;

procedure TForm1.N25Click(Sender: TObject); //��ѧ����
begin
button1.Click;
end;

procedure TForm1.N26Click(Sender: TObject);
var
i:integer;
begin
form17.srvbutton1.Enabled:=false;
form17.srvbutton4.Enabled:=false;
form17.srvbutton7.Enabled:=false;
form17.srvbutton9.Enabled:=false;
form17.edit1.text:='';
form17.DBGrid1.TitleFont.Color:=clblack;

form17.Adoquery1.Close;
form17.Adoquery1.SQL.Clear;
form17.Adoquery1.SQL.Add('select * from stu_math');
form17.Adoquery1.Open;

form17.adoquery2.Close;
form17.adoquery2.Open;
form17.ComboBox1.Items.clear;

//while not form17.adoquery2.Eof do
//    begin
//      form17.ComboBox1.Items.Add(form17.adoquery2.FieldByName('���ڰ༶').asstring);
//      form17.adoquery2.Next;
//    end;
form17.ComboBox1.ItemIndex:=-1;
while not form17.adoquery2.Eof do
    begin
      form17.ComboBox1.Items.Add(form17.adoquery2.FieldByName('���ڰ༶').asstring);
      form17.adoquery2.Next;
    end;

for i:=0 to form17.ADOQuery3.FieldCount-1 do //������ѡ������
begin
    form17.ADOQuery3.first;
    if form17.ADOQuery3.Fields[i].FieldName<>'ѧ��' then
    begin
        if form17.ADOQuery3.Fields[i].FieldName<>'ѧ������' then
             begin
                if form17.ADOQuery3.Fields[i].FieldName<>'����' then
                    form17.combobox2.Items.Add(form17.ADOQuery3.Fields[i].FieldName);
            end;
    end;
    form17.ADOQuery3.Next;
end;
form17.ComboBox2.ItemIndex:=-1;
form17.Label3.Caption:=inttostr(form17.Adoquery1.recordcount);

form17.show;
end;

procedure TForm1.N3Click(Sender: TObject);//ѧ��������Ϣ¼��
begin
//form1.WindowState:=wsminimized;//������С��
form3.label9.Caption:='ѧ'+#13+'��'+#13+'��'+#13+'��'+#13+'��'+#13+'Ϣ';
form3.label10.Caption:='��'+#13+'��';
form3.show;
end;

procedure TForm1.N4Click(Sender: TObject);//ѧ���ɼ���ѯ
begin
form4.show;
end;

procedure TForm1.N6Click(Sender: TObject); //�ճ������¼
begin
form7.show;
end;

procedure TForm1.N8Click(Sender: TObject); //ѧ��������Ϣ��ѯ
begin
form8.Adoquery1.Close;
form8.Adoquery1.SQL.Clear;
form8.Adoquery1.SQL.Add('select * from stu_info');
form8.Adoquery1.Open;

form8.adoquery2.Close;
form8.adoquery2.Open;
form8.ComboBox1.Items.clear;
//ComboBox1.Items.Add('ALL');

while not form8.adoquery2.Eof do
    begin
      form8.ComboBox1.Items.Add(form8.adoquery2.FieldByName('���ڰ༶').asstring);
      form8.adoquery2.Next;
    end;
form8.Label3.Caption:=inttostr(form8.Adoquery1.recordcount);

form8.srvbutton1.Enabled:=true;
form8.Edit1.Text:='';
form8.SRVLabel5.Visible:=false;
form8.ComboBox1.ItemIndex:=-1;

form8.show;
end;

procedure TForm1.N9Click(Sender: TObject);//���ɱ�
begin
button2.Click;
end;

end.
