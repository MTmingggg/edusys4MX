unit lrstuscore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ExcelXP,XLSReadWriteII5, Xc12DataStyleSheet5, ShellAPI,
  XLSSheetData5, Vcl.StdCtrls, SRVControl, SRVButton, Vcl.ExtCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.Tabs, XLSGrid5;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    SRVButton1: TSRVButton;
    Label1: TLabel;
    SRVButton2: TSRVButton;
    OpenDialog1: TOpenDialog;
    ADOQuery1: TADOQuery;
    strngrd1: TStringGrid;
    XLSGrid1: TXLSGrid;
    Panel2: TPanel;
    Label2: TLabel;
    XLSReadWriteII51: TXLSReadWriteII5;
    procedure SRVButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses comobj;
{$R *.dfm}

procedure TForm4.SRVButton2Click(Sender: TObject);
const  BeginRow= 1; BeginCol= 2;
var
    iRE:Integer;
    iRow,iCol :Integer; //列、行
    MsExcel,MsExcelWorkBook,MsExcelWorkSheet:Variant;
begin
    Try
        OpenDialog1.FileName:='*.xls';
        if not OpenDialog1.Execute then
        begin
            Exit;
        end;
        if ExtractFileExt(OpenDialog1.FileName) <> '.xls' then
        begin
            MessageBox(0, '请选择正确的excel文件',PChar('提示'),MB_OK or MB_ICONWARNING);
            Exit;
        end;
        MsExcel:=CreateOleObject('Excel.Application');
        MsExcel.visible:=true;
        MsExcelWorkBook:=MsExcel.WorkBooks.Open(OpenDialog1.FileName);
    Except
        Exit;
    end;
    //开始从EXCEL文件读取相关信息 ,并导入数据库中的stu_score表
    Try
        Application.ProcessMessages;//防止进程阻塞
        iRow:=BeginRow;//行
        iCol:=BeginCol;//列
            while trim(msExcel.Cells[iCol,iRow]) <> '' do
            begin
                with adoquery1 do
                begin
                    Close;
                    SQL.Clear;
                    SQl.Add('INSERT INTO stu_score(id,name,shuxue,yuwen) values(:id,:name,:shuxue,:yuwen)');
                    parameters.ParamByName('id').Value:=Trim(msExcel.Cells[iCol,iRow]);
                    parameters.ParamByName('name').Value:=Trim(msExcel.Cells[iCol,iRow+1]);
                    parameters.ParamByName('shuxue').Value:=Trim(msExcel.Cells[iCol,iRow+2]);
                    parameters.ParamByName('yuwen').Value:=Trim(msExcel.Cells[iCol,iRow+3]);
                    ExecSQL;
                end;
                iCol:=iCol+1;
            end;
        MsExcel.Quit;
    Except
    MessageBox(self.Handle,'数据导入失败！','系统提示',0);;
    MsExcel.Quit;
    Exit;
    end;//end try
    MessageBox(self.Handle,'数据导入成功！','系统提示',0);
    MsExcel.Quit;
end;

end.
