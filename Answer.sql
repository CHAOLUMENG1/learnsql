--Q1 患者名が「鈴木花子」である患者の、最も新しい診察記録の診察ID、診察日、医師名、診療科名を表示するSQL文を作成してください。
select
    s.examination_id
    , s.examination_date
    , d.doctor_name
    , dp.department_name 
from
    examinations s join patients p 
        on s.patient_id = p.patient_id join doctors d 
        on s.doctor_id = d.doctor_id join departments dp 
        on d.department_id = dp.department_id 
where
    p.patient_name = '鈴木花子' 
order by
    s.examination_date desc 
limit
    1; 

--Q2 各診療科ごとに診察回数を集計して、診療科名と診察回数を降順で表示するSQL文を作成してください。
select
    departments.department_name, count(*) as count 
from
    examinations 
    inner join departments 
        on examinations.department_id = departments.department_id 
group by
    departments.department_name 
order by
    count desc; 

--Q3 医師名が「山田一郎」である患者のIDと患者名を表示するSQL文を作成してください。
select
    patients.patient_id
    , patients.patient_name 
from
    patients 
    inner join examinations 
        on patients.patient_id = examinations.patient_id 
    inner join doctors 
        on examinations.doctor_id = doctors.doctor_id 
where
    doctors.doctor_name = '山田一郎'; 

--Q4 診療科が「内科」かつ診察日が2022年4月1日以降である患者の患者名と診察日を昇順で表示するSQL文を作成してください。
select
    patients.patient_name
    , examinations.examination_date 
from
    patients 
    inner join examinations 
        on patients.patient_id = examinations.patient_id 
    inner join departments 
        on examinations.department_id = departments.department_id 
where
    departments.department_name = '内科' 
    and examinations.examination_date >= '2022-04-01' 
order by
    examinations.examination_date desc; 

--Q5 医師名が「田中三郎」である診察記録の診察IDと診察日を表示するSQL文を作成してください。
select
    examinations.examination_id
    , examinations.examination_date 
from
    examinations 
    inner join doctors 
        on examinations.doctor_id = doctors.doctor_id 
where
    doctors.doctor_name = '田中三郎'; 

--Q6 examinationsテーブルから重複を除いた患者(patient_id)の数のSQL文を作成してください。
select
    count(distinct patient_id) 
from
    examinations; 

--Q7 department_idが2の科(department)における重複を除いた患者(patient_id)の数のSQL文を作成してください。
select
    count(distinct patient_id) 
from
    examinations 
where
    department_id = 2; 

--Q8 patient_nameが"山田太郎"の患者の情報を取得するクエリを書いてください。
select
    * 
from
    patients 
where
    patient_name = '山田太郎'; 

--Q9 2022年1月1日以降に診察された全ての情報を取得するクエリを書いてください。
select
    * 
from
    examinations 
where
    examination_date >= '2022-01-01'; 

--Q10 patientsテーブルから、patient_idが偶数でかつがgenderは男性の患者の名前を取得するSQL文を作成してください。
select
    patient_id
    , gender 
from
    patients 
where
    patient_id % 2 = 0 
    and gender = '男性'; 

--Q11 doctorsテーブルから、salaryが400000以上でかつgenderが'女性'の医師のIDと名前を取得するSQL文を作成してください。
select
    doctor_id
    , doctor_name 
from
    doctors 
where
    salary >= 400000 
    and gender = '女性'; 

--Q12 department_idが1または2の患者の治療データを取得するSQL文を作成してください。
select
    * 
from
    examinations 
where
    department_id = 1 
    or department_id = 2; 

--Q13 患者のIDが6以上で、診断結果が"糖尿病"または"高血圧"である診断データを取得するSQL文を作成してください。
select
    * 
from
    examinations 
where
    patient_id = 6 
    and (diagnosis = '糖尿病' or diagnosis = '高血圧'); 

--Q14 patient_idが3または4の場合で、かつ、diagnosisに"急性中耳炎"または"風邪"が含まれるレコードを抽出するSQL文を作成してください。
select
    * 
from
    examinations 
where
    (patient_id = 3 or patient_id = 4) 
    and ( 
        diagnosis like '%急性中耳炎%' 
        or diagnosis like '%風邪%'
    ); 

--Q15 patient_idが5で、かつ、(doctor_idが8であるか、department_idが4である)、かつ、examination_dateが2022年11月05日より後のレコードを抽出するSQL文を作成してください。
select
    * 
from
    examinations 
where
    patient_id = 5 
    and ( 
        (doctor_id = 8 or department_id = 4) 
        and examination_date > '2022-11-05'
    ); 

--Q16 examination_dateを昇順で並べ替えた結果を取得するSQL文を書いてください。
select
    * 
from
    examinations 
order by
    examination_date desc; 

--Q17 diagnosisが"風邪"のレコードをtreatmentの降順で並べ替えた結果を取得するSQL文を書いてください。
select
    * 
from
    examinations 
where
    diagnosis = '風邪' 
order by
    treatment desc; 

--Q18 最初の5つの患者のIDと名前を取得するSQL文を書いてください。
select
    patient_id
    , patient_name 
from
    patients 
limit
    5; 

--Q19 患者の診察データで、診断が「風邪」となっている最初の10件のデータを取得するSQL文を書いてください。
select
    * 
from
    examinations 
where
    diagnosis = '風邪' 
limit
    10; 

--Q20 examinationsテーブルから、患者IDが1であるデータのうち、最も古い日付であるexamination_dateで並び替えた上で、2番目のレコードから4つのレコードを取得してください。
select
    * 
from
    examinations 
where
    patient_id = 11 
order by
    examination_date desc 
limit
    3 offset 1; 

--再練習--
--Q1 患者名が「鈴木花子」である患者の、最も新しい診察記録の診察ID、診察日、医師名、診療科名を表示するSQL文を作成してください。
select
    s.examination_id, s.examination_date
    , d.doctor_name
    , dp.department_name 
from
    examinations s join patients p 
        on s.patient_id = p.patient_id join doctors d 
        on s.doctor_id = d.doctor_id join departments dp 
        on d.department_id = dp.department_id 
where
    p.patient_name = '鈴木花子' 
order by
    s.examination_date desc 
limit
    1; 

--Q2 各診療科ごとに診察回数を集計して、診療科名と診察回数を降順で表示するSQL文を作成してください。
select
    departments.department_name, count(*) as count 
from
    examinations 
    inner join departments 
        on examinations.department_id = departments.department_id 
group by
    departments.department_name 
order by
    count desc; 

--Q3 医師名が「山田一郎」である患者のIDと患者名を表示するSQL文を作成してください。
select
    patients.patient_id
    , patients.patient_name 
from
    patients 
    inner join examinations 
        on patients.patient_id = examinations.patient_id 
    inner join doctors 
        on examinations.doctor_id = doctors.doctor_id 
where
    doctors.doctor_name = '山田一郎'; 

--Q4 診療科が「内科」かつ診察日が2022年4月1日以降である患者の患者名と診察日を昇順で表示するSQL文を作成してください。
select
    patients.patient_name
    , examinations.examination_date 
from
    patients 
    inner join examinations 
        on patients.patient_id = examinations.patient_id 
    inner join departments 
        on examinations.department_id = departments.department_id 
where
    departments.department_name = '内科' 
    and examinations.examination_date >= '2022-04-01' 
order by
    examinations.examination_date desc; 

--Q5 医師名が「田中三郎」である診察記録の診察IDと診察日を表示するSQL文を作成してください。
select
    examinations.examination_id
    , examinations.examination_date 
from
    examinations 
    inner join doctors 
        on examinations.doctor_id = doctors.doctor_id 
where
    doctors.doctor_name = '田中三郎'; 

--Q6 examinationsテーブルから重複を除いた患者(patient_id)の数のSQL文を作成してください。
select
    count(distinct patient_id) 
from
    examinations; 

--Q7 department_idが2の科(department)における重複を除いた患者(patient_id)の数のSQL文を作成してください。
select
    count(distinct patient_id) 
from
    examinations 
where
    department_id = 2; 

--Q8 patient_nameが"山田太郎"の患者の情報を取得するクエリを書いてください。
select
    * 
from
    patients 
where
    patient_name = '山田太郎'; 

--Q9 2022年1月1日以降に診察された全ての情報を取得するクエリを書いてください。
select
    * 
from
    examinations 
where
    examination_date >= '2022-01-01'; 

--Q10 patientsテーブルから、patient_idが偶数でかつがgenderは男性の患者の名前を取得するSQL文を作成してください。
select
    patient_id
    , gender 
from
    patients 
where
    patient_id % 2 = 0 
    and gender = '男性'; 

--Q11 doctorsテーブルから、salaryが400000以上でかつgenderが'女性'の医師のIDと名前を取得するSQL文を作成してください。
select
    doctor_id
    , doctor_name 
from
    doctors 
where
    salary >= 400000 
    and gender = '女性'; 

--Q12 department_idが1または2の患者の治療データを取得するSQL文を作成してください。
select
    * 
from
    examinations 
where
    department_id = 1 
    or department_id = 2; 

--Q13 患者のIDが6以上で、診断結果が"糖尿病"または"高血圧"である診断データを取得するSQL文を作成してください。
select
    * 
from
    examinations 
where
    patient_id = 6 
    and (diagnosis = '糖尿病' or diagnosis = '高血圧'); 

--Q14 patient_idが3または4の場合で、かつ、diagnosisに"急性中耳炎"または"風邪"が含まれるレコードを抽出するSQL文を作成してください。
select
    * 
from
    examinations 
where
    (patient_id = 3 or patient_id = 4) 
    and ( 
        diagnosis like '%急性中耳炎%' 
        or diagnosis like '%風邪%'
    ); 

--Q15 patient_idが5で、かつ、(doctor_idが8であるか、department_idが4である)、かつ、examination_dateが2022年11月05日より後のレコードを抽出するSQL文を作成してください。
select
    * 
from
    examinations 
where
    patient_id = 5 
    and ( 
        (doctor_id = 8 or department_id = 4) 
        and examination_date > '2022-11-05'
    ); 

--Q16 examination_dateを昇順で並べ替えた結果を取得するSQL文を書いてください。
select
    * 
from
    examinations 
order by
    examination_date desc; 

--Q17 diagnosisが"風邪"のレコードをtreatmentの降順で並べ替えた結果を取得するSQL文を書いてください。
select
    * 
from
    examinations 
where
    diagnosis = '風邪' 
order by
    treatment desc; 

--Q18 最初の5つの患者のIDと名前を取得するSQL文を書いてください。
select
    patient_id
    , patient_name 
from
    patients 
limit
    5; 

--Q19 患者の診察データで、診断が「風邪」となっている最初の10件のデータを取得するSQL文を書いてください。
select
    * 
from
    examinations 
where
    diagnosis = '風邪' 
limit
    10; 

--Q20 examinationsテーブルから、患者IDが1であるデータのうち、最も古い日付であるexamination_dateで並び替えた上で、2番目のレコードから4つのレコードを取得してください。
select
    * 
from
    examinations 
where
    patient_id = 11 
order by
    examination_date desc 
limit
    3 offset 1; 

--21."骨"で始まるdiagnosisを持つ患者を選択するSQL文を書いてください。
select
    * 
from
    examinations 
where
    diagnosis like '骨%'; 

--22."慢性中耳炎"という単語を含むdiagnosisを持つ患者を選択するSQL文を書いてください。
select
    * 
from
    examinations 
where
    diagnosis like '%慢性中耳炎%'; 

--23.安静にして湿布を貼るように指示で終わるpatient_idを持つ患者を選択するSQL文を書いてください。
select
    * 
from
    examinations 
where
    treatment like '%貼るように指示'; 

--24.patient_idが3、5、8、10の患者の全診断情報を取得するSQLクエリを作成してください。
select
    * 
from
    examinations 
where
    patient_id in (3, 5, 8, 10); 

--25.患者IDが2, 4, 6, 8のいずれかである診察レコードを検索してください。ただし、診察科が '小児科' であるものに限定します。
select
    * 
from
    examinations 
where
    patient_id in (2, 4, 6, 8) 
    and department_id = ( 
        select
            department_id 
        from
            departments 
        where
            department_name = '小児科'
    ); 

--26.診察日が2022年3月15日または5月20日であり、診察科が '外科' または '歯科' のいずれかである診察レコードを検索してください。ただし、患者IDが4であるものは除外します。
select
    * 
from
    examinations 
where
    ( 
        examination_date = '2022/03/15' 
        or examination_date = '2022/05/20'
    ) 
    and department_id in ( 
        select
            department_id 
        from
            departments 
        where
            department_name in ('外科', '歯科')
    ) 
    and patient_id not in (4); 

--27.検査日が2022年3月から2022年5月の間にある患者のうち、病院の外来で診察された患者の検査IDと診断結果を取得する。
select
    examination_id, diagnosis 
from
    examinations 
where
    examination_date between '2022-03-15' and '2022-05-20'; 

--28.検査日が2022年3月から5月の間にある患者で、診断結果に「胃潰瘍」という文字列が含まれている患者の検査ID、患者ID、医師ID、診断結果を取得する。
select
    examination_id
    , patient_id
    , doctor_id
    , diagnosis 
from
    examinations 
where
    examination_date between '2022-03-01' and '2022-05-31' 
    and diagnosis like '胃潰%'; 

--29.患者名、性別、診断、治療、および医師名を含む、すべての患者の詳細とその医師の情報を取得するSQL文を作成してください。
select
    p.patient_name
    , p.gender
    , e.diagnosis
    , e.treatment
    , d.doctor_name 
from
    patients p 
    inner join examinations e 
        on p.patient_id = e.patient_id 
    inner join doctors d 
        on e.doctor_id = d.doctor_id; 

--30.各診療科の診断の数を含む、診療科名と診断数を表示するSQL文を作成してください。
select
    d.department_name
    , count(*) as diagnosis_count 
from
    examinations e 
    inner join departments d 
        on e.department_id = d.department_id 
group by
    d.department_name; 

--31.医師の情報と診断名を結合し、診断名が "慢性中耳炎" である患者の氏名と診断日を表示するクエリ。
select
    p.patient_name
    , e.examination_date 
from
    patients as p 
    inner join examinations e 
        on p.patient_id = e.patient_id 
    inner join doctors d 
        on e.doctor_id = d.doctor_id 
where
    d.department_id = 1 
    and e.diagnosis = '慢性中耳炎'; 

--32.特定の科に所属する医師と、その医師が診断した患者の氏名と診断名を表示するクエリ。
select
    doctor_name
    , p.patient_name
    , e.diagnosis 
from
    patients p 
    inner join examinations e 
        on p.patient_id = e.patient_id 
    inner join doctors d 
        on e.doctor_id = d.doctor_id 
    inner join departments dep 
        on d.department_id = dep.department_id 
where
    dep.department_name = '外科'; 

--33.患者ごとに、彼らが最後に受けた検査の情報と、その検査を行った医師の情報を表示する。
--※（もし患者がまだ検査を受けていない場合は、NULL値が表示してください。）"
select
    p.patient_name
    , e.examination_date
    , d.doctor_name
    , de.department_name 
from
    patients p 
    left join ( 
        select
            examination_id
            , patient_id
            , doctor_id
            , department_id
            , examination_date 
        from
            examinations e1 
        where
            not exiete( 
                select
                    1 
                from
                    examinations e2 
                where
                    e1.patient_id = e2.patient_id 
                    and e1.examination_date < e2.examination_date
            )
    ) e 
        on p.patient_id = e.patient_id 
    left join doctors d 
        on e.doctor_id = d.doctor_id 
    left join departments de 
        on e.department_id = de.department_id;

