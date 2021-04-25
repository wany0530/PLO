## PLO (음원 서비스 사이트)

## 담당영역

> 차트 관리 ( 인기차트, 최신 차트, 장르별 차트 )
> 
> 장르 상세 페이지
> 

## 기간

> 2021.03.01 ~ 2021.03.30

## 사용 기술
> MVC아키텍처 MVC2 패턴
> 
> Session 처리
> 
> EL & JSTL 라이브러리 사용
> 
> Jquery 라이브러리 사용

#### 데이터 베이스

>총 16개의 테이블로 구성

![image](https://user-images.githubusercontent.com/77144929/115993180-9e43e480-a60c-11eb-857e-d2c171ce193c.png)

#### 차트 관리

* 장르 메뉴바, 차트, 장르 상세 버튼 구성

* 순위, 앨범이미지, 앨범명, 노래제목, 아티스트 정보 출력

* 각 음원별 재생, 재생목록추가, 내 리스트 추가, 더보기 아이콘 존재

* 인기차트, 최신 음악 차트, 장르별 차트 출력

![ezgif com-gif-maker](https://user-images.githubusercontent.com/77144929/115998845-35686680-a624-11eb-892d-1610139e5f24.gif)

### 비로그인 시 
* 음원을 재생하면 1분듣기로 음원 길이가 1분으로 설정.
* 내 리스트 추가 아이콘 클릭시 로그인 modal창 출력.

![ezgif com-gif-maker (6)](https://user-images.githubusercontent.com/77144929/115998372-db66a180-a621-11eb-9fdb-4f25af776768.gif)

### 로그인 시

#### 재생
* 정상적인 음원 재생시간이 설정되어 재생.

* 자동으로 재생목록에 추가

![ezgif com-gif-maker](https://user-images.githubusercontent.com/77144929/115999569-4b2b5b00-a627-11eb-91b4-6a06147f8344.gif)

#### 재생목록
* 재생 되지 않고, 재생목록에만 해당 음원 추가.

![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/77144929/115999545-2b943280-a627-11eb-9523-06aa9b9bcaba.gif)

#### 내 리스트
* 내 리스트 추가 클릭시 존재하는 보관함 정보 출력.
* 존재하는 보관함 클릭시 보관함에 음원 저장
* 새 리스트 추가를 통해 보관함 생성 가능

![ezgif com-gif-maker (2)](https://user-images.githubusercontent.com/77144929/115999777-09e77b00-a628-11eb-9d7f-4540f6d2422d.gif)

#### 더보기
* [더보기] 클릭시 해당 음원의 곡정보(가사, 아티스트 등) 페이지로 이동.

* [앨범정보] 클릭시 해당 음원의 앨범 정보 페이지로 이동.

* [아티스트 정보] 클릭시 해당 음원의 아티스트 정보 페이지로 이동.

* [좋아요] 클릭시 좋아요 보관함에 추가.

![ezgif com-gif-maker (3)](https://user-images.githubusercontent.com/77144929/115999917-e2dd7900-a628-11eb-8a11-b803d13b8b70.gif)

#### 체크박스
* 음원 체크시 modal창을 이용해 [체크해제/재생/재생목록/내 리스트] 박스 출력
* 기능은 동일. 
