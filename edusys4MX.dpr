program edusys4MX;

uses
  Vcl.Forms,
  mainpage in 'mainpage.pas' {Form1},
  login in 'login.pas' {Form2},
  lrstujb in 'lrstujb.pas' {Form3},
  lrstuscore in 'lrstuscore.pas' {Form4},
  lrbj in 'lrbj.pas' {Form5},
  lrlesson in 'lrlesson.pas' {Form6},
  lrrchshw in 'lrrchshw.pas' {Form7},
  schstuinfo in 'schstuinfo.pas' {Form8},
  freetable in 'freetable.pas' {Form9},
  schlesson in 'schlesson.pas' {Form10},
  schrchshw in 'schrchshw.pas' {Form11},
  registe in 'registe.pas' {Form12},
  deletead in 'deletead.pas' {Form14},
  lrsinglemath in 'lrsinglemath.pas' {Form15},
  helptxt in 'helptxt.pas' {Form16},
  testDBGridToExcel in 'testDBGridToExcel.pas',
  updatepswd in 'updatepswd.pas' {Form13},
  schmath in 'schmath.pas' {Form17};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(TForm16, Form16);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm17, Form17);
  application.ShowMainForm:=false;
  form2.Show;
  Application.Run;
end.
