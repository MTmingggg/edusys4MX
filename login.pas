unit login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, SRVControl, SRVEdit, SRVLabel, SRVButton, Data.DB,
  Data.Win.ADODB;

type
  TForm2 = class(TForm)
    Image1: TImage;
    SRVLabel1: TSRVLabel;
    SRVLabel2: TSRVLabel;
    SRVLabel3: TSRVLabel;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    ADOConnection1: TADOConnection;
    ADOTable1用户ID: TWideStringField;
    ADOTable1密码: TWideStringField;
    ADOTable1操作员: TWideStringField;
    ADOTable1管理员权限: TWideStringField;
    ADOTable2用户ID: TWideStringField;
    ADOTable2登录时间: TDateTimeField;
    ADOTable2下线时间: TDateTimeField;
    ADOTable2序号: TAutoIncField;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
var loginsuccess:boolean;
var i:string;

implementation

uses mainpage,schstuinfo;
{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
close;
form1.Close;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
form1.ClientHeight:=372;
form2.ClientWidth:=685;

adotable1.Active:=true;
if Adotable1.Locate('用户ID',edit1.Text,[]) then
    if adotable1.FieldByName('密码').AsString = edit2.Text then
        begin
        loginsuccess:=true;
        adotable2.Append;
        adotable2.FieldByName('登录时间').Value:=datetimetostr(now);
        adotable2.FieldByName('用户ID').Value:=adotable1.Fields[0].AsString;
        adotable2.Post;
        i:=adotable2.FieldByName('序号').asstring;
        close;
        form1.show;
        end
    else
        begin
        Messagebox(handle,'        密码错误！      ','错误',MB_ok or MB_iconwarning);
        edit2.Text:=''
        end
else
    begin
    Messagebox(handle,'        用户名不存在！      ','错误',MB_ok or MB_iconwarning);
    edit2.Text:=''
    end;
adotable1.Active:=false;
edit2.Text:='';

while not form8.adoquery2.Eof do  //初始化查询
    begin
      form8.ComboBox1.Items.Add(form8.adoquery2.FieldByName('所在班级').asstring);
      form8.adoquery2.Next;
    end;
form8.Label3.Caption:=inttostr(form8.Adoquery1.recordcount);
end;

procedure TForm2.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = 13 then
    button2.Click;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if not loginsuccess then
    application.Terminate;
end;

end.
