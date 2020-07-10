unit freetable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.jpeg, Data.Win.ADODB, SRVControl,
  SRVButton, SRVLabel, SRVEdit, SRVMemo, Vcl.ComCtrls;

type
  TForm9 = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Bevel1: TBevel;
    Label1: TLabel;
    Edit1: TEdit;
    SRVButton1: TSRVButton;
    SRVButton2: TSRVButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    SRVButton3: TSRVButton;
    ComboBox1: TComboBox;
    Button1: TButton;
    Label3: TLabel;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    RichEdit1: TRichEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label2: TLabel;
    Label4: TLabel;
    procedure SRVButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SRVButton2Click(Sender: TObject);
    procedure SRVButton3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
//adoquery1.SQL.Clear;//初始化所有学生信息，用一次后手动添加
//adoquery1.SQL.Add('insert into stu_freetable(学号,学生姓名,班级) (select stu_info.学号,学生姓名,所在班级 from stu_info)');
//ADOQuery1.ExecSQL;

adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from  stu_freetable');
adoquery1.Active:=true;

adoquery2.Close;
adoquery2.Open;
ComboBox1.Items.clear;

while not adoquery2.Eof do
    begin
      ComboBox1.Items.Add(adoquery2.FieldByName('所在班级').asstring);
      adoquery2.Next;
    end;
ComboBox1.ItemIndex:=-1;

srvbutton3.Enabled:=false;
RadioButton1.Enabled:=false;
RadioButton2.Enabled:=false;
end;

procedure TForm9.ComboBox1Change(Sender: TObject);
begin
Adoquery1.SQL.Clear;
Adoquery1.SQL.Add('select * from stu_freetable where 班级 ='''+ combobox1.Text+'''');
Adoquery1.Open;
end;

procedure TForm9.Edit1Change(Sender: TObject);
begin
srvbutton3.Enabled:=false;
end;

procedure TForm9.SRVButton1Click(Sender: TObject);
begin
if edit1.text='' then
    begin
    Messagebox(handle,'        列名 为空！      ','错误',MB_ok or MB_iconwarning);
    end
else
begin
if combobox1.Text='' then
    begin
    if Adoquery1.FieldList.IndexOf(edit1.text) < 0 then//询问是否创建新列
        begin
        if Application.messagebox('        不存在该列名，是否新建？      ','提示' ,MB_YESNO or MB_iconwarning)=6 then
            begin
            adoquery1.Active:=false;
            adoquery1.SQL.Clear;
            adoquery1.SQL.Add('alter table stu_freetable add '+''+edit1.text+''+' varchar(3) NULL');
            ADOQuery1.ExecSQL;

            adoquery1.SQL.Clear;
            adoquery1.SQL.Add('select 学生姓名,'+''+edit1.text+''+' from stu_freetable');
            adoquery1.Active:=true;

            srvbutton3.Enabled:=true;
            RadioButton1.Enabled:=true;
            RadioButton2.Enabled:=true;
            label2.Enabled:=true;
            label4.Enabled:=true;
            end;
        end
    else//定位列，指定显示
        begin
        adoquery1.Active:=false;
        adoquery1.SQL.Clear;
        adoquery1.SQL.Add('select 学生姓名,'+''+edit1.text+''+' from  stu_freetable');
        adoquery1.Active:=true;
        adoquery1.open;

        srvbutton3.Enabled:=true;
        RadioButton1.Enabled:=true;
        RadioButton2.Enabled:=true;
        end;
    end
    else
    begin
    if Adoquery1.FieldList.IndexOf(edit1.text) < 0 then//询问是否创建新列
        begin
        if Application.messagebox('        不存在该列名，是否新建？      ','提示' ,MB_YESNO or MB_iconwarning)=6 then
            begin
            adoquery1.Active:=false;
            adoquery1.SQL.Clear;
            adoquery1.SQL.Add('alter table stu_freetable add '+''+edit1.text+''+' varchar(3) NULL');
            ADOQuery1.ExecSQL;

            adoquery1.SQL.Clear;
            adoquery1.SQL.Add('select 学生姓名,'+''+edit1.text+''+' from stu_freetable where 班级 ='''+ combobox1.Text+'''');
            adoquery1.Active:=true;

            srvbutton3.Enabled:=true;
            RadioButton1.Enabled:=true;
            RadioButton2.Enabled:=true;
            label2.Enabled:=true;
            label4.Enabled:=true;
            end;
        end
    else//定位列，指定显示
        begin
        adoquery1.Active:=false;
        adoquery1.SQL.Clear;
        adoquery1.SQL.Add('select 学生姓名,'+''+edit1.text+''+' from  stu_freetable where 班级 ='''+ combobox1.Text+'''');
        adoquery1.Active:=true;
        adoquery1.open;

        srvbutton3.Enabled:=true;
        RadioButton1.Enabled:=true;
        RadioButton2.Enabled:=true;
        end;
    end;
end;
end;

procedure TForm9.SRVButton2Click(Sender: TObject);
begin
if edit1.text='' then
    begin
    Messagebox(handle,'        列名 为空！      ','错误',MB_ok or MB_iconwarning);
    end
else
begin
if combobox1.Text='' then
    begin
    if Adoquery1.FieldList.IndexOf(edit1.text) >= 0  then
            begin
            if Application.messagebox('        已存在该列名，是否跳转该记录？      ','提示' ,MB_YESNO or MB_iconwarning)=6 then
                begin
                adoquery1.Active:=false;
                adoquery1.SQL.Clear;
                adoquery1.SQL.Add('select 学生姓名,'+''+edit1.text+''+' from  stu_freetable');
                adoquery1.Active:=true;
                adoquery1.open;

                srvbutton3.Enabled:=true;
                RadioButton1.Enabled:=true;
                RadioButton2.Enabled:=true;
                end;
            end
        else
            begin
            adoquery1.Active:=false;
            adoquery1.SQL.Clear;
            adoquery1.SQL.Add('alter table stu_freetable add '+''+edit1.text+''+' varchar(3)');
            ADOQuery1.ExecSQL;

            adoquery1.SQL.Clear;
            adoquery1.SQL.Add('select 学生姓名,'+''+edit1.text+''+' from stu_freetable');
            adoquery1.Active:=true;

            srvbutton3.Enabled:=true;
            RadioButton1.Enabled:=true;
            RadioButton2.Enabled:=true;
            end
    end
    else
    begin
    if Adoquery1.FieldList.IndexOf(edit1.text) >= 0  then
            begin
            if Application.messagebox('        已存在该列名，是否跳转该记录？      ','提示' ,MB_YESNO or MB_iconwarning)=6 then
                begin
                adoquery1.Active:=false;
                adoquery1.SQL.Clear;
                adoquery1.SQL.Add('select 学生姓名,'+''+edit1.text+''+' from  stu_freetable where 班级 ='''+ combobox1.Text+'''');
                adoquery1.Active:=true;
                adoquery1.open;

                srvbutton3.Enabled:=true;
                RadioButton1.Enabled:=true;
                RadioButton2.Enabled:=true;
                end;
            end
        else
            begin
            adoquery1.Active:=false;
            adoquery1.SQL.Clear;
            adoquery1.SQL.Add('alter table stu_freetable add '+''+edit1.text+''+' varchar(3)');
            ADOQuery1.ExecSQL;

            adoquery1.SQL.Clear;
            adoquery1.SQL.Add('select 学生姓名,'+''+edit1.text+''+' from stu_freetable where 班级 ='''+ combobox1.Text+'''');
            adoquery1.Active:=true;

            srvbutton3.Enabled:=true;
            RadioButton1.Enabled:=true;
            RadioButton2.Enabled:=true;
            end
    end;
end;
end;

procedure TForm9.SRVButton3Click(Sender: TObject);
begin
richedit1.Lines.Clear;
if combobox1.Text='' then
begin
   if RadioButton2.Checked then
    begin
        adoquery3.SQL.Clear;
        adoquery3.SQL.Add('select * from stu_freetable where '+edit1.text+' = '+ QuotedStr(''));//修改班级条件
        adoquery3.Active:=true;
        adoquery3.first;

        richedit1.lines.add('以下学生还没有记录！记录数：'+ inttostr(Adoquery3.recordcount));
        richedit1.Font.Color:=clnavy;
        while not adoquery3.eof do
        begin
            richedit1.lines.add(adoquery3.fieldbyname('学生姓名').asstring);
            adoquery3.next;
        end;
    end;

    if RadioButton1.Checked then
    begin
        adoquery3.SQL.Clear;
        adoquery3.SQL.Add('select * from stu_freetable where '+edit1.text+' <> '+ QuotedStr('')); //修改班级条件
        adoquery3.Active:=true;
        adoquery3.first;

        richedit1.lines.add('以下学生已记录！记录数：'+ inttostr(Adoquery3.recordcount));
        richedit1.Font.Color:=clblack;
        while not adoquery3.eof do
        begin
            richedit1.lines.add(adoquery3.fieldbyname('学生姓名').asstring);
            adoquery3.next;
        end;
    end;
end
else
    begin
    if RadioButton2.Checked then
    begin
        adoquery3.SQL.Clear;
        adoquery3.SQL.Add('select * from stu_freetable where 班级 ='''+ combobox1.Text+''' and '+edit1.text+' = '+ QuotedStr(''));//修改班级条件
        adoquery3.Active:=true;
        adoquery3.first;

        richedit1.lines.add('以下学生还没有记录！记录数：'+ inttostr(Adoquery3.recordcount));
        richedit1.Font.Color:=clnavy;
        while not adoquery3.eof do
        begin
            richedit1.lines.add(adoquery3.fieldbyname('学生姓名').asstring);
            adoquery3.next;
        end;
    end;

    if RadioButton1.Checked then
    begin
        adoquery3.SQL.Clear;
        adoquery3.SQL.Add('select * from stu_freetable where 班级 ='''+ combobox1.Text+''' and '+edit1.text+' <> '+ QuotedStr('')); //修改班级条件
        adoquery3.Active:=true;
        adoquery3.first;

        richedit1.lines.add('以下学生已记录！记录数：'+ inttostr(Adoquery3.recordcount));
        richedit1.Font.Color:=clblack;
        while not adoquery3.eof do
        begin
            richedit1.lines.add(adoquery3.fieldbyname('学生姓名').asstring);
            adoquery3.next;
        end;
    end;
    end;

end;

end.
