unit lrstujb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, Vcl.DBCtrls, Vcl.Mask;

type
  TForm3 = class(TForm)
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Label9: TLabel;
    DBComboBox1: TDBComboBox;
    Label10: TLabel;
    DBComboBox2: TDBComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
//    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses schstuinfo;
//uses mainpage;
{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
button5.Enabled:=true;
button4.Enabled:=true;
panel2.Enabled:=true;
adotable1.Append;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
button5.Enabled:=true;
button4.Enabled:=true;
panel2.Enabled:=true;
adotable1.Edit;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
if Application.MessageBox('        你确定删除这条记录嘛？      ','删除',MB_YESNO)=6 then
    adotable1.Delete;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
button4.Enabled:=false;
adotable1.Post;
panel2.Enabled:=false;
button5.Enabled:=false;
adotable1.Cancel;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
button4.Enabled:=false;
adotable1.Cancel;
button5.Enabled:=false;
end;

procedure TForm3.Button6Click(Sender: TObject);
begin
form8.Adoquery1.Close;
form8.Adoquery1.SQL.Clear;
form8.Adoquery1.SQL.Add('select * from stu_info');
form8.Adoquery1.Open;

form8.adoquery2.Close;
form8.adoquery2.Open;
form8.ComboBox1.Items.clear;
//form8.ComboBox1.Items.Add('ALL');
while not form8.adoquery2.Eof do
    begin
      form8.ComboBox1.Items.Clear;
      form8.ComboBox1.Items.Add(form8.adoquery2.FieldByName('所在班级').asstring);
      form8.adoquery2.Next;
    end;
form8.Label3.Caption:=inttostr(form8.Adoquery1.recordcount);
close;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
form8.adoquery2.Close;
form8.adoquery2.Open;
form8.ComboBox1.Items.clear;
//form8.ComboBox1.Items.Add('ALL');
while not form8.adoquery2.Eof do
    begin
      form8.ComboBox1.Items.Add(form8.adoquery2.FieldByName('所在班级').asstring);
      form8.adoquery2.Next;
    end;
form8.Label3.Caption:=inttostr(form8.Adoquery1.recordcount);
CanClose:=true;
end;

end.
