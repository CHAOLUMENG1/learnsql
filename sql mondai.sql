--問題25：全選手の以下のデータを抽出してください。
select
    uniform_num
    , name
    , club 
from
    plyers; 

--問題26：グループCに所属する国をすべて抽出してください。
select
    * 
from
    countries 
where
    group_name = 'C'                            
    
--問題27：グループC以外に所属する国をすべて抽出してください。
select
    * 
from
    countries 
where
    group_name <> 'C'                           
    
--問題28：2016年1月13日現在で40歳以上の選手を抽出してください。（誕生日の人を含めてください。）
select
    * 
from
    playrs 
where
    birth <= '1976-01-13'                       
    
--問題29：身長が170cm未満の選手を抽出してください。
select
    * 
from
    players 
where
    height < 170                                
    
--問題30：FIFAランクが日本（46位）の前後10位に該当する国（36位～56位）を抽出してください。ただし、BETWEEN句を用いてください。
select
    * 
from
    countries 
where
    ranking between 36 and 56                   
    
--問題31：選手のポジションがGK、DF、MFに該当する選手をすべて抽出してください。ただし、IN句を用いてください。
select
    * 
from
    players 
where
    position in ('GK', 'DF', 'MF')              
    
--問題32：オウンゴールとなったゴールを抽出してください。goalsテーブルのplayer_idカラムにNULLが格納されているデータがオウンゴールを表しています。
select
    * 
from
    goals 
where
    player_id is null                           
    
--問題33：オウンゴール以外のゴールを抽出してください。goalsテーブルのplayer_idカラムにNULLが格納されているデータがオウンゴールを表しています。
select
    * 
from
    goals 
where
    player_id is not null                       
    
--問題34：名前の末尾が「ニョ」で終わるプレイヤーを抽出してください。
select
    * 
from
    players 
where
    name like '%ニョ'                           
--問題35：名前の中に「ニョ」が含まれるプレイヤーを抽出してください。
select
    * 
from
    players 
where
    name like '%ニョ%'                          
    
--問題36：グループA以外に所属する国をすべて抽出してください。ただし、「!=」や「<>」を使わずに、「NOT」を使用してください。
select
    * 
from
    countries 
where
    not group_name = 'A'                        

--問題37：全選手の中でBMI値が20台の選手を抽出してください。BMIは以下の式で求めることができます。
select
    * 
from
    players 
where
    weight / POW(height / 100, 2) >= 20 
    and weight / POW(height / 100, 2) < 21      
    
--問題38：全選手の中から小柄な選手（身長が165cm未満か、体重が60kg未満）を抽出してください。
select
    * 
from
    players 
where
    height < 165 
    or weight < 60                              
    
--問題39：FWかMFの中で170未満の選手を抽出してください。ただし、ORとANDを使用してください。
select
    * 
from
    players 
where
    (position = 'FW' or position = 'MF') 
    and height < 170                            
    
--問題40：ポジションの一覧を重複なしで表示してください。グループ化は使用しないでください。
sselect distinct
    position 
from
    players; 

--問題41：全選手の身長と体重を足した値を表示してください。合わせて選手の名前、選手の所属クラブも表示してください。
select
    name
    , club
    , height + weight 
from
    players; 

--問題42：選手名とポジションを以下の形式で出力してください。シングルクォートに注意してください。
select
    concat(name, '選手のポジションは', position, 'です') 
from
    players; 

--問題43：全選手の身長と体重を足した値をカラム名「体力指数」として表示してください。合わせて選手の名前、選手の所属クラブも表示してください。
select
    name
    , club
    , height + weight as 体力指数 
from
    players; 

--問題44：FIFAランクの高い国から順にすべての国名を表示してください。
select
    * 
from
    countries 
order by
    ranking                                     
    
--問題45：全ての選手を年齢の低い順に表示してください。なお、年齢を計算する必要はありません。
select
    * 
from
    players 
order by
    birth desc                                  
    
--問題46：全ての選手を身長の大きい順に表示してください。同じ身長の選手は体重の重い順に表示してください。
select
    * 
from
    players 
order by
    height desc
    , weight desc                               
    
--問題47：全ての選手のポジションの1文字目（GKであればG、FWであればF）を出力してください。
select
    id
    , country_id
    , uniform_num
    , substring(position, 1, 1)
    , name 
from
    players; 

--問題48：出場国の国名が長いものから順に出力してください。
select
    name
    , length(name) 
from
    countries 
order by
    length(name) desc                           
    
--*問題49：全選手の誕生日を「2017年04月30日」のフォーマットで出力してください。
select
    name
    , to_char(cast('20190401' as date), 'YYYY年MM月DD日') as birthday 
from
    players                                     
    
--*問題50：全てのゴール情報を出力してください。ただし、オウンゴール（player_idがNULLのデータ）はIFNULL関数を使用してplayer_idを「9999」と表示してください。
select
    ifnull(player_id, 9999) as player_id
    , goal_time 
from
    goals; 

--*問題51：全てのゴール情報を出力してください。ただし、オウンゴール（player_idがNULLのデータ）はIFNULL関数を使用してplayer_idを「9999」と表示してください。
select
    case 
        when player_id is null 
            then 9999 
        else player_id 
        end as player_id
    , goal_time 
from
    goals                                       
    
--問題52：全ての選手の平均身長、平均体重を表示してください。
select
    avg(height) as 平均身長
    , avg(weight) as 平均体重 
from
    players; 

--問題53：日本の選手（player_idが714から736）が上げたゴール数を表示してください。
select
    count(id) as 日本のゴール数 
from
    goals 
where
    player_id >= 714 
    and player_id <= 736                        
    
--問題54：オウンゴール（player_idがNULL）以外の総ゴール数を表示してください。ただし、WHERE句は使用しないでください。
select
    count(player_id) as オウンゴール以外のゴール数 
from
    goals; 

--問題55：全ての選手の中で最も高い身長と、最も重い体重を表示してください。
select
    max(height) as 最大身長
    , max(weight) as 最大体重 
from
    players; 

--問題56：AグループのFIFAランク最上位を表示してください。
select
    min(ranking) as AグループのFIFAランク最上位 
from
    countries 
where
    group_name = 'A'                            
    
--問題57：CグループのFIFAランクの合計値を表示してください。
select
    sum(ranking) as CグループのFIFAランクの合計値 
from
    countries 
where
    group_name = 'C'                            
    
--*問題58：全ての選手の所属国と名前、背番号を表示してください。
select
    c.name
    , p.name
    , p.uniform_num 
from
    players p join countries c 
        on c.id = p.country_id                  
        
--問題59：全ての試合の国名と選手名、得点時間を表示してください。オウンゴール（player_idがNULL）は表示しないでください。
select
    c.name
    , p.name
    , g.goal_time 
from
    goals g join players p 
        on g.player_id = p.id join countries c 
        on p.country_id = c.id                  
        
--問題60：全ての試合のゴール時間と選手名を表示してください。左側外部結合を使用してオウンゴール（player_idがNULL）も表示してください
select
    g.goal_time
    , p.uniform_num
    , p.position
    , p.name 
from
    goals g 
    left join players p 
        on g.player_id = p.id                   
        
--問題61：全ての試合のゴール時間と選手名を表示してください。右側外部結合を使用してオウンゴール（player_idがNULL）も表示してください。
select
    g.goal_time
    , p.uniform_num
    , p.position
    , p.name 
from
    players p 
    right join goals g 
        on g.player_id = p.id                   
        
--問題62：全ての試合のゴール時間と選手名、国名を表示してください。また、オウンゴール（player_idがNULL）も表示してください。
select
    c.name as country_name
    , g.goal_time
    , p.position
    , p.name as player_name 
from
    goals g 
    left join players p 
        on g.player_id = p.id 
    left join countries c 
        on p.country_id = c.id                  
        
--問題63：全ての試合のキックオフ時間と対戦国の国名を表示してください。
select
    p.kickoff
    , mc.name as my_country
    , ec.name as enemy_country 
from
    pairings p join countries mc 
        on mc.id = my_country_id join countries ec 
        on ec.id = enemy_country_id             
        
--問題64：全てのゴール時間と得点を上げたプレイヤー名を表示してください。オウンゴールは表示しないでください。ただし、結合は使わずに副問合せを用いてください。
select
    g.id
    , g.goal_time
    , ( 
        select
            p.name 
        from
            players p 
        where
            p.id = g.player_id
    ) as player_name 
from
    goals g 
where
    g.player_id is not null                     
    
--問題65：全てのゴール時間と得点を上げたプレイヤー名を表示してください。オウンゴールは表示しないでください。ただし、副問合せは使わずに、結合を用いてください。
select
    g.id
    , g.goal_time
    , p.name 
from
    goals g join players p 
        on p.id = g.player_id                   
        
--問題66：各ポジションごと（GK、FWなど）に最も身長と、その選手名、所属クラブを表示してください。ただし、FROM句に副問合せを使用してください。
select
    p1.position
    , p1.最大身長
    , p2.name
    , p2.club 
from
    ( 
        select
            position
            , max(height) as 最大身長 
        from
            players 
        group by
            position
    ) p1 
    left join players p2 
        on p1.最大身長 = p2.height 
        and p1.position = p2.position           
        
--問題67：各ポジションごと（GK、FWなど）に最も身長と、その選手名を表示してください。ただし、SELECT句に副問合せを使用してください。
select
    p1.position
    , max(p1.height) as 最大身長
    , ( 
select
        p2.name 
    from
        players p2 
    where
        max(p1.height) = p2.height 
        and p1.position = p2.position
    ) as 名前 
from
    players p1 
group by
    p1.position                                 
    
--問題68：全選手の平均身長より低い選手をすべて抽出してください。表示する列は、背番号、ポジション、名前、身長としてください。
select
    uniform_num
    , position
    , name
    , height 
from
    players 
where
    height < (select avg(height) from players)
    
--問題69：各グループの最上位と最下位を表示し、その差が50より大きいグループを抽出してください。
select
    group_name
    , max(ranking)
    , min(ranking) 
from
    countries 
group by
    group_name 
having
    max(ranking) - min(ranking) > 50        

--問題70：1980年生まれと、1981年生まれの選手が何人いるか調べてください。ただし、日付関数は使用せず、UNION句を使用してください。
select
    '1980' as '誕生年'
    , count(id) 
from
    players 
where
    birth between '1980-1-1' and '1980-12-31' 
union 
select
    '1981'
    , count(id) 
from
    players 
where
    birth between '1981-1-1' and '1981-12-31'   
    
--問題71：身長が195㎝より大きいか、体重が95kgより大きい選手を抽出してください。ただし、以下の画像のように、どちらの条件にも合致する場合には2件分のデータとして抽出してください。また、結果はidの昇順としてください。
select
    id
    , position
    , name
    , height
    , weight 
from
    players 
where
    height > 195 
union all 
select
    id
    , position
    , name
    , height
    , weight 
from
    players 
where
    weight > 95 
order by
    id

--問題1：各グループの中でFIFAランクが最も高い国と低い国のランキング番号を表示してください。
select
    group_name as グループ , min(ranking) as ランキング最上位, max(ranking) as ランキング最下位 
from
    countries 
group by group_name

--問題2：全ゴールキーパーの平均身長、平均体重を表示してください
select avg(height) as 平均身長,avg(weight) as 平均体重
from players

--問題3：各国の平均身長を高い方から順に表示してください。ただし、FROM句はcountriesテーブルとしてください。
select c.name as 国名,avg(p.height) as 平均身長
from countries c
join players p on p.country_id = c.id
group by c.id,c.name
order by avg(p.height) desc

--問題4：各国の平均身長を高い方から順に表示してください。ただし、FROM句はplayersテーブルとして、テーブル結合を使わず副問合せを用いてください。
select (select c.name from countries c where p.country_id = c.id) as 国名, avg(p.height) as 平均身長
from players p
group by p.country_id
order by avg(p.height) desc

--問題5：キックオフ日時と対戦国の国名をキックオフ日時の早いものから順に表示してください。
select kickoff as キックオフ日時, c1.name as 国名1, c2.name as 国名2
from pairings p
left join countries c1 on p.my_country_id = c1.id
left join countries c2 on p.enemy_country_id = c2.id
order by kickoff

--問題6：すべての選手を対象として選手ごとの得点ランキングを表示してください。（SELECT句で副問合せを使うこと）
select p.name as 名前, p.position as ポジション, p.club as 所属クラブ, 
    (select count(id) from goals g where g.player_id = p.id) as ゴール数
from players p
order by ゴール数 desc

--問題7：すべての選手を対象として選手ごとの得点ランキングを表示してください。（テーブル結合を使うこと）
select p.name as 名前,p.position as ポジション,p.club as 所属クラブ,
count(g.id) as ゴール数
from players p
left join goals g on g.player_id = p.id
group by p.id,p.name,p.position,p.club
order by ゴール数 desc

--問題8：各ポジションごとの総得点を表示してください。
select p.position as ポジション, sum(g.id) as ゴール数
from players p
left join goals g on g.player_id = p.id
group by p.position
order by ゴール数 desc

--*問題9：ワールドカップ開催当時（2014-06-13）の年齢をプレイヤー毎に表示する。
select timestampdiff(year,birth,'2014-06-13') as age,name,position
from players
order by age desc

--問題10：オウンゴールの回数を表示する
select count(g.goal_time)
from goals g
where g.player_id is null

--問題11：各グループごとの総得点数を表示して下さい。
select c.group_name, count(g.id)
from goals g
left join pairings p on p.id = g.pairing_id
left join countries c on p.my_country_id = c.id 
where p.kickoff between '2014-06-13 0:00:00' and '2014-06-27 23:59:59'
group by c.group_name
order by count(g.id)

--問題12：日本VSコロンビア戦（pairings.id = 103）でのコロンビアの得点のゴール時間を表示してください
select goal_time
from goals
where pairing_id=103;

--問題13：日本VSコロンビア戦の勝敗を表示して下さい。
select c.name, count(g.goal_time)
from goals g
left join pairings p on p.id = g.pairing_id
left join countries c on p.my_country_id = c.id 
where p.id = 103 or p.id = 39
group by c.name

--*問題14：グループCの各対戦毎にゴール数を表示してください。
select p1.kickoff, c1.name as my_country, c2.name as enemy_country,
    c1.ranking as my_ranking, c2.ranking as enemy_ranking,
    count(g1.id) as my_goals
from pairings p1
left join countries c1 on c1.id = p1.my_country_id
left join countries c2 on c2.id = p1.enemy_country_id
left join goals g1 on p1.id = g1.pairing_id
where c1.group_name = 'C' and c2.group_name = 'C'
group by p1.kickoff, c1.name, c2.name, c1.ranking, c2.ranking
order by p1.kickoff, c1.ranking

--*問題15：グループCの各対戦毎にゴール数を表示してください。
select p1.kickoff, c1.name as my_country, c2.name as enemy_country,
    c1.ranking as my_ranking, c2.ranking as enemy_ranking,
    count(g1.id) as my_goals
from pairings p1
left join countries c1 on c1.id = p1.my_country_id
left join countries c2 on c2.id = p1.enemy_country_id
left join goals g1 on p1.id = g1.pairing_id
where c1.group_name = 'C' and c2.group_name = 'C'
group by p1.kickoff, c1.name, c2.name, c1.ranking, c2.ranking
order by p1.kickoff, c1.ranking

--*問題16：グループCの各対戦毎にゴール数を表示してください。
select p1.kickoff, c1.name as my_country, c2.name as enemy_country, 
    c1.ranking as my_ranking, c2.ranking as enemy_ranking,
    (select count(g1.id) from goals g1 where p1.id = g1.pairing_id) as my_goals,
    (select count(g2.id) 
        from goals g2 
        left join pairings p2 on p2.id = g2.pairing_id
        where p2.my_country_id = p1.enemy_country_id and p2.enemy_country_id = p1.my_country_id
    ) as enemy_goals
from pairings p1
left join countries c1 on c1.id = p1.my_country_id
left join countries c2 on c2.id = p1.enemy_country_id
where c1.group_name = 'C' and c2.group_name = 'C'
order by p1.kickoff, c1.ranking

--*問題17：問題16の結果に得失点差を追加してください。
select p1.kickoff, c1.name as my_country, c2.name as enemy_country, 
    c1.ranking as my_ranking, c2.ranking as enemy_ranking,
    (select count(g1.id) from goals g1 where p1.id = g1.pairing_id) as my_goals,
    (select count(g2.id) 
        from goals g2 
        left join pairings p2 on p2.id = g2.pairing_id
        where p2.my_country_id = p1.enemy_country_id and p2.enemy_country_id = p1.my_country_id
    ) as enemy_goals
    
    (select count(g1.id) from goals g1 where p1.id = g1.pairing_id) - ( 
        select count(g2.id) 
        from goals g2 
        left join pairings p2 on p2.id = g2.pairing_id
        where p2.my_country_id = p1.enemy_country_id and p2.enemy_country_id = p1.my_country_id
    ) as goal_diff
    
from pairings p1
left join countries c1 on c1.id = p1.my_country_id
left join countries c2 on c2.id = p1.enemy_country_id
where c1.group_name = 'C' and c2.group_name = 'C'
order by p1.kickoff, c1.ranking

--*問題18：ブラジル（my_country_id = 1）対クロアチア（enemy_country_id = 4）戦のキックオフ時間（現地時間）を表示してください。
select p.kickoff,  p.kickoff - cast('12 hours' as interval) as kickoff_jp
from pairings p
where p.my_country_id = 1 and p.enemy_country_id = 4;

--*問題19：年齢ごとの選手数を表示してください。（年齢はワールドカップ開催当時である2014-06-13を使って算出してください。）
select date_part('year', age('2014-06-13',birth)) as age, count(id) as player_count
from players 
group by age
order by age

--*問題20：年齢ごとの選手数を表示してください。ただし、10歳毎に合算して表示してください。
select
  truncate(timestampdiff(YEAR, birth, '2014-06-13'), -1) as age,
  count(id) as player_count
from players
group by age;

--*問題21：年齢ごとの選手数を表示してください。ただし、5歳毎に合算して表示してください。
select 
  floor(timestampdiff(year, birth, '2014-06-13') / 5) * 5 as age,
  count(id)
from players
group by age;

--*問題22：以下の条件でSQLを作成し、抽出された結果をもとにどのような傾向があるか考えてみてください。
select 
  floor(timestampdiff(year, birth, '2014-06-13') / 5) * 5 as age,
  position,
  count(id),
  avg(height),
  avg(weight)
from players
group by age, position
order by age, position;

--問題23：身長の高い選手ベスト5を抽出し、以下の項目を表示してください。
select name, height, weight
from players
order by height desc
limit 5;

--問題24：身長の高い選手6位～20位を抽出し、以下の項目を表示してください。
select name, height, weight
from players
order by height
limit (20) OFFSET (5);



--再練習--



--1問題：各グループの中でFIFAランクが最も高い国と低い国のランキング番号を表示してください。
select group_name as グループ,min(ranking) as ランキング最上位,max(ranking) as ランキング最下位
from countries
group by group_name;

--問題2：全ゴールキーパーの平均身長、平均体重を表示してください
select avg(height) as 平均身長,avg (weight) as 平均体重
from players
where position = 'GK';

--問題3：各国の平均身長を高い方から順に表示してください。ただし、FROM句はcountriesテーブルとしてください。
select c.name as 国名,avg(p.height) as 平均身長
from countries c
join players p on p.country_id=c.id
group by c.id,c.name
order by avg(p.height) desc

--問題4：各国の平均身長を高い方から順に表示してください。ただし、FROM句はplayersテーブルとして、テーブル結合を使わず副問合せを用いてください。
select(select c.name from countries c where p.country_id=c.id) as 国名,avg(p.height) as 平均身長
from players p
group by p.country_id
order by avg(p.height) desc;

--問題5：キックオフ日時と対戦国の国名をキックオフ日時の早いものから順に表示してください。
select kikcoff as キックオフ日時,c1.name as 国名1, c2.name as 国名2
from pairings p
left join countries c1 on p.my_country_id=c1.id 
left join countries c2 on p.enemy_country_id=c2.id 
order by kickoff

