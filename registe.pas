unit registe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, SRVControl, SRVLabel, SRVButton,
  SRVEdit;

type
  TForm12 = class(TForm)
    ADOTable1: TADOTable;
    Image1: TImage;
    SRVLabel1: TSRVLabel;
    SRVLabel2: TSRVLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SRVEdit1: TSRVEdit;
    SRVEdit2: TSRVEdit;
    SRVEdit3: TSRVEdit;
    SRVEdit4: TSRVEdit;
    SRVButton1: TSRVButton;
    SRVButton2: TSRVButton;
    GroupBox1: TGroupBox;
    procedure SRVButton2Click(Sender: TObject);
    procedure SRVButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

procedure TForm12.FormCreate(Sender: TObject);
begin
srvedit1.text:='';
srvedit2.text:='';
srvedit3.text:='';
srvedit4.text:='';
end;

procedure TForm12.SRVButton1Click(Sender: TObject);
begin
close;
end;

procedure TForm12.SRVButton2Click(Sender: TObject);
begin
if srvedit1.text='' then
    begin
    //srvedit1.EnabledBorderColor:= clred; ������Ҫ���������������edit��onclick�¼�
    Messagebox(handle,'        ���û�����  ��Ϣ©���ˣ�      ','����',MB_ok or MB_iconwarning);
    exit;
    end;

if srvedit2.text='' then
    begin
    //srvedit2.EnabledBorderColor:= clred;
    Messagebox(handle,'        �����롱  ��Ϣ©���ˣ�      ','����',MB_ok or MB_iconwarning);
    exit;
    end;

if srvedit3.text='' then
    begin
    //srvedit3.EnabledBorderColor:= clred;
    Messagebox(handle,'        ��ȷ�����롱  ��Ϣ©���ˣ�      ','����',MB_ok or MB_iconwarning);
    exit;
    end;

if adotable1.Locate('�û�ID', srvedit1.Text ,[]) then
    Messagebox(handle,'        �û����Ѵ��ڣ�      ','����',MB_ok or MB_iconwarning)
else
    begin
    if srvedit2.Text=srvedit3.Text then
        begin
        adotable1.insert;
        adotable1.FieldByName('�û�ID').AsString:=srvedit1.Text;
        adotable1.FieldByName('����').AsString:=srvedit2.Text;
        adotable1.FieldByName('����ԱȨ��').AsString:=srvedit4.Text;
//        adotable1.FieldByName('����Ա').AsString:=form2.srvedit1.Text;
        adotable1.FieldByName('����Ա').AsString:='������';
        adotable1.Post;
        Messagebox(handle,'        ���û�ע��ɹ���      ','���',MB_ok or MB_ICONINFORMATION);
        srvedit1.text:='';
        srvedit2.text:='';
        srvedit3.text:='';
        srvedit4.text:='';
        end
    else
        Messagebox(handle,'        ������������벻һ�£����������룡      ','����',MB_ok or MB_iconwarning)
    end;
end;


end.
