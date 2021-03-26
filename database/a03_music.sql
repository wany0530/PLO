
/* ######가수###### */
INSERT INTO P_ARTIST VALUES(P_ARTIST_NO_SEQ.NEXTVAL, '권진아', '여성', '솔로', '/z00_imgs/artist/kwonjinah.jpg');
INSERT INTO P_ARTIST VALUES(P_ARTIST_NO_SEQ.NEXTVAL, '아이유 (IU)', '여성', '솔로', '/z00_imgs/artist/iu.jpg');
INSERT INTO P_ARTIST VALUES(P_ARTIST_NO_SEQ.NEXTVAL, '슈프림팀', '남성', '듀오', '/z00_imgs/artist/supremeteam.jpg');
INSERT INTO P_ARTIST VALUES(P_ARTIST_NO_SEQ.NEXTVAL, '심규선 (Lucia)', '여성', '솔로', '/z00_imgs/artist/lucia.jpg');
INSERT INTO P_ARTIST VALUES(P_ARTIST_NO_SEQ.NEXTVAL, 'AKMU (악동뮤지션)', '혼성', '듀오', '/z00_imgs/artist/akmu.jpg');
INSERT INTO P_ARTIST VALUES(P_ARTIST_NO_SEQ.NEXTVAL, '마마무 (Mamamoo)', '여성', '솔로', '/z00_imgs/artist/iu.jpg');
INSERT INTO P_ARTIST VALUES(P_ARTIST_NO_SEQ.NEXTVAL, '못', '남성', '그룹', '/z00_imgs/artist/mot.jpg');
INSERT INTO P_ARTIST VALUES(P_ARTIST_NO_SEQ.NEXTVAL, '보이(VOY)', '그룹', '솔로', '/z00_imgs/artist/voy.jpg');
INSERT INTO P_ARTIST VALUES(P_ARTIST_NO_SEQ.NEXTVAL, '브레이브걸스', '여성', '그룹', '/z00_imgs/artist/bravegirls.jpg');
INSERT INTO P_ARTIST VALUES(P_ARTIST_NO_SEQ.NEXTVAL, '10CM', '남성', '솔로', '/z00_imgs/artist/10cm.jpg');
INSERT INTO P_ARTIST VALUES(P_ARTIST_NO_SEQ.NEXTVAL, '장범준', '남성', '솔로', '/z00_imgs/artist/jangbeomjune.jpg');
INSERT INTO P_ARTIST VALUES(P_ARTIST_NO_SEQ.NEXTVAL, 'BLACKPINK', '여성', '그룹', '/z00_imgs/artist/blackpink.jpg');

/* ######앨범 ##########*/
INSERT INTO P_ALBUM 
	VALUES(P_ALBUM_NO_SEQ.NEXTVAL, 'Fly away', '싱글', to_date('2017.05.02','yyyy.mm.dd'),
	       '/z00_imgs/album/Fly_away.jpg', '‘여성 솔로 치트키’ 권진아 자작곡 ‘Fly away’로 화려한 비상
- 상쾌한 멜로디의 ‘청량한 팝 사운드’, 권진아가 전하는 산뜻한 봄 인사',1);
INSERT INTO P_ALBUM 
	VALUES(P_ALBUM_NO_SEQ.NEXTVAL, '최고의 사랑 OST - Part.4', 'OST', to_date('2011.05.25','yyyy.mm.dd'),
	       '/z00_imgs/album/best_love_ost.jpg', 'MBC 수목미니시리즈 최고의 사랑 OST
실력파 소녀디바 [아이유]의 자작곡 최초 공개!!! 
“내 손을 잡아”',2);
INSERT INTO P_ALBUM 
	VALUES(P_ALBUM_NO_SEQ.NEXTVAL, 'Ames Room', '미니', to_date('2010.10.01','yyyy.mm.dd'),
	       '/z00_imgs/album/ames_room.jpg', 'Ames Room
(Supreme Team & Brown Eyed Soul 영준)

슈프림팀과 브라운아이드 소울 영준의  Collaboration 앨범 “Ames Room” 
장난끼 가득하지만, 그들만의 성숙한 시선으로 세상을 이야기하는 슈프림팀.
매번 감성 가득한 보이스로 가슴속 깊은 사랑을 들려주는 브라운아이드 소울 영준. 
그들의 만남은 대중들에게 어떤 의미로 다가올까?',3);
INSERT INTO P_ALBUM 
	VALUES(P_ALBUM_NO_SEQ.NEXTVAL, '사춘기 상 (思春記 上)', '미니', to_date('2016.05.04','yyyy.mm.dd'),
	       '/z00_imgs/album/akmu_spring.jpg', '생각에 봄이 깃든 다양한 기록, 악동뮤지션의 사춘기(思春記)

공감되는 일상을 특별한 감성으로 노래하는 악동뮤지션이 새로운 앨범 [사춘기 상(思春記 上)]으로 돌아왔다.

지난 2014년 발매한 데뷔앨범 [PLAY] 이후 2년 만에 돌아온 악동뮤지션은 누구나 한 번쯤 겪게 되는 감정의 ‘사춘기’를 앨범의 타이틀로 삼았다.',5);
INSERT INTO P_ALBUM 
	VALUES(P_ALBUM_NO_SEQ.NEXTVAL, '월령: 上', '싱글', to_date('2020.11.22','yyyy.mm.dd'),
	       '/z00_imgs/album/lunar_phase_aside.jpg', '우리는 디디고 서 있던 땅이 흔들리는 것을 보았습니다.
그리고 모든 연대가 끊어진 뒤에
불안이 각자의 집집마다 끼쳐와
지붕 위를 까맣게 덮는 것도 보았습니다.
올해는 그런 한 해였습니다.
아우성이 도처에 넘치는데
누진 안개가 자욱한 길 위에는
뛰어노는 아이들도 없고 의심만 있었습니다.
모두 숨어있었습니다.',4);	    
INSERT INTO P_ALBUM 
	VALUES(P_ALBUM_NO_SEQ.NEXTVAL, '비선형', '정규', to_date('2017.11.25','yyyy.mm.dd'),
	       '/z00_imgs/album/non_linear.jpg', '못의 정규1집',6);

/* ######곡##########*/
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, 'Fly away(Inst.)', 0, '/z00_imgs/album/Fly_away.jpg',
		   '하루 종일 엉망이었었어
일어나서부터 기분이 뭐 같았어
아침을 먹는데 확인한 핸드폰엔
밤사이 와있는 네 문잘 보고선
기분을 잡쳤어
또다시 날 찔러보는 네가
뻔히 보여서
거지 같지 그다지 썩 반갑지 않으니까
네가 힘들어하는지 어떤지
이젠 아무렇지도 않아 오 난
하나도 안 미안해서 미안해
I''m gonna fly away gonna fly away
마음은 한결 가볍지
날아갈 듯 가볍지
I''ll never cry again yeah I''ll never cry again
이제 훌훌 털어버리고
흔들렸어 솔직히 좋았어 너의 연락이
외롭고 힘들 때 항상 넌
내 옆에 없었어
누구보다 소중했던 너 땜에
깨달은 게 하나 있어
나도 역시 내가 제일 중요해
I''m gonna fly away gonna fly away
마음은 한결 가볍지
날아갈 듯 가볍지
I''ll never cry again yeah I''ll never cry again
이제 훌훌 털어버리고
매일 밤 너를 그리던 내가
이젠 더 이상 나는 널 찾지 않아
왜 억울해 미안해 웃기지 말아
절대 나는 돌아가지 않아
너도 아팠겠지만 과연
나만큼이었을까
언젠가 너를 생각하면 한번 피식
웃고 말겠지
Gonna fly away gonna fly away
마음은 한결 가볍지
날아갈 듯 가볍지
I''ll never cry again yeah I''ll never cry again
이제 훌훌 털어버리고
Gonna fly away gonna fly away
마음은 한결 가볍지
날아갈 듯 가볍지
Never cry again yeah
훌훌 털어버리고
여름은 모두 끝났지
다시 오지 않겠지
I''ll never cry again yeah I''ll never cry again
이제 웃을 일만 남았네', 1);
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, '내 손을 잡아(INST.)', 110, '/z00_imgs/album/best_love_ost.jpg',
		   '느낌이 오잖아
떨리고 있잖아
언제까지 눈치만 볼 거니
네 맘을 말해봐
딴청 피우지 말란 말이야
네 맘 가는 그대로
지금 내 손을 잡아
어서 내 손을 잡아
우연히 고개를 돌릴 때 마다
눈이 마주치는 건
며칠 밤 내내 꿈속에 나타나
밤새 나를 괴롭히는 건
그 많은 빈자리 중에서 하필
내 옆자릴 고르는 건
나도 모르게 어느새 실없는 웃음
흘리고 있다는 건
그럼 말 다했지 뭐
우리 얘기 좀 할까
느낌이 오잖아 떨리고 있잖아
언제까지 눈치만 볼 거니
네 맘을 말해봐
딴청 피우지 말란 말이야
네 맘 가는 그대로
지금 내 손을 잡아
핸드폰 진동에
심장이 덜컥내려 앉는다는 건
오 나도 모르게
어느새 짓궂은 네 말투
자꾸 듣고 싶은걸
어떡해
저기 멀리 걸어온다
눈이 마주친다
언제까지 넌 모른척 할거니
사랑이 온거야 너와 나 말이야
네가 좋아 정말 못 견딜 만큼
그거면 된거야
더는 생각하지 말란 말이야
네 맘 가는 그대로
느낌이 오잖아 떨리고 있잖아
언제까지 눈치만 볼 거니
네 맘을 말해봐
딴청 피우지 말란 말이야
네 맘 가는 그대로
지금 내 손을 잡아
그냥 내 손을 잡아
지금 내 손을 잡아
', 2);
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, '그땐 그땐 그땐(INST)', 100, '/z00_imgs/album/ames_room.jpg',
	'yeah Supreme Team
Secret K Brown Eyed Soul
I miss u baby
내가 잘못 했어 그 지겨운 말
억지로 널 붙잡고 흐느껴 운 날
내 진심은 닳아버렸어
그런 순간들을 모면하는 법까지
연기일 수밖에
물론 넌 그런 나를 알고 있었기에
얼굴 붉히는 일 없이 더 이상 기회는
없을 거라고 단정하며
오히려 차분하게 날 떠났어
그땐 지쳐있었어 나의 너를
안아주기엔 자격조차 없었거든
사랑보단 안정감이 더 커서 마음만
아슬하게 걸쳐있었을 뿐 아름다운
너에게 난 상처가 되기 싫었어
나쁜 놈으로 남기 싫어서
끝내는 되돌릴 방법하나
생각 못하고 너를 그냥 보냈잖아
나를 녹여 주던 너의 그 눈물도
이젠 내 맘을 얼게하네
빛을 담고 있던 너의 그 미소도
졸린 내 눈에 가리워지네
정말 답답해 왜 이런 건지
그땐그땐그땐 좋았었는데
정말 비참해 내 앞의 너를
그땐그땐그땐 사랑했는데 깨끗이 잊는 법
상처 다 아문 척 이제는 진짜 새로운 만남
시작해도 되는 때라고 말은 한다만
내 맘 같지 않아 어차피
사랑 이란게 다 애들 장난
같은 거라 말하며 날 억지로 위로해
그래 이 꼴엔 그런 구차함도 필요해
똑같은 곳에서 일하고
똑같은 침대에서 잠을 자고
예전과 다를 것 없이
지내지만 딱 한 가지가 다르지
더 그럴듯한 변명거리나
날 미치도록 몰두하게 할 일들이 뭐가 있을까
어떻게 텅비어버린 날 채울까
나를 녹여 주던 너의 그 눈물도
이젠 내 맘을 얼게하네
빛을 담고 있던 너의 그 미소도
졸린 내 눈에 가리워지네
정말 답답해 왜 이런 건지
그땐그땐그땐 좋았었는데
정말 비참해 너와 나 정말
그땐그땐그땐 사랑했는데
내가 똑바로 서있지 못하거나
불안한 모습 보인다거나
그럴 땐 누가 날 안아줄지
그땐 누가 날 안아줄지
내가 똑바로 서있지 못하거나
불안한 모습 보인다거나
그럴 땐 누가 날 안아줄지
그땐 누가 날 안아줄지
비틀비틀비틀 시간은 흐르고
빛바랜 꿈은 지워지고
빙글빙글빙글 내 맘은 겉돌고
사랑한 날은 멀어져가고
정말 답답해 왜 이런 건지
그땐그땐그땐 좋았었는데
정말 비참해 내 앞의 너를
그땐그땐그땐 사랑했는데
견뎌내는 것도 널 지우는 것도
후회하는 것도 변한 게 하나 없어
견뎌내는 것도 널 지우는 것도
후회하는 것도 변한 게 하나 없어
견뎌내는 것도 널 지우는 것도
후회하는 것도 변한 게 하나 없어
견뎌내는 것도 널 지우는 것도
후회하는 것도 변한 게 하나 없어', 3);
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, 'RE-BYE', 100, '/z00_imgs/album/akmu_spring.jpg',
		   'Re e e bye 미련 없이
손을 흔들어 Re bye
Re e e bye 그땐 그때
이땐 이때 Re bye
익숙해 날 오고 가는 발걸음
헤어지는 인사에 미숙해 보이는 것만큼
부끄러운 게 없는 걸
익숙해 날 보고 가는 시선들
주위 모든 여자 날
야속해 해 But It''s OK
부끄러울 게 없는 걸
Oh 눈물로 보낼 필요 없어
자욱한 안개만 남을 뿐
눈물로 흘려보낸 시간이 녹아 남은 건 어디에
Re e e bye 미련 없이
손을 흔들어 Re bye
Re e e bye 그땐 그때
이땐 이때 Re bye 뒤돌아서면 그걸로
THE END Re bye
익숙해 날 오고 가는 발걸음
헤어지는 인사에 미숙해 보이는 것만큼
부끄러운 게 없는 걸 보기 드물어진 정
찾기 힘들어 진정한 partner
놔둬 봐 진정이 안 돼
이미 상한 빈정 많이 나누는 사람이
바보라 불리는 시대를 보시게 두 손에 남은 것
손해만 흥건히 남길 바에
인사는 간단하게 간당간당하게
맘에 문은 깐깐하게 방이 좀 깜깜하네
속을 들키면 Game over
할 수 없이 널 속여
여기까지가 납니다 수상해 냄새가 납니다
Oh 눈물로 보낼 필요 없어
자욱한 안개만 남을 뿐
눈물로 흘려보낸 시간이 녹아 남은 건 어디에
Re e e bye 미련 없이
손을 흔들어 Re bye
Re e e bye 그땐 그때
이땐 이때 Re bye 뒤돌아서면 그걸로
THE END Re bye', 4);
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, '사람들이 움직이는 게', 80, '/z00_imgs/album/akmu_spring.jpg', 
	'사람들이 움직이는 게 신기해
팔다리가 앞뒤로 막
움 움 움 움직이는 게
숨 크게 들이쉬면 갈비뼈 모양이
드러나는 것도
내쉬면 앞사람이 인상 팍 쓰며
코를 쥐어 막는 것도 놀라와 놀라와 놀라와
Amazing
어릴 때 내 발 도장 보니
완전 꼬맹이 브이하고 찍은 픽쳐를 보니
나인가 싶은 코흘리개
뭐 먹고 이렇게 훌쩍 컸나 보냐
우리 엄마 아빠 사랑 먹고
이리 잘 컸나 보다 그 수많은 생물 중에
인간이라서 참 다행이야
장난감으로 태어났다면
혼자 움직이지도 못할 텐데
생각만 해도 끔찍해
그러고 보니 내 심장은 어떻게
bounce bounce 해
사람들이 움직이는 게 신기해
팔다리가 앞뒤로 막
움 움 움 움직이는 게
숨 크게 들이쉬면 갈비뼈 모양이
드러나는 것도
내쉬면 앞사람이 인상 팍 쓰며
코를 쥐어 막는 것도 놀라와 놀라와 놀라와
Shall we dance Dance
Move move move all right
팔다리가 앞뒤로 move around
Move move move all right
Say yeah 손발로 막 치고 박고
두 다리로 공 차고 받고 했던
내 익숙하던 몸뚱어리가 낯설게 느껴질 땐
몸치고 박치고 다 하나같이 쿵쿵짝
호키포키 clap your 궁둥짝
누구라도 한 번쯤은 다 생각해보는 Right
Who am I Who are you
그 수많은 생물 중에 인간이라서 참 다행이야
돌덩어리로 태어났다면
이리저리 치이고 굴러
떼굴떼굴 떨어지고 말 텐데
생명이란 건 참으로 신비해
사람들이 움직이는 게 Jump
사람들이 움직이는 게 신기해
팔다리가 앞뒤로 막
움 움 움 움직이는 게
숨 크게 들이쉬면 갈비뼈 모양이
드러나는 것도
내쉬면 앞사람이 인상 팍 쓰며
코를 쥐어 막는 것도 놀라와 놀라와 놀라와
Let''s dance Dance
Move move move all right
팔다리가 앞뒤로 move around
Move move move all right
Say yeah', 4);
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, '새삼스럽게 왜', 0, '/z00_imgs/album/akmu_spring.jpg', 
	'Haughty girl 너는 어려워
도도해서 그런가 봐
Unfriendly girl 우린 그냥
인사만 주고받는 사이
근데 그 사이에 사랑이 오갔나
우린 꽤 오래 계속 그냥
알고만 지냈던 사이
딱 그 정도 한 번도
진심 어린 말 없었던 거야
넌 눈치가 없는건지
백 번의 눈짓에도
고개 한 번 끄덕하지 않았는데
Nod for me
새삼스럽게 왜 그러는 거야
안 하던 농담도 하고
오늘 좋은 일 있었나 봐
새삼스럽게 이러지 마세요 내가
내가 오해할까 봐 그래
오해할까 봐
신비한 걸 널 모르겠어
네 눈빛을 보면 기분이 묘해지면서
멍 멍 때리게 돼
신기한 걸 우리 그냥
인사만 주고받았는데
그새 사랑이 오갔나
기대하지 않고 있을게
아주 작게 달라진 너의 행동에도
오만가지 생각이 다 드는 걸
알 수만 있다면
정말 이게 사랑인 걸까
새삼스럽게 왜 그러는거야
안 하던 농담도 하고
오늘 좋은 일 있었나 봐
새삼스럽게 이러지 마세요
내가 내가 오해할까 봐 그래
내가 좋다면 좋다고
아니라면 아니라고 해
사람 헷갈리게 하지 마 이 바보야
좋다면 좋다고
아니라면 아니라고 해
하라고 이 바보야
사귈건지 말건지
툭툭 던지지 말고 표현 좀 하라고 이
내가 오해하는 것 같잖아', 4);
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, '초록창가', 60, '/z00_imgs/album/akmu_spring.jpg', 
	'초록창가 사이 꽉 채워진 무지개
빨주노초파남보 구름 위 둥실둥실
초록창가 틈새로 날아온 편지지
동쪽서 불어온 바람 타고 둥실둥실
Fly away 손가락 끝에 닿는
멜로디를 잡고
Flow away 발끝을 적시는
파란 물결을 타고
좁고 멀고 험해 너가 가고자 걷는 길은
맘 뜻대로 안 돼 속상하지
너가 알아서 다 할 텐데
뭐가 그리 걱정 불안 불만
의심투성이들인지 좀 믿어줬으면 하지
때문에 너의 방은 그렇게도 지저분해
햇빛 한 줄기 들어오지도 않는
쾨쾨한 곳에서
어떻게 네 꿈을 꾸밀
계획이었어 man
Everybody wanna know
간절히 원하면 이뤄내리라는
별 말도 안 될 소린 누가 지어냈을까
해도 여전히 두 손 모아 praying
아무도 모르게 너에게 다가가
발자국 소리도 못 듣게 날아가
푸르스르름한 손길로 너에게
행운을 빌어줄게 그래 믿어봐
초록창가 사이 꽉 채워진 무지개
빨주노초파남보 구름 위 둥실둥실
초록창가 틈새로 날아 온 편지지
동쪽서 불어온 바람 타고 둥실둥실
Fly away 손가락 끝에
닿는 멜로디를 잡고
Flow away 발끝을 적시는
파란 물결을 타고
난 포기 하지 않아
누가 뭐래도 근심 갖지 않아
심각지 말아 남들이 말하는 앞선 추측에
너의 나가야 할 곳은
저 환한 창가 밖인걸
너가 나와야 모든 세상이 바뀌어
뻥치고 있네 이미 속을 만큼 속았어
성공한 자들의 성공 후에 과장된
성공담은 이미 불을 만큼 불었어
팅팅
큰 코 다 깨지고 낙담한 지 오래인걸
시간은 계속 떨어지는 모래인걸
누가 내게 진실을 말해줘
여전히 나를 믿고 싶어
광활한 초록 들판에
널 감싼 거짓말 털털 털어
고민 같은 건 민들레 꽃 접시 위에
모두 덜덜 덜어
Everybody wanna know
간절히 원하면 이뤄내리라는
별 말도 안될 소린 누가 지어냈어도
한 번 더 나를 믿어줘
초록창가 틈새로 날아 온 편지지
동쪽서 불어온 바람 타고 둥실둥실
초록창가 사이 꽉 채워진 무지개
빨주노초파남보 구름 위 둥실둥실
초록창가 틈새로 날아 온 편지지
동쪽서 불어온 바람 타고 둥실둥실', 4);
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, '사소한 것에서', 45, '/z00_imgs/album/akmu_spring.jpg', 
	'잠은 꽤나 잔 것 같은데
또 나오는 하품
저 멀리 나뒹구는 베개와
침대 밑 이불이 내 작품
큰 입 덥석 물리곤
나올 줄 모르는 칫솔과
한 잎만 떨어져도 금방 티나는 앙상한 화초
정말 아름다운 건 내가 선 곳에 있는데
미처 발견 못 하고
지나치는 사람들
다소 식상해 보였던 것 안에
혹은 당연한 일상을 돌아본다면
마치 한 잔의 쉐이크처럼
잊은 듯 아무렇지 않은 척해도
쓰린 사랑의 아픔
아무 이유 없이 반항하곤 했던
사춘기의 질풍
큰 잎이 떨어지면 고개를 내밀던 가을과
한 닢의 동전도 소중했던
어린 시절 나의 친구들과의 추억
정말 아름다운 건 내가 선 곳에 있는데
미처 발견 못 하고
지나치는 사람들
다소 식상해 보였던 것 안에
혹은 당연한 일상을 돌아본다면
마치 한 잔의 쉐이크처럼
shake it shake it oh shake it shake it
shake it
shake it shake it oh
like glass of shake it shake it
shake it shake it oh shake it shake it
shake it
shake it shake it oh
like glass of shake it shake it
쉴 틈 없는 달리기에
못 보고 간 꽃들
빈틈없는 지하철에서 옮아 온 고뿔
어쩌면 이런 사소한 것에서
세상이 달라지는지도 몰라', 4);
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, '주변인', 12, '/z00_imgs/album/akmu_spring.jpg', 
	'여기에도 저기에도 나 있을 곳 없다
가까워도 먼 우리 사이
사람들은 모두 내가 달라졌다고 해
내 눈엔 그들이 변했는데
알게 될수록 멀리하고 싶은 세상
그렇다고 벗어날 수도 없는 걸
애써 감추려 하던 걸 어쩌다 보게 된 기분
난 세상 사람 사랑 그 주변에서 맴돌다 맴돌다
주변에서 서성이다 서성이다가
막힌 속을 뚫으려고 밖을 나서도 맞아주는 건
차가운 밤공기뿐 주변에서 맴돌다 돈다
아무 사람도 내 말에 끄덕이지 않아
웃어주는 게 뭐 어렵다고
사람들은 모두 내가 외계인 같다 해
차라리 진짜면 이해가 돼
알게 될수록 멀리하고 싶은 세상
그렇다고 벗어날 수도 없는 걸
애써 감추려 하던 걸 어쩌다 보게 된 기분
난 세상 사람 사랑 그 주변에서 맴돌다 맴돌다
주변에서 서성이다 서성이다가
막힌 속을 뚫으려고 밖을 나서도 맞아주는 건
차가운 밤공기뿐 주변에서 맴돌다 돈다
큰 품을 떠나서 본 세상은 다르네
거울에 비친 다른 애 사랑받지 못하는 아이
아님 내가 착각해
Father 이젠 혼자 할 수 있어요
Do you understand You said I do
But I''m still staying around
나만 떨어져 있어 Am I desperado
주변에서 맴돌다 두 손에 잡은 핸들과
방향을 두고 씨름을 해 아직은 힘이 약해 난
주변에서 서성이다
네 닿을 곳은 저 섬이라
가리키는 손가락 끝은 너무나 외로워 보이네
그 주변에서 맴돌다 맴돌다
주변에서 서성이다 서성이다가
막힌 속을 뚫으려고 밖을 나서도 맞아주는 건
차가운 밤공기뿐 주변에서 맴돌다 돈다
', 4);
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, '월령 月齡', 147, '/z00_imgs/album/lunar_phase_aside.jpg', 
	'마치 달의 뒷면처럼 
외로웠던 나에겐
너의 더운 손이 
꼭 구원 같았어
내가 가진 것과 
가질 것을 다 주어도
정말 상관없다고 믿었어

그래 인정해 그 밤들은 
너무 아름다웠어
저기 아침이 잔인하게 오는데
네게 찔리고 아문 자릴 
다시 찔린 후에야
내가 변해야 하는 걸 알았어

이제 나의 어둠은 
내가 밝힐 거야
누가 나를 비춰주길 
바라지 않을 거야
잃어버렸던 내 모습을 
다시 되찾기로 할래
스스로 번지며 
차오를 때까지

차갑게 차갑게 
더운 숨을 식히네
파랗게 때론 창백하게
휘영청 까맣던 밤의 
허릴 베어와
다시 보름 또 보름마다
마다 마다

그래 인정해 그날들은
내겐 눈이 부셨어
이른 이별이 
잔인하게 웃는데
네가 할퀴고 아문 자릴 
다시 할퀸 뒤에야
너를 떠나야 하는 걸 알았어

이제 나의 어둠은 
내가 밝힐 거야
바보같이 나를 탓하며 
울지 않을 거야
잃어버렸던 내 모습을 
다시 되찾기로 할래
스스로 번지며 차오를래 다시

어마어마한 별들이 이 순간
나의 암청빛 하늘에 숨어 
빛을 내고 있어
홀로 만월의 달처럼 어엿한
나를 되찾으려 제발 이제

이제 나의

이제 나의 어둠은 
내가 밝힐 거야
네가 나를 비춰주길 
바라지 않을 거야
잃어버렸던 내 모습을 
다시 되찾기로 하네
스스로 번지며 차오를게 다시

이제 나의 어둠은 
내가 밝힐 거야', 5);
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, '생존약속 生存約束', 12, '/z00_imgs/album/lunar_phase_aside.jpg', 
	'생은 삶의 한 가운데에서
가장 소중한 것을 
앗아가 버린다
그건 내가 
살아있기 위해 필요한
어쩌면 유일한 것이었어

그렇게 죽고 싶을 만큼 
아팠던 것은
그만큼 살고 싶다는 증거
엉뚱한 곳에서 
이유를 찾아 헤매며
소진했던 옛날이여

우린 영혼을 뺏긴 뒤에도
살아남는 법들을 
새롭게 배운다
어찌어찌해 
우린 아직 살아있고
내일도 분명히 그럴 거야

날뛰며 쏟아져 
내리며 밤을 뒤덮고
목소리보다 먼저 
번져가는 메아리
우린 무엇을 위해 살며
노래합니까 이토록 
불안한 시대에

그렇게 죽고 싶을 만큼 
아팠던 것은
그만큼 살고 싶다는 증거
엉뚱한 곳에서 
이유를 찾아 헤매며
소진했던 옛날이여

내일은 분명 오늘과 
똑같을 테지만
하나만 약속해 줄래 내게
그렇게 죽고 싶을 만큼 
아플 때마다
싸워보겠다고
늘 이길 수는 없다 해도', 5);
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, '창백한 푸른 점 (Pale blue dot)', 54, '/z00_imgs/album/lunar_phase_aside.jpg', 
	'아주 멀리 있는 
별들의 붕괴와 탄생을
우리가 알아챌 수 없듯이
바로 곁에 있는 
서로의 분열과 탄식도
우리는 알아챌 수 없었네

너는 존재하네 
짙고 검은 공허 속에서
나의 창백한 푸른 점으로
서로 일으키고 
끌어안고 무너뜨리며
나의 창백한 푸른 점으로
빛을 내

약속된 낙원으론 
그 언제 갈 수 있을까
불타는 숲에 서서 
올려다 본 하늘은
푸르지 않아 더 이상

지진과 해일
무너지는 빙하
폭발하는 분화구

시위와 분노
가난과 질병
그래 하지만 하지만

아직 우리가 무언가
뭔가 해 볼 수 있다면
너무 늦었단 건 알고 있어
하지만 하지만
말하지 마 하지 마

우리는 존재하네 
짙고 검은 공허 속에서
하나의 창백한 푸른 점으로
서로 일으키고 끌어안고 
다시 무너뜨리며
하나의 창백한 푸른 점으로
나의 창백한 푸른 점으로
빛을 내', 5);

SELECT * FROM P_ARTIST;
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, '날개', 89, '/z00_imgs/album/non_linear.jpg', 
	'우린 떨어질 것을 알면서도
더 높은 곳으로만 날았지
처음 보는 세상은 너무 아름답고 슬펐지
우린 부서질 것을 알면서도
더 높은 곳으로만 날았지
함께 보낸 날들은 너무 행복해서 슬펐지
우린 차가운 바람에 아픈 날개를 서로 숨기고
약속도 다짐도 없이 시간이 멈추기만 바랬어
우린 부서질 것을 알면서도
더 높은 곳으로만 날았지
함께 보낸 날들은 너무 행복해서 슬펐지
우린 서툰 날갯짓에 지친
어깨를 서로 기대고
깨지 않는 꿈 속에서
영원히 꿈꾸기만 바랬어
우린 떨어질 것을 알면서도
더 높은 곳으로만 날았지
처음 보는 세상은 너무 아름답고 슬펐지', 6);
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, 'RE-BYE', 34, '/z00_imgs/album/lunar_phase_aside.jpg', 
	'.', 4);


INSERT INTO P_MUSIC_GENRE VALUES(6,5);
INSERT INTO P_MUSIC_GENRE VALUES(7,2);
INSERT INTO P_MUSIC_GENRE VALUES(8,4);
INSERT INTO P_MUSIC_GENRE VALUES(9,1);
INSERT INTO P_MUSIC_GENRE VALUES(10,7);
INSERT INTO P_MUSIC_GENRE VALUES(11,6);
INSERT INTO P_MUSIC_GENRE VALUES(12,8);
INSERT INTO P_GENRE VALUES(7, '인디 팝');
INSERT INTO P_GENRE VALUES(8, '팝');

SELECT * FROM P_MUSIC;
SELECT pl.alb_no, ALB_NAME, ALB_IMG, art_name ,art_group, M_NAME, genre_name
  FROM P_ALBUM pl, P_ARTIST pr, P_MUSIC pm,
	   P_GENRE pg, P_MUSIC_GENRE pmg
 WHERE pl.ALB_NO = pm.ALB_NO
   AND pl.ART_NO = pr.ART_NO
   AND pg.GENRE_CODE = pmg.GENRE_CODE
   AND pm.M_NO = pmg.M_NO
   AND pl.ALB_NO = 4;
  
