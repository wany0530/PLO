-- 회원 수
SELECT count(*) cnt FROM P_USER;

-- 공지사항 수
SELECT count(*) cnt FROM P_NOTICE;

-- FAQ 수
SELECT count(*) cnt FROM P_FAQ;

-- 아티스트 수
SELECT count(*) cnt FROM P_ARTIST;

-- 앨범 수
SELECT count(*) cnt FROM P_ALBUM;

-- 음원 수
SELECT count(*) cnt FROM P_MUSIC;

SELECT * FROM P_PLAYLOG;

-- 페이지별 회원 리스트
SELECT * FROM (
	SELECT ROWNUM num, u.* FROM (
		SELECT * FROM P_USER ORDER BY U_NO
	) u
) WHERE num BETWEEN 1 AND 10;
SELECT * FROM P_USER;
-- 회원 상세
SELECT * FROM P_USER WHERE u_no = 1;
-- 음원 상세
SELECT * FROM P_MUSIC WHERE m_no = 10;
-- 앨범 상세
SELECT * FROM P_ALBUM WHERE alb_no = 1;
-- 아티스트 상세
SELECT * FROM P_ARTIST WHERE art_no = 1;
-- 공지사항 상세
SELECT * FROM P_NOTICE WHERE n_no = 1;
-- FAQ 상세
SELECT * FROM P_FAQ WHERE f_no = 1;

-- 회원 업데이트
UPDATE P_USER
   SET u_pass = ?,
   	   u_name = ?,
   	   u_mail = ?,
   	   u_date = to_date(?, 'yyyy-mm-dd')
 WHERE u_no = ?;

-- 페이지별 아티스트 리스트
SELECT * FROM (
	SELECT ROWNUM num, u.* FROM (
		SELECT * FROM P_ARTIST ORDER BY ART_NO
	) u
) WHERE num BETWEEN 1 AND 10;

SELECT * FROM P_ARTIST;
SELECT * FROM P_USER;
SELECT * FROM P_NOTICE;

-- 아티스트 업데이트
UPDATE P_ARTIST
   SET art_name = 'BLACKPINK',
   	   art_gender = '여성',
   	   art_group = '그룹',
   	   art_img = 'img/aasdf.png'
 WHERE art_no = 5;

-- 페이지별 앨범 리스트
SELECT * FROM (
	SELECT ROWNUM num, alb.* FROM (
		SELECT alb.*, art.art_name
		  FROM P_ARTIST art, P_ALBUM alb
		 WHERE art.art_no = alb.art_no
		ORDER BY alb_no DESC
	) alb
) WHERE num BETWEEN 1 AND 10;

-- 앨범 상세
SELECT alb.*, art.art_name
  FROM P_ARTIST art, P_ALBUM alb
 WHERE art.art_no = alb.art_no
   AND alb.alb_no=2;

SELECT * FROM P_ALBUM;

-- 앨범 업데이트
UPDATE P_ALBUM
   SET alb_name = ?,
   	   alb_shape = ?,
   	   alb_date = to_date(?, 'yyyy-mm-dd'),
   	   alb_img = ?,
   	   alb_intro = ?,
   	   art_no = ?
 WHERE alb_no = ?;
   	   
-- 페이지별 음원 리스트
SELECT * FROM (
	SELECT ROWNUM num, music.* FROM (
		SELECT m.*, a.alb_name
		  FROM P_MUSIC m, P_ALBUM a
		 WHERE m.alb_no = a.alb_no
		ORDER BY a.alb_no DESC
	) music
) WHERE num BETWEEN 1 AND 10;

-- 음원 상세
SELECT m.*, alb.alb_name
  FROM P_MUSIC m, P_ALBUM alb
 WHERE m.alb_no = alb.alb_no
   AND alb.alb_no=2;		
  
  
-- 음원 업데이트
UPDATE P_MUSIC
   SET m_name = ?,
       m_playnum,
       m_path,
       m_lyrics,
       alb_no
 WHERE m_no = ?;

-- 페이지별 공지사항 리스트
SELECT * FROM (
	SELECT ROWNUM num, n.* FROM (
		SELECT * FROM P_NOTICE ORDER BY n_no DESC
	) n
) WHERE num BETWEEN 1 AND 10;

-- 공지사항 상세
SELECT * FROM P_NOTICE WHERE n_no = 1;

-- 공지사항 등록
INSERT INTO P_NOTICE
VALUES(P_NOTICE_NO_SEQ.NEXTVAL, 'test', 'test..',
to_date('2001-11-15', 'yyyy-mm-dd'), 1);


-- 공지사항 업데이트
UPDATE P_NOTICE
   SET n_title = ?,
       n_content = ?,
       n_date = to_date(?, 'yyyy-mm-dd'),
       n_pub = ?
 WHERE n_no = ?;

-- FAQ 검색, 조회
SELECT * FROM (
	SELECT ROWNUM num, faq.* FROM (
			SELECT f.*, code.fc_name
			  FROM P_FAQ f, P_FAQ_CODE code
			 WHERE f.fc_no = code.fc_no
			   AND f_title LIKE UPPER('%%')
			   AND fc_name LIKE UPPER('%%')
		  ORDER BY f_no DESC
		) faq
) WHERE num BETWEEN 1 AND 5;

-- FAQ 업데이트
UPDATE P_FAQ
   SET f_title = ?,
       f_content = ?,
       f_pub = ?,
       fc_no = ?
 WHERE f_no = ?
  
SELECT * FROM P_FAQ_CODE;

-- 장르조회
SELECT * FROM P_FAQ_CODE;


DELETE P_USER WHERE u_no = 1;


DELETE P_ARTIST WHERE art_no = ?
DELETE P_ALBUM WH ERE alb_no = ?
DELETE P_MUSIC WHERE m_no = ?
DELETE P_NOTICE WHERE n_no = ?

-- 유저 등록
INSERT INTO P_USER VALUES(P_USER_NO_SEQ.NEXTVAL, 'admin', 'admin', '관리자', 'admin@naver.com', sysdate);
-- 아티스트 등록
INSERT INTO P_ARTIST VALUES(P_ARTIST_NO_SEQ.NEXTVAL, '아이유', '여성', '솔로', '/img/artist/iu.png');
-- 앨범 등록
INSERT INTO P_ALBUM 
	VALUES(P_ALBUM_NO_SEQ.NEXTVAL, 'Celebrity', '싱글', to_date('2021.01.27','yyyy.mm.dd'),
	       '/img/album/celebrity.png', '아이유(iu) 정규5집 선공개 무려 4년 만에...',1);
-- 장르 등록
INSERT INTO P_GENRE VALUES(1, '댄스 팝');
-- 음악 등록
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, 'Celebrity', 110, '/img/music/celebrity.png',
		   '세상의 모서리 구부정하게 커버린 골칫거리..', 1);
-- 공지사항 등록
INSERT INTO P_NOTICE 
	VALUES(P_NOTICE_NO_SEQ.NEXTVAL, '[서비스 점검] 각 은행...',
		  '안녕하세요. PLO입니다..', to_date('2021.01.02','YYYY.MM.DD'), 1);
-- FAQ 등록
INSERT INTO P_FAQ VALUES(P_FAQ_NO_SEQ.NEXTVAL, '다크 모드는 어떻게 사용하나요', '이제 PLO에서도 ....', 1, 1);