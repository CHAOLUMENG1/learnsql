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

--34.各部門ごとに、その部門で働く医師の平均給与と、その部門で行われた検査の数を表示する。
--※部門に医師がいない場合は、平均給与がNULL値として表示してください。また、部門に検査が行われていない場合は、検査数が0として表示してください。
select
    de.department_name
    , AVG(d.salary) as avg_salary
    , COUNT(e.examination_id) as num_exams 
from
    departments de 
    left join doctors d 
        on de.department_id = d.department_id 
    left join examinations e 
        on de.department_id = e.department_id 
group by
    de.department_id; 

--35.departmentsテーブルとdoctorsテーブルをdepartment_idで結合し、各部署の平均給与を取得するSQL文を作成してください。
select
    departments.department_name
    , AVG(doctors.salary) as avg_salary 
from
    departments 
    left join doctors 
        on departments.department_id = doctors.department_id 
group by
    departments.department_name; 

--36.patientsテーブルとexaminationsテーブルをpatient_idで結合し、診察を受けた患者の総数と最新の診察日を取得するSQL文を作成してください。
select
    patients.patient_name
    , COUNT(examinations.examination_id) as total_examinations
    , MAX(examinations.examination_date) as latest_examination 
from
    patients 
    left join examinations 
        on patients.patient_id = examinations.patient_id 
group by
    patients.patient_name; 

--37.医師の情報を、所属する部署の情報がある場合はそれも含めて表示するSQL文を作成してください。
select
    * 
from
    doctors 
    right join departments 
        on doctors.department_id = departments.department_id; 

--38.検査の情報を、患者の情報がある場合はそれも含めて表示するSQL文を作成してください。
select
    * 
from
    examinations 
    left join patients 
        on examinations.patient_id = patients.patient_id; 

--39.patientsテーブルとexaminationsテーブルをLEFT JOINし、各患者が最も最近行った検査の情報を取得するクエリを作成してください。
select
    p.patient_name
    , e.examination_id
    , e.examination_date
    , e.diagnosis
    , e.treatment 
from
    patients p 
    left join ( 
        select
            examination_id
            , patient_id
            , examination_date
            , diagnosis
            , treatment
            , ROW_NUMBER() over ( 
                partition by
                    patient_id 
                order by
                    examination_date desc
            ) as rn 
        from
            examinations
    ) e 
        on p.patient_id = e.patient_id 
        and e.rn = 1; 

--40.doctorsテーブルとdepartmentsテーブルをLEFT JOINし、各科の平均給与と最低給与を取得するクエリを作成してください。
select
    d.department_name
    , avg(doctor.salary) as avg_salary
    , min(doctor.salary) as min_salary 
from
    departments d 
    left join doctors doctor 
        on d.department_id = doctor.department_id 
group by
    d.department_name; 

--41.医者の名前、患者の名前、診断、治療内容、および診察日を含むレポートを作成してください。ただし、医者と患者がともに存在し、診断と治療内容が空でない場合にのみ、レポートに含めてください。レポートは、診察日が新しいものから古いものの順に並べ替える必要があります。
select
    doctors.doctor_name
    , patients.patient_name
    , examinations.diagnosis
    , examinations.treatment
    , examinations.examination_date 
from
    doctors 
    inner join examinations 
        on doctors.doctor_id = examinations.doctor_id 
    inner join patients 
        on examinations.patient_id = patients.patient_id 
where
    examinations.diagnosis <> '' 
    and examinations.treatment <> '' 
order by
    examinations.examination_date desc; 

--42.患者（patients）と医師（doctors）の情報を結合して、部署（departments）ごとの平均給与（salary）を表示するクエリを作成してください。
--ただし、部署名（department_name）が '内科' の部署は除外してください。
select
    d.department_id
    , d.department_name
    , avg(salary) as avg_salary 
from
    departments d 
    inner join doctors doc 
        on doc.department_id = d.department_id 
    inner join patients p 
        on p.gender = doc.gender 
where
    d.department_name <> '内科' 
group by
    d.department_id
    , d.department_name; 

--43.患者（patients）と検査（examinations）の情報を結合して、患者名（patient_name）と検査日（examination_date）ごとの医師数を表示するクエリを作成してください。
--ただし、患者名と検査日の組み合わせが存在しない場合は、0を表示してください。
select
    p.patient_name
    , e.examination_date
    , count(doc.doctor_id) as doctor_count 
from
    patients p 
    left join examinations e 
        on p.patient_id = e.patient_id 
    left join doctors doc 
        on doc.doctor_id = e.doctor_id 
group by
    p.patient_name
    , e.examination_date; 

--44.患者と医師の所属科とその科の説明の情報を結合するSQL文を作成してください。
select
    p.patient_name
    , d.doctor_name
    , de.department_name
    , de.description 
from
    patients p 
    inner join examinations e 
        on p.patient_id = e.patient_id 
    inner join doctors d 
        on e.doctor_id = d.doctor_id 
    left join departments de 
        on d.department_id = de.department_id; 

--45.患者の性別と年齢情報、医師の性別を結合するSQL文を作成してください。
select
    p.patient_name
    , p.gender as patient_gender
    , p.date_of_birth as patient_dob
    , d.doctor_name
    , d.gender as doctor_gender
    , date_part( 
        'year'
        , age( 
            current_date
            , to_date(p.date_of_birth, 'YYYY-MM-DD')
        )
    ) as patient_age 
from
    patients p 
    inner join examinations e 
        on p.patient_id = e.patient_id 
    inner join doctors d 
        on e.doctor_id = d.doctor_id; 

--46.全患者の中で、診断された病気の数が最も多いトップ5の患者を取得するためのクエリを作成してください。
--ただし、診断がない患者は結果に含めないでください。
select
    p.patient_name
    , count(*) as num_diagnoses 
from
    patients p 
    inner join examinations e 
        on p.patient_id = e.patient_id 
where
    e.diagnosis is not null 
group by
    p.patient_name 
order by
    num_diagnoses desc 
limit
    5; 

--47.医師ごとに、その医師が診察した患者の名前、性別、診察日、診断、および治療を取得するためのクエリを作成してください。
--ただし、全ての医師の情報を取得する必要があります。
select
    d.doctor_name, p.patient_name
    , p.gender
    , e.examination_date
    , e.diagnosis
    , e.treatment 
from
    doctors d 
    left join examinations e 
        on d.doctor_id = e.doctor_id 
    left join patients p 
        on e.patient_id = p.patient_id; 

--48.医師の平均給与を求める
select
    avg(salary) as avg_salary 
from
    doctors; 

--49.部署ごとの医師の平均給与を求める
select
    departments.department_name
    , avg(doctors.salary) as avg_salary 
from
    departments 
    inner join doctors 
        on departments.department_id = doctors.department_id 
group by
    departments.department_name; 

--***50.全患者の平均年齢を求める
SELECT
    AVG( 
        EXTRACT(YEAR FROM NOW()) - EXTRACT( 
            YEAR 
            FROM
                TO_DATE(patients.date_of_birth, 'YYYY-MM-DD')
        )
    ) AS avg_age 
FROM
    patients; 

--51.examinationsテーブルに登録された、各患者の診察回数を求めるSQL文を作成してください。
select
    patient_name
    , count(*) as examination_count 
from
    patients 
    inner join examinations 
        on patients.patient_id = examinations.patient_id 
group by
    patient_name; 

--52.患者の数をカウントするSQL文を作成してください。
select
    count(patient_id) as patient_count 
from
    patients; 

--53.各科の医師数をカウントするSQL文を作成してください。
select
    departments.department_name
    , count(doctors.doctor_id) as doctor_count 
from
    departments 
    inner join doctors 
        on departments.department_id = doctors.department_id 
group by
    departments.department_name; 

--54.各患者の最も古い検査日を取得する。
select
    patients.patient_name
    , min(examination_date) as old_examination_date 
from
    examinations 
    inner join patients 
        on examinations.patient_id = patients.patient_id 
group by
    patient_name; 

--55.最低給料を持つ医師を見つける。
select
    min(salary) as min_salary 
from
    doctors; 

--56.医師の最高給与を検索するSQL文を作成してください。
select
    max(salary) as max_salary 
from
    doctors; 

--57.各診療科の医師の最高給与を検索するSQL文を作成してください。
select
    departments.department_name
    , max(doctors.salary) as max_salary 
from
    departments 
    inner join doctors 
        on departments.department_id = doctors.department_id 
group by
    departments.department_name; 

--58.各患者の最新の診断を検索するSQL文を作成してください。
select
    patients.patient_name
    , examinations.diagnosis
    , max(examinations.examination_date) as latest_diagnosis_date 
from
    patients 
    inner join examinations 
        on patients.patient_id = examinations.patient_id 
group by
    patients.patient_name
    , examinations.diagnosis; 

--59.各部門の医師の平均給与と総支払額を計算するSQL文を作成してください。
select
    departments.department_name
    , avg(doctors.salary) as avg_salary
    , sum(doctors.salary) as total_salary_paid 
from
    departments 
    inner join doctors 
        on departments.department_id = doctors.department_id 
group by
    departments.department_name; 

--60.「歯科」所属する医師の給与総額を計算するSQL文を作成してください。
select
    departments.department_name
    , sum(doctors.salary) as total_salary 
from
    departments 
    inner join doctors 
        on departments.department_id = doctors.department_id 
where
    departments.department_name = '歯科' 
group by
    departments.department_name; 

--61.各部門の平均給与を取得するSQL文を作成してください。
select
    department_id
    , avg(salary) as avg_salary 
from
    doctors 
group by
    department_id; 

--62.各患者が受けた診察の数を取得するSQL文を作成してください。
select
    patient_id
    , count(*) as exam_count 
from
    examinations 
group by
    patient_id; 

--63.各部署の平均給与と最高給与を取得するクエリを作成してください。
select
    departments.department_name
    , avg(doctors.salary) as avg_salary
    , max(doctors.salary) as max_salary 
from
    doctors 
    inner join departments 
        on doctors.department_id = departments.department_id 
group by
    departments.department_name; 

--64.患者ごとの最後の検査の診断を取得するSQL文を作成してください。
select
    p.patient_name
    , e.diagnosis 
from
    patients p join examinations e 
        on p.patient_id = e.patient_id 
where
    e.examination_date = ( 
        select
            max(examination_date) 
        from
            examinations 
        where
            patient_id = p.patient_id
    ); 

--***65.各診療科の医師の患者数と、その患者たちの平均年齢を求めよ。
--ただし、各診療科の医師は1名以上所属しているものとする。
--また、平均年齢は小数点以下2桁まで表示するものとする。
SELECT
    d.department_name
    , COUNT(DISTINCT e.patient_id) AS patient_count
    , ROUND( 
        AVG( 
            EXTRACT( 
                YEAR 
                FROM
                    age(to_date(p.date_of_birth, 'YYYY-MM-DD'))
            )
        ) 
        , 2
    ) AS avg_age 
FROM
    departments d JOIN doctors doc 
        ON d.department_id = doc.department_id JOIN examinations e 
        ON doc.doctor_id = e.doctor_id JOIN patients p 
        ON e.patient_id = p.patient_id 
GROUP BY
    d.department_name 
HAVING
    COUNT(DISTINCT e.patient_id) > 0;

