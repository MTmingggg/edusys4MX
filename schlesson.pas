unit schlesson;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Touch.GestureCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Data.DB, SRVControl,
  SRVLabel, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, SRVButton;

type
  TForm10 = class(TForm)
    Image1: TImage;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    ADOTable2: TADOTable;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    SRVLabel1: TSRVLabel;
    SRVButton1: TSRVButton;
    SRVButton2: TSRVButton;
    ADOQuery1: TADOQuery;
    SRVLabel2: TSRVLabel;
    Edit1: TEdit;
    Bevel1: TBevel;
    SRVButton3: TSRVButton;
    procedure SRVButton2Click(Sender: TObject);
    procedure SRVButton1Click(Sender: TObject);
    procedure SRVButton3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

uses lrlesson;

procedure TForm10.Edit1Change(Sender: TObject);
begin
if edit1.Text='' then
    srvbutton3.Enabled:=false
else
    begin
    srvbutton3.Enabled:=true
    end;
end;

procedure TForm10.SRVButton1Click(Sender: TObject);
begin
close;
form6.show;
end;

procedure TForm10.SRVButton2Click(Sender: TObject);
begin
close;
end;

procedure TForm10.SRVButton3Click(Sender: TObject);
begin
adoquery1.insert;
adoquery1.FieldByName('µ÷¿ÎÍ¨Öª').AsString:=edit1.Text;
adoquery1.Post;
srvbutton3.Enabled:=false;
edit1.Text:='';
end;

end.
