﻿--問題25：全選手の以下のデータを抽出してください。
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
    
--*問題37：全選手の中でBMI値が20台の選手を抽出してください。BMIは以下の式で求めることができます。
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
select
    * 
from
    players 
where
    height < 165 
    or weight < 60

