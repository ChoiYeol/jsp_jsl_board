# jsl_board   from jsp

CRUD 란 create , read , update , delete 로서 기본적으로 생성 읽기 수정 삭제 를 의미합니다.
proc 란 process의 약어로 crud를 실행할때 구분자를 두어 한 파일안에서 실행하기 위한 jsp파일입니다.

Board CRUD        use language html, js, css, jsp , jquery  사용하였습니다. 

Session 폴더 : Session값으로 id 구분을 해주어 관리자인지 아닌지 비교합니다.

notice 폴더 : 공지사항입니다. 공지사항의 CRUD를 proc에서 실행합니다. 관리자만 가능합니다.

news 폴더 : 홈페이지 대상의 외부소식 (뉴스 , 라디오) 등의 매체를 통해서 기정된 사실을 올립니다. notice와 기능은 같습니다.

freeboard 폴더 : 관리자 이외의 유저가 게시글을 올림. notice와 기능은 같음

qanda 폴다 : Q & A 폴더로 유저가 질문하고 관리자가 답변하는 형태 notice와 같은기능에 관리자만 답글을 달수있고
             그 이후는 수정삭제가 불가능하다.  유저는 본인것만 수정 삭제 할 수있다. 

Member 폴더 : sign in-out ,sign up , myinfo , idcheck    로그인 로그아웃 , 회원가입 (아이디 중복 확인), 내정보 확인 및 변경 


root(최상위폴더) : common    -footer, head , sessioninfo , sidebar  웹에 공통으로 사용할 부분을 따로 파일화 한후  include 해줍니다.
                  웹페이지 기본 상태 index 셋팅해줍니다. 
                  commonhead 홈페이지 목차 및 sign in , sign up myinfo 등이 존재합니다. 
                  
web_inf->classes 폴더 :  get set 방식의 변수지정및 호출하는 javafile 과 변수를 사용하여 db값을 호출하는 javafile로 분류하였습니다. 
                         common 을 두어 공통으로 사용해주는  메소드를 java파일로 따로지정하였습니다.
                          (날짜 검사나 페이징 등이있습니다.)
                          
css 폴더 : css파일로 분류하여 공통으로 사용해줄수있는 head footer 

image 폴더 : 이미지 파일들 저장
