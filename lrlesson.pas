unit lrlesson;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, SRVControl, SRVLabel, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  SRVButton, Vcl.ComCtrls;

type
  TForm6 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Image1: TImage;
    SRVLabel1: TSRVLabel;
    SRVLabel3: TSRVLabel;
    SRVButton1: TSRVButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ADOTable2: TADOTable;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    ADOQuery1: TADOQuery;
    procedure SRVButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.SRVButton1Click(Sender: TObject);
begin
close;
end;

end.
