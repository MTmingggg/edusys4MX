unit lrsinglemath;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Mask, Vcl.DBCtrls, SRVControl, SRVButton, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, SRVLabel, Vcl.Imaging.jpeg;

type
  TForm15 = class(TForm)
    DataSource1: TDataSource;
    Bevel1: TBevel;
    Edit1: TEdit;
    DBEdit1: TDBEdit;
    ADOQuery1: TADOQuery;
    SRVButton1: TSRVButton;
    SRVButton2: TSRVButton;
    DBGrid1: TDBGrid;
    Image1: TImage;
    GroupBox1: TGroupBox;
    SRVLabel1: TSRVLabel;
    SRVLabel2: TSRVLabel;
    SRVLabel3: TSRVLabel;
    SRVLabel4: TSRVLabel;
    Bevel2: TBevel;
    Button1: TButton;
    DBText1: TDBText;
    SRVLabel5: TSRVLabel;
    SRVLabel6: TSRVLabel;
    SRVLabel7: TSRVLabel;
    procedure SRVButton1Click(Sender: TObject);
    procedure SRVButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

{$R *.dfm}

procedure TForm15.Button1Click(Sender: TObject);//ˢ���ܱ�
begin
//adoquery1.SQL.Clear;//��ʼ������ѧ����Ϣ����һ�κ��ֶ����
//adoquery1.SQL.Add('insert into stu_math(ѧ��,ѧ������) (select stu_info.ѧ��,ѧ������ from stu_info)');
//ADOQuery1.ExecSQL;

adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from  stu_math');
adoquery1.Active:=true;
dbedit1.DataField:='';
dbedit1.Enabled:=false;
end;

procedure TForm15.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key=13) then
    dbgrid1.DataSource.DataSet.Next;
end;

procedure TForm15.FormClose(Sender: TObject; var Action: TCloseAction);
begin
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from  stu_math');
adoquery1.Active:=true;

edit1.Text:='';
dbedit1.DataField:='';
dbedit1.Enabled:=false;
end;

procedure TForm15.SRVButton1Click(Sender: TObject);
begin
if edit1.text<>'' then
    begin
    if Adoquery1.FieldList.IndexOf(edit1.text) < 0 then//ѯ���Ƿ񴴽�����
        begin
        if Application.messagebox('        �����ڸÿ��������Ƿ��½���      ','��ʾ' ,MB_YESNO or MB_iconwarning)=6 then
            begin
            adoquery1.Active:=false;
            adoquery1.SQL.Clear;
            adoquery1.SQL.Add('alter table stu_math add '+''+edit1.text+''+' varchar(3) NULL');
            ADOQuery1.ExecSQL;

            adoquery1.SQL.Clear;
            adoquery1.SQL.Add('select ѧ������,'+''+edit1.text+''+' from stu_math');
            adoquery1.Active:=true;

            dbedit1.DataField:=edit1.text;
            dbedit1.Enabled:=true
            end;
        end
    else//��λ�У�ָ����ʾ
        begin
        adoquery1.Active:=false;
        adoquery1.SQL.Clear;
        adoquery1.SQL.Add('select ѧ������,'+''+edit1.text+''+' from  stu_math');
        adoquery1.Active:=true;
        adoquery1.open;

        dbedit1.DataField:=edit1.text;
        dbedit1.Enabled:=true
        end;
    end
else
    messagebox(handle,'        �����뿼����      ','��ʾ' ,MB_OK or MB_iconwarning);
end;

procedure TForm15.SRVButton2Click(Sender: TObject);
begin
if edit1.text<>'' then
    if Adoquery1.FieldList.IndexOf(edit1.text) >= 0  then
        begin
        if Application.messagebox('        �Ѵ��ڸÿ��������Ƿ���ת�ü�¼��      ','��ʾ' ,MB_YESNO or MB_iconwarning)=6 then
            begin
            adoquery1.Active:=false;
            adoquery1.SQL.Clear;
            adoquery1.SQL.Add('select ѧ������,'+''+edit1.text+''+' from  stu_math');
            adoquery1.Active:=true;
            adoquery1.open;

            dbedit1.DataField:=edit1.text;
            dbedit1.Enabled:=true
            end;
        end
    else
        begin
        adoquery1.Active:=false;
        adoquery1.SQL.Clear;
        adoquery1.SQL.Add('alter table stu_math add '+''+edit1.text+''+' varchar(3)');
        ADOQuery1.ExecSQL;

        adoquery1.SQL.Clear;
        adoquery1.SQL.Add('select ѧ������,'+''+edit1.text+''+' from stu_math');
        adoquery1.Active:=true;

        dbedit1.DataField:=edit1.text;
        dbedit1.Enabled:=true
        end
else
    messagebox(handle,'        �����뿼����      ','��ʾ' ,MB_OK or MB_iconwarning);
end;

end.
