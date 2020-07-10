unit lrbj;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, SRVControl, SRVLabel, Vcl.Mask,
  Vcl.DBCtrls, SRVPanel;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button3: TButton;
    Button6: TButton;
    Button5: TButton;
    Button4: TButton;
    Button2: TButton;
    Button1: TButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    SRVPanel1: TSRVPanel;
    SRVPanel2: TSRVPanel;
    SRVPanel3: TSRVPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Memo1: TMemo;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
button5.Enabled:=true;
button4.Enabled:=true;
panel2.Enabled:=true;
adotable1.Append;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
button5.Enabled:=true;
button4.Enabled:=true;
panel2.Enabled:=true;
adotable1.Edit;
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
if Application.messagebox('        你正在删除该记录! 继续操作吗？      ','删除' ,MB_YESNO or MB_iconwarning)=6 then
    adotable1.Delete;
end;

procedure TForm5.Button4Click(Sender: TObject);
begin
button4.Enabled:=false;
adotable1.Post;
panel2.Enabled:=false;
button5.Enabled:=false;
adotable1.Cancel;
end;

procedure TForm5.Button5Click(Sender: TObject);
begin
button4.Enabled:=false;
adotable1.Cancel;
button5.Enabled:=false;
end;

procedure TForm5.Button6Click(Sender: TObject);
begin
close;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
button4.Enabled:=false;
button5.Enabled:=false;
panel2.Enabled:=false;
end;


end.
