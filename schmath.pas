unit schmath;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, SRVControl, SRVButton, SRVLabel,
  Data.Win.ADODB, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.TeeProcs,
  VCLTee.Chart, VCLTee.DBChart, VCLTee.Series;

type
  TForm17 = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    SRVLabel1: TSRVLabel;
    SRVLabel2: TSRVLabel;
    SRVLabel3: TSRVLabel;
    Label3: TLabel;
    SRVLabel4: TSRVLabel;
    Bevel2: TBevel;
    Edit1: TEdit;
    SRVButton3: TSRVButton;
    ComboBox1: TComboBox;
    SRVLabel5: TSRVLabel;
    ComboBox2: TComboBox;
    SRVButton1: TSRVButton;
    Bevel1: TBevel;
    DBGrid1: TDBGrid;
    SRVButton4: TSRVButton;
    SRVButton7: TSRVButton;
    Bevel3: TBevel;
    Bevel4: TBevel;
    SRVLabel6: TSRVLabel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    SaveDialog1: TSaveDialog;
    ADOQuery3: TADOQuery;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label4: TLabel;
    Label2: TLabel;
    DBChart1: TDBChart;
    Series1: TLineSeries;
    Memo1: TMemo;
    SRVLabel7: TSRVLabel;
    procedure SRVButton3Click(Sender: TObject);
    procedure SRVButton2Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SRVButton1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure SRVButton9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

{$R *.dfm}

procedure TForm17.ComboBox1Change(Sender: TObject);
begin
if combobox2.Text='' then
    begin
    Adoquery1.SQL.Clear;
    Adoquery1.SQL.Add('select * from stu_math,stu_info where stu_info.所在班级='''+ combobox1.Text+''' and stu_math.学号=stu_info.学号');
    Adoquery1.Open
    end
else
    begin
    Adoquery1.SQL.Clear;
    Adoquery1.SQL.Add('select stu_math.学号,stu_math.排名,stu_math.学生姓名,stu_math.'+ combobox2.Text+' from stu_math,stu_info where stu_info.所在班级='''+ combobox1.Text+''' and stu_math.学号=stu_info.学号');
    Adoquery1.Open;
    srvbutton1.Enabled:=true;
    srvbutton4.Enabled:=true;
    srvbutton9.Enabled:=true;
    srvbutton7.Enabled:=false
    end;

Label3.Caption:=inttostr(Adoquery1.recordcount);
end;

procedure TForm17.ComboBox2Change(Sender: TObject);
begin
if combobox1.Text='' then
    begin
    Adoquery1.SQL.Clear;
    Adoquery1.SQL.Add('select 学号,学生姓名,'+ combobox2.Text+' from stu_math');
    Adoquery1.Open
    end
else //组合查询
    begin
    Adoquery1.SQL.Clear;
    Adoquery1.SQL.Add('select stu_math.学号,stu_math.排名,stu_math.学生姓名,stu_math.'+ combobox2.Text+' from stu_math,stu_info where stu_info.所在班级='''+ combobox1.Text+''' and stu_math.学号=stu_info.学号');
    Adoquery1.Open;
    srvbutton1.Enabled:=true;
    srvbutton4.Enabled:=true;
    srvbutton9.Enabled:=true;
    srvbutton7.Enabled:=false
    end;

Label3.Caption:=inttostr(Adoquery1.recordcount);
end;

procedure TForm17.DBGrid1TitleClick(Column: TColumn);
begin
if ADOQuery1.Sort<>(Column.FieldName+' ASC') then      //判断原排序方式
    begin
    ADOQuery1.Sort := Column.FieldName+' ASC';
    Column.Title.Font.Color := clBlue;     //升序
    end
else
    begin
    ADOQuery1.Sort := Column.FieldName+' DESC';
    Column.Title.Font.Color := clRed;      //降序
    end;
end;

procedure TForm17.SRVButton1Click(Sender: TObject);
begin
if ADOQuery1.Sort<>(DBGrid1.Columns.Items[3].FieldName+' ASC') then      //判断原排序方式
    begin
    ADOQuery1.Sort := DBGrid1.Columns.Items[3].FieldName+' ASC';
    DBGrid1.Columns.Items[3].Title.Font.Color := clBlue;     //升序
    end
else
    begin
    ADOQuery1.Sort := DBGrid1.Columns.Items[3].FieldName+' DESC';
    DBGrid1.Columns.Items[3].Title.Font.Color := clRed;      //降序
    end;
end;

procedure TForm17.SRVButton2Click(Sender: TObject);//刷新
var
i : integer;
begin
srvbutton1.Enabled:=false;
srvbutton4.Enabled:=false;
srvbutton7.Enabled:=false;
srvbutton9.Enabled:=false;
DBGrid1.TitleFont.Color:=clblack;

Adoquery1.Close;
Adoquery1.SQL.Clear;
Adoquery1.SQL.Add('select * from stu_math');
Adoquery1.Open;

adoquery2.Close;
adoquery2.Open;
ComboBox1.Items.clear;

//while not adoquery2.Eof do
//    begin
//      ComboBox1.Items.Add(adoquery2.FieldByName('所在班级').asstring);
//      adoquery2.Next;
//    end;
ComboBox1.ItemIndex:=-1;

while not form17.adoquery2.Eof do
    begin
      form17.ComboBox1.Items.Add(form17.adoquery2.FieldByName('所在班级').asstring);
      form17.adoquery2.Next;
    end;

for i:=0 to ADOQuery3.FieldCount-1 do //下拉框选择考试名
begin
    ADOQuery3.first;
    if ADOQuery3.Fields[i].FieldName<>'学号' then
    begin
        if ADOQuery3.Fields[i].FieldName<>'学生姓名' then
            begin
                if ADOQuery3.Fields[i].FieldName<>'排名' then
                    combobox2.Items.Add(ADOQuery3.Fields[i].FieldName);
            end;
    end;
    ADOQuery3.Next;
end;
ComboBox2.ItemIndex:=-1;

Label3.Caption:=inttostr(Adoquery1.recordcount);
end;

procedure TForm17.SRVButton3Click(Sender: TObject);
begin
if edit1.text='' then
    Messagebox(handle,'        关键词 为空！      ','错误',MB_ok or MB_iconwarning)
else
    begin
    srvbutton1.Enabled:=false;
    srvbutton4.Enabled:=false;
    srvbutton9.Enabled:=false;

    if RadioButton1.Checked then
        begin
        Adoquery1.SQL.Clear; //学号应当没有重复，所以就不需要选择班级了
        Adoquery1.SQL.Add('select * from stu_math where 学号 like ''%'+edit1.Text+'%''');//radiobtn1按学号
        Adoquery1.Open;

        ComboBox1.ItemIndex:=-1;
        ComboBox2.ItemIndex:=-1;

        Label3.Caption:=inttostr(Adoquery1.recordcount);
        if label3.Caption<>'1' then
            srvbutton7.Enabled:=false
        else
            srvbutton7.Enabled:=true
        end;
    if RadioButton2.Checked then
        begin
        Adoquery1.SQL.Clear;
        Adoquery1.SQL.Add('select * from stu_math where 学生姓名 like ''%'+edit1.Text+'%''');//radiobtn2按学生姓名
        Adoquery1.Open;

        ComboBox1.ItemIndex:=-1;
        ComboBox2.ItemIndex:=-1;

        Label3.Caption:=inttostr(Adoquery1.recordcount);
        if label3.Caption<>'1' then
            srvbutton7.Enabled:=false
        else
            srvbutton7.Enabled:=true
        end;
    end;
end;

procedure TForm17.SRVButton9Click(Sender: TObject);
var
n:integer;
begin
with adoquery1 do
begin
  first;
  n:=adoquery1.Fields[1].AsInteger;
  n:=n+1;
  append;
  adoquery1.Fields[1].AsInteger:=n;
end;

end;

end.
