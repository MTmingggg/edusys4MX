unit schrchshw;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, SRVControl, SRVButton, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, SRVLabel;

type
  TForm11 = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    SRVButton1: TSRVButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    SRVButton2: TSRVButton;
    SRVLabel1: TSRVLabel;
    SRVLabel2: TSRVLabel;
    procedure SRVButton1Click(Sender: TObject);
    procedure SRVButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

uses lrrchshw;


procedure TForm11.SRVButton1Click(Sender: TObject);
begin
close;
form7.show;
end;

procedure TForm11.SRVButton2Click(Sender: TObject);
begin
adoquery1.Edit;
adoquery1.FieldByName('sta').AsString:='1';
adoquery1.Post;

adoquery1.Active:=false;//Ë¢ÐÂ
adoquery2.Active:=false;
adoquery1.Active:=true;
adoquery2.Active:=true;
dbgrid1.Columns[2].visible:=false;
dbgrid2.Columns[2].visible:=false;
end;

end.
