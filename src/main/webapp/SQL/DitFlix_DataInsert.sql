# 데이터 추가

# MemberShip 데이터
INSERT INTO membership(usertype, price, quality, maxdevices, canad, candown) VALUES('Free', 0, NULL, 0, FALSE, FALSE);
INSERT INTO membership(usertype, price, quality, maxdevices, canad, candown) VALUES('Basic', 9.500, 'HD 화질 (720p)', 1, FALSE, FALSE);
INSERT INTO membership(usertype, price, quality, maxdevices, canad, candown) VALUES('Standard', 13.500, 'FULL HD 화질 (1080p)', 2, TRUE, TRUE);
INSERT INTO membership(usertype, price, quality, maxdevices, canad, candown) VALUES('Premium', 17.000, '4K UHD + HDR 화질', 4, TRUE, TRUE);
INSERT INTO membership(usertype, price, quality, maxdevices, canad, candown) VALUES('Admin', 0.0, NULL, 0, FALSE, FALSE);

SELECT * FROM content;
# Content 데이터
INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('드래곤 길들이기', '수백년간 지속되어온 바이킹과 드래곤의 전쟁. 드래곤을 없애는 것이 삶의 모든 목적인 바이킹들과 다른 신념을 가진 히컵은 무리 속에 속하지 못하고 족장인 아버지에게도 인정받지 못한다. 그러던 어느 날, 히컵은 베일에 싸인 전설의 드래곤 나이트 퓨어리인 투슬리스와 만나게 되고, 드래곤을 죽이라는 바이킹의 신념을 깨고 투슬리스와 친구가 된다. 하지만 드래곤을 죽여야 된다고 믿는 바이킹 족과 모든 드래곤을 위협하는 더 거대한 존재와 맞닥뜨리게 된 히컵과 투슬리스. 세상을 변화시키기 위한 특별한 여정을 시작하게 되는데... 다르다는 건, 특별하다는 것. 세상을 바꿀 우리들의 모험이 시작된다!', '판타지', '2025', '딘 데블로이스', 'ALL', 'Dragon_poster.webp', 'Dragon_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('릴로&스티치', '보송보송한 파란 솜털, 호기심 가득한 큰 눈, 장난기 가득한 웃음을 가졌지만 가장 위험한 실험체 취급을 받던 스티치는 우주에서 도망쳐 지구의 하와이 섬에 불시착하게 된다. 단짝 친구를 원하던 외톨이 소녀 릴로는 별똥별과 함께 나타난 귀여운 파란색 강아지 스티치와 소중한 친구이자, 하나의 가족이 되어가며 외로웠던 일상이 유쾌하게 변하기 시작한다. 그러던 어느 날, 스티치를 잡아 우주로 되돌아가려는 정체불명의 요원들이 등장하고 릴로와 스티치는 예상치 못한 상황을 마주하게 되는데..!', '애니메이션', '2025', '딘 플레이셔 캠프', 'ALL', 'Stitch_poster.webp', 'Stitch_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('나 혼자만 레벨업 -리어웨이크닝-', '다른 차원과 이쪽 세계를 이어 주는 통로인 게이트가 갑자기 발생한 지 10여 년. 세계에는 헌터라고 불리는 초인적인 힘에 각성한 사람들이 출현했다. 헌터는 그 힘을 사용해 게이트 안의 던전을 공략하고 대가를 받는 것을 생업으로 하고 있는데 강자들만 모인 헌터들 중 성진우는 인류 최약병기라 불리는 저랭크 헌터로서 생활하고 있었다. 어느 날, 저랭크 던전에 숨겨진 고랭크 이중 던전에서 빈사의 중상을 입은 성진우의 눈앞에 수수께끼의 퀘스트창이 나타났다. 죽음의 순간, 퀘스트를 수락하기로 결심한 성진우는 자신만 레벨업할 수 있게 되는데── 전직 퀘스트를 클리어하고 그림자 병사를 부릴 수 있는 그림자 군주가 된 성진우의 앞에 다음 시련으로서 나타난 것은 상급 던전으로 이어지는 레드 게이트였다──', '애니메이션', '2025', 'Shunsuke Nakashige', '19', 'SoloLeveling_poster.webp', 'SoloLeveling_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('극장판 귀멸의 칼날: 무한열차편', '혈귀로 변해버린 여동생 네즈코를 인간으로 되돌릴 단서를 찾아 비밀조직 귀살대에 들어간 탄지로. 젠이츠, 이노스케와 새로운 임무 수행을 위해 무한열차에 탑승 후 귀살대 최강 검사 염주 렌고쿠와 합류한다. 달리는 무한열차에서 승객들이 하나 둘 흔적 없이 사라지자 숨어있는 식인 혈귀의 존재를 직감하는 렌고쿠. 귀살대 탄지로 일행과 최강 검사 염주 렌고쿠는 어둠 속을 달리는 무한열차에서 모두의 목숨을 구하기 위해 예측불가능한 능력을 가진 혈귀와 목숨을 건 혈전을 시작하는데...', '애니메이션', '2020', 'Haruo Sotozaki', '15', 'DemonSlayer_poster.webp', 'DemonSlayer_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('진격의 거인', '2013년 4월 MBS에서 방영을 시작한 애니메이션. 100여 년 전 갑자기 나타난 거인들에 의해 멸종 위기에 처한 인류는 거대한 벽을 쌓고 그 안에서 살아가고 있다. 에렌은 바깥 세계를 동경하며, 언젠가 저 방벽 밖으로 나가겠다는 꿈을 키우고 있었다. 그러던 어느 날, 60m가 넘는 초대형 거인의 등장으로 벽은 무너지고, 거인들이 벽 안으로 들어와 사람들을 잡아먹기 시작한다. 절규와 죽음으로 가득한 절망적인 상황에서 거인에게 어머니 카를라를 비롯한 소중한 사람들을 빼앗긴 엘런은 복수를 맹세하고, 사무친 복수심을 원동력으로 삼아 만 12세에 훈련병단의 훈련병으로 지원한다', '애니메이션', '2013', 'Yuichiro Hayashi', '19', 'AttackonTitan_poster.webp', 'AttackonTitan_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('괴수 8호', '일상적으로 괴수가 사람들을 위협하는 세계. 괴수를 토벌하는 「일본 방위대」 입대를 지망하던 히비노 카프카는, 언제부턴가 그 꿈을 포기하고 괴수 전문 청소업자로서 일하고 있었다. 「둘이서 괴수를 전멸시키자」 어린 시절 그렇게 함께 맹세한 소꿉친구 아시로 미나가 제3부대 대장으로서 각광을 받고 있는 가운데, 그녀와 함께 싸울 수 없는 카프카는 자신이 한심하게 느껴졌다. 하지만, 방위대에 입대하려는 이치카와 레노와의 만남을 계기로 멈춰있던 카프카의 시간이 다시 움직이기 시작하는데..!...', '애니메이션', '2024', 'Miya Shigeyuki', '19', 'Kaiju_poster.webp', 'Kaiju_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('체인소 맨', '체인소의 악마포치타와 함께 데블 헌터로 사는 소년 덴지. 부모가 남긴 빚을 갚기 위해, 가난한 생활을 하던 중, 배신을 당해 죽임을 당하고 만다. 희미해지는 의식 속에서, 덴지는 포치타와 계약을 맺고, 악마의 심장을 가진 자 체인소 맨으로 되살아난다~!', '애니메이션', '2022', 'Ryu Nakayama', '19', 'ChainsawMan_poster.webp', 'ChainsawMan_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('주술회전', '소년은 싸운다 올바른 죽음을 위해 쓰라린 고통, 후회, 치욕. 인간으로부터 흘러나온 부정적인 감정이 저주로 변해 일상에 숨어든다. 저주는 세상에 만연한 재앙의 근원이며, 최악의 경우 인간을 죽음으로 이끈다. 그리고 저주는 저주로밖에 없앨 수 없다. 경이적인 신체능력을 가진 소년 이타도리 유지는 아주 평범한 고등학생이었지만, 어느 날 저주에 습격당한 친구를 구하기 위해 특급 주물 양면 스쿠나의 손가락을 먹고 영혼에 저주가 깃들게 된다.', '애니메이션', '2020', '박성후', '15', 'JujutsuKaisen_poster.webp', 'JujutsuKaisen_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('나의 히어로 아카데미아', '가공의 세계가 현실로! 이것은 내가 최고의 히어로가 되기까지의 이야기다. 시작은 중국의 경경 시에서 빛을 내뿜는 아기가 태어났다는 뉴스였다. 이후에 각지에서 초현실적 현상이 발견되고 원인도 밝혀지지 않은 채 세월이 흐른다. 세계 총인구의 80%가 어떤 형태로든 특이체질인 초인사회가 된 현재. 선천적으로 타고난 특별한 힘인 개성을 악용하는 범죄자 빌런이 갈수록 늘어난다.', '애니메이션', '2016', 'Nakagaki Kenji', '15', 'MyHeroAcademia_poster.webp', 'MyHeroAcademia_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('단다단', '영매사 집안에 태어난 여고생?모모＜아야세 모모＞와, 같은 학교에 다니는 오컬트 매니아 오카룽<타카쿠라 켄>. 모모가 반에서 괴롭힘당하던 오카룽을 도와준 것을 계기로 이야기를 하게 된 두 사람이었지만 유령의 존재는 믿지만 우주인의 존재는 부정하는 모모와, 우주인의 존재는 믿지만 유령의 존재는 부정하는 오카룽은 말다툼을 하게 된다.', '애니메이션', '2024', 'Yamashiro Fuuga', '19', 'DanDaDan_poster.webp', 'DanDaDan_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('사이버펑크:엣지러너', '부패와 사이보그 임플란트로 가득한 디스토피아 세상. 재능은 넘치지만 무모한 길거리 소년이 무법의 용병, 엣지러너가 되기 위해 사투를 벌인다.', '애니메이션', '2022', 'Rafał Jaki', '19', 'CyberPunk_poster.webp', 'CyberPunk_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('사카모토 데이즈', '한때 최강의 킬러라 불렸던 사카모토 타로. 사랑에 빠져 은퇴하지만 과거가 그의 발목을 잡기 시작한다. 이제, 사카모토는 사랑하는 가족을 지키기 위해 싸워야만 하는데.', '애니메이션', '2025', 'Watanabe Masaki', '15', 'SakamotoDays_poster.webp', 'SakamotoDays_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('썬더볼츠*', '어벤져스가 사라진 후, 세계 최대의 위협과 마주한 세상을 구하기 위해 전직 스파이, 암살자, 살인 청부 업자 등 마블의 별난 놈들이 펼치는 예측불허 팀플레이를 담은 액션 블록버스터', '액션', '2025', 'Jake Schreier', 'ALL', 'Thunderbolts_poster.webp', 'Thunderbolts_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('폭싹속았수다', '당차고 야무진 소녀와 우직하고 헌신적인 소년. 제주 바닷가 작은 마을에서 한 뼘씩 자라온 두 사람의 인생은 어디로 향할까. 넘어지고 좌절해도 다시 일어서며, 세월을 뛰어넘어 피어나는 사랑 이야기.', '드라마', '2025', '임상춘', 'ALL', 'WhenLifeGivesYouTangerines_poster.webp', 'WhenLifeGivesYouTangerines_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('기묘한 이야기', '인디애나주의 작은 마을에서 행방불명된 소년. 이와 함께 미스터리한 힘을 가진 소녀가 나타나고, 마을에는 기묘한 현상들이 일어나기 시작한다. 아들을 찾으려는 엄마와 마을 사람들은 이제 정부의 일급비밀 실험의 실체와 무시무시한 기묘한 현상들에 맞서야 한다.', '미스터리', '2016', 'Ross Duffer', '15', 'StrangerThings_poster.webp', 'StrangerThings_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('미지의 서울', '얼굴 빼고 모든 게 다른 쌍둥이 자매가 인생을 맞바꾸는 거짓말로 진짜 사랑과 인생을 찾아가는 로맨틱 성장 드라마', '드라마', '2025', '장신애', '15', 'OurUnwrittenSeoul_poster.webp', 'OurUnwrittenSeoul_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('광장', '스스로 아킬레스건을 자르고 광장을 떠났던 기준. 그가 조직의 2인자였던 동생 기석의 죽음을 파헤치고자 11년 만에 돌아온다. 차가운 복수를 향해 타협 없이 직진하는 강렬한 누아르 액션.', '드라마', '2025', '최성은', '19', 'PlazaWars_poster.webp', 'PlazaWars_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('오징어게임', '빚에 쫓기는 수백 명의 사람들이 서바이벌 게임에 뛰어든다. 거액의 상금으로 새로운 삶을 시작하기 위해. 하지만 모두 승자가 될 순 없는 법. 탈락하는 이들은 치명적인 결과를 각오해야 한다.', '드라마', '2021', '황동혁', '19', 'SquadGame_poster.webp', 'SquadGame_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('중증외상센터', '전장에서 경험을 쌓은 외과 전문의가 한국에 돌아온다. 뛰어난 실력으로 거침없이 돌진하는 그의 목표는 최고의 중증외상센터 건설. 그의 팀원들도 생명을 구하는 인재들로 성장해 간다.', '드라마', '2025', '이도윤', '15', 'TheTraumaCode_poster.webp', 'TheTraumaCode_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('재벌집 막내아들', '순양그룹 오너 일가의 충직한 비서, 윤현우. 해외로 유출된 비자금을 국내로 들여오라는 지시를 받고 임무를 수행하던 중 오너 일가에 의해 무참히 살해당한다. 그의 억울한 죽음은 끝이 아니었는데, 1987년의 대한민국, 순양그룹 오너 일가의 막내아들 진도준으로 회귀한 것! 과연 그는 복수에 성공할 수 있을까?', '드라마', '2022', '김대희', '15', 'RebornRich_poster.webp', 'RebornRich_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('이태원 클라쓰', '가족 모두를 잃고 끝없는 나락 속에서 우연히 걷게 된 이태원 거리. 다양한 인종, 느낌 있는 이국적인 건축물, 자유로운 사람들, 각국의 맛있는 요리들. 세계가 압축된 듯한 이태원에서 자유를 느낀 그는, 다시금 희망을 품고 반해버린 이곳 이태원 골목에서 뜻이 맞는 동료들과 창업을 시작한다.', '드라마', '2020', '조광진', '15', 'ItaewonClass_poster.webp', 'ItaewonClass_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('흑백요리사: 요리 계급 전쟁', '경력과 장르를 가리지 않는다. 그저 요리만 잘하면 된다. 레스토랑 셰프부터 방구석 요리왕까지, 맛에 일가견이 있는 사람들의 경쟁. 그 어디에서도 볼 수 없던 치열한 요리 대결이 시작된다.', '리얼리티', '2024', '김학민', 'ALL', 'CulinaryClassWars_poster.webp', 'CulinaryClassWars_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('살인자ㅇ난감', '우발적인 첫 살인 후 연이어 사람을 죽이게 된 평범한 청년. 자신을 끈질기게 추적하는 형사와 끝없이 쫓고 쫓기는 게임을 시작한다.', '드라마', '2024', '이창희', '19', 'KillerParadox_poster.webp', 'KillerParadox_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('파묘', '미국 LA, 거액의 의뢰를 받은 무당 화림과 봉길은 기이한 병이 대물림되는 집안의 장손을 만난다. 조상의 묫자리가 화근임을 알아챈 화림은 이장을 권하고, 돈 냄새를 맡은 최고의 풍수사 상덕과 장의사 영근이 합류한다. 절대 사람이 묻힐 수 없는 악지에 자리한 기이한 묘. 상덕은 불길한 기운을 느끼고 제안을 거절하지만, 화림의 설득으로 결국 파묘가 시작되고… 나와서는 안될 것이 나왔다.', '미스터리', '2024', '장재현', '15', 'Exhuma_poster.webp', 'Exhuma_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('스물다섯 스물하나', '꿈은 그저 꿈으로만 남을 것 같던 그 시절. 야심 찬 목표를 향해 달려가던 고등학교 펜싱선수가 무너진 삶을 다시 세우려 억척스럽게 살아가는 청년을 만난다.', '드라마', '2022', '정지현', '15', 'TwentyFiveTwentyOne_poster.webp', 'TwentyFiveTwentyOne_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('계시록', '신의 계시를 받았다 믿고 실종 사건의 범인을 단죄하려는 목사와 죽은 동생의 환영에 시달리면서도 끈질기게 범인을 쫓는 형사. 어두운 현실 속 각자의 믿음을 따르는 자들의 추악한 민낯이 드러난다.', '공포', '2025', '연상호', '15', 'Revelations_poster.webp', 'Revelations_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('에이리언: 로물루스', '2142년, 부모 세대가 맞닥뜨렸던 암울한 미래를 피하려는 청년들이 더 나은 삶을 찾기 위해 식민지를 떠날 계획을 세운다. 하지만 버려진 우주 기지 로물루스에 도착한 이들은 악몽과도 같은 에이리언의 무자비한 공격에 쫓기기 시작한다. 그 누구도 그들의 절규를 들을 수 없는 우주 한가운데, 생존을 위한 치열한 사투를 벌여야 하는데...', '공포', '2024', 'Fede Alvarez', '19', 'AlienRomulus_poster.webp', 'AlienRomulus_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('쏘우 X', '존은 암을 치료할 수 있는 기적을 기대하며 위험하고 실험적인 의료 시술을 받기 위해 멕시코로 떠났지만, 이 모든 수술이 가장 취약한 사람들을 속이기 위한 사기라는 사실을 알게 된다.', '공포', '2023', 'Kevin Greutert', '18', 'SawX_poster.webp', 'SawX_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('블랙 썸머', '좀비 대재앙이 세상을 뒤덮은 암흑의 시대. 인류는 절멸의 위기에 처하고, 얼마 안 되는 생존자들은 서로 힘을 모은다. 끝까지 살아남아 사랑하는 이들에게 돌아가기 위해.', '공포', '2019', 'John Hyams', '19', 'BlackSummer_poster.webp', 'BlackSummer_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('호문쿨루스', '무엇이 환상이고, 무엇이 실제인가. 두개골을 수술한 남자가 한쪽 눈으로 보게 되는 세계. 그곳에는 내재된 트라우마가 외형으로 표출된 인간, 아니 호문쿨루스들이 있었다.', '공포', '2021', 'Takashi Shimizu', '19', 'Homunculus_poster.webp', 'Homunculus_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('지금 우리 학교는', '좀비 바이러스 발생의 시발점이 된 고등학교. 이곳에 갇힌 학생들은 필사적으로 탈출구를 찾아야만 한다. 그렇지 않으면 감염되어 좀비가 될 뿐.', '공포', '2022', '천성일', '19', 'AllofUsAreDead_poster.webp', 'AllofUsAreDead_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('미션 임파서블: 파이널 레코닝', '오랜 동료 루터와 벤지, 그리고 새로운 팀원이 된 그레이스, 파리, 드가와 함께 지금껏 경험했던 그 어떤 상대보다도 강력한 적에 맞서 모두의 운명을 건 불가능한 미션에 뛰어든다.', '액션', '2025', 'Christopher McQuarrie', '15', 'MissionImpossible_poster.webp', 'MissionImpossible_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('스파이더맨: 노 웨이 홈', '미스테리오의 계략으로 세상에 정체가 탄로난 스파이더맨 피터 파커는 하루 아침에 평범한 일상을 잃게 된다. 문제를 해결하기 위해 닥터 스트레인지를 찾아가 도움을 청하지만 뜻하지 않게 멀티버스가 열리면서 각기 다른 차원의 불청객들이 나타난다. 닥터 옥토퍼스를 비롯해 스파이더맨에게 깊은 원한을 가진 숙적들의 강력한 공격에 피터 파커는 사상 최악의 위기를 맞게 되는데…', '액션', '2021', 'Jon Watts', 'ALL', 'SpiderMan_poster.webp', 'SpiderMan_thumb.webp');

INSERT INTO Content(Title, info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName) VALUES('어벤져스: 인피니티 워', '타노스는 6개의 인피니티 스톤을 획득해 신으로 군림하려 한다. 그것은 곧 인류의 절반을 학살해 우주의 균형을 맞추겠다는 뜻. 타노스는 닥터 스트레인지가 소유한 타임 스톤, 비전의 이마에 박혀 있는 마인드 스톤을 차지하기 위해 지구를 침략한다. 아이언맨과 스파이더맨은 가디언즈 오브 갤럭시의 멤버들과 타노스를 상대한다. 지구에선 캡틴 아메리카, 완다, 블랙 위도우, 블랙 팬서 등이 비전을 지키기 위해 뭉친다.', '액션', '2018', 'Anthony Russo', 'ALL', 'Avengers_poster.webp', 'Avengers_thumb.webp');


ContentId BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Title VARCHAR(255) NOT NULL,
	Info TEXT,
	Genre VARCHAR(100) NOT NULL,
	ReleaseDate DATE NOT NULL,
	Director VARCHAR(100) NOT NULL,
	AgeRating ENUM('ALL', '15', '18', '19') NOT NULL,
	PosterFileName VARCHAR(255) NOT NULL,
	ThumbnailFileName VARCHAR(255) NOT NULL);